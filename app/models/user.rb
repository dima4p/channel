# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  first_name          :string
#  last_name           :string
#  email               :string
#  active              :boolean          default(FALSE), not null
#  roles_mask          :integer          default(0), not null
#  persistence_token   :string
#  crypted_password    :string
#  password_salt       :string
#  perishable_token    :string           not null
#  single_access_token :string           not null
#  login_count         :integer          default(0), not null
#  failed_login_count  :integer          default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string
#  last_login_ip       :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  timezone            :string
#  inviter_id          :bigint
#
# Indexes
#
#  index_users_on_inviter_id  (inviter_id)
#

# Model User defines the users of the application
#
class User < ApplicationRecord

  EMAIL_REGEXP = /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+\z/

  attribute :password_confirmation
  belongs_to :inviter, class_name: 'User', inverse_of: :invitees, optional: true
  has_many :invitees, class_name: 'User', inverse_of: :inviter, foreign_key: :inviter_id

  scope :ordered, -> { order(:first_name, :last_name) }

  validates :name, presence: true
  validates :timezone, presence: true
  acts_as_authentic do |config|
#     config.validates_length_of_login_field_options minimum: 4
#     config.validates_format_of_login_field_options with: /\A[-_@0-9a-zA-Z ]+\Z/,
#       message: I18n.t('authlogic.error_messages.login_invalid')
    # config.merge_validates_length_of_password_field_optionsminimum: 8
    #config.transition_from_crypto_providers = Authlogic::CryptoProviders::Sha512,
    config.crypto_provider = Authlogic::CryptoProviders::SCrypt
  end

  before_validation :squish_values
  before_validation :fill_non_nulls
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEXP}

  # adding news roles do not change the order
  ROLES = %w[admin enabled]

  def name
    [first_name, last_name].reject(&:blank?).join(' ')
  end

  def activate!
    update_attribute :active, true
  end

  def deliver_activation_instructions!
    reset_perishable_token!
    UserMailer.activation_instructions(self).deliver
  end

  def deliver_welcome!
    reset_perishable_token!
    UserMailer.welcome(self).deliver
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.password_reset_instructions(self).deliver
  end

  def enabled?
    is? 'enabled'
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum if roles
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  def set_admin_for_first!
    if User.limit(2).count == 1
      self.roles = ['admin']
      self.active = true
      save
    end
  end

  private

  def squish_values
    %w[first_name last_name email].each do |field|
      self.send(field).squish! if self.send(field)
    end
  end

  def fill_non_nulls
    self.perishable_token ||= Authlogic::Random.friendly_token
    self.single_access_token ||= Authlogic::Random.friendly_token
  end
end
