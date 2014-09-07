module Mida
  module SchemaOrg
    def self.const_missing(name)
      filename = File.dirname(__FILE__) + "/schemaorg/#{name.to_s.downcase}.rb"
      #puts "Const missing #{name} #{filename}"
      load filename
      require filename
      const_get(name, false) if const_defined?(name, false)
    end
  end
end

#Dir.glob(File.dirname(__FILE__) + '/schemaorg/*.rb') {|file| require file}
