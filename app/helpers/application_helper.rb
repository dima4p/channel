module ApplicationHelper

  def locales_for_select
    I18n.available_locales.map do |locale|
      [I18n.translate('locale.native_name', locale: locale), locale]
    end
  end

end
