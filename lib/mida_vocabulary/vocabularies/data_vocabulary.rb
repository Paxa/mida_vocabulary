module Mida
  module DataVocabulary
    def self.const_missing(name)
      filename = File.dirname(__FILE__) + "/data_vocabulary/#{name.to_s.downcase}.rb"
      load filename
      require filename
      const_get(name, false) if const_defined?(name, false)
    end
  end
end
