module Mida
  module DataVocabulary
    def self.const_missing(name)
      filename = File.dirname(__FILE__) + "/data_vocabulary/#{name.to_s.downcase}.rb"

      require filename
      load filename unless self.const_defined?(name, false)

      const_get(name, false) if const_defined?(name, false)
    end

    def self.forget_all!
      constants.each do |name|
        remove_const(name)
      end
    end
  end
end
