module Mida
  module SchemaOrg
    def self.const_missing(name)
      filename = File.dirname(__FILE__) + "/schemaorg/#{name.to_s.downcase}.rb"
      #puts "Const missing #{name} #{filename}"

      require filename
      load filename unless self.const_defined?(name, false)

      self.const_get(name, false) if self.const_defined?(name, false)
    end

    def self.forget_all!
      constants.each do |name|
        remove_const(name)
      end
    end
  end
end
