module ActiveRecord
  module AttributeMethods
    def attributes_for_new
      @attributes.to_hash.except *%w[id created_at updated_at]
    end
  end
end
