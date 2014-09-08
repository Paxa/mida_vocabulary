require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Class, 'mida_vocabulary/vocabularies/schemaorg/class'
    autoload :Property, 'mida_vocabulary/vocabularies/schemaorg/property'

    # A property, used to indicate attributes and relationships of some Thing; equivalent to rdf:Property.
    class Property < Mida::Vocabulary
      itemtype %r{http://schema.org/Property}i
      include_vocabulary Mida::SchemaOrg::Thing

      # Relates a property to a class that is (one of) the type(s) the property is expected to be used on.
      has_many 'domainIncludes' do
        extract Mida::SchemaOrg::Class
        extract Mida::DataType::Text
      end

      # Relates a property to a property that is its inverse. Inverse properties relate the same pairs of items to each other, but in reversed direction. For example, the 'alumni' and 'alumniOf' properties are inverseOf each other. Some properties don't have explicit inverses; in these situations RDFa and JSON-LD syntax for reverse properties can be used.
      has_many 'inverseOf' do
        extract Mida::SchemaOrg::Property
        extract Mida::DataType::Text
      end

      # Relates a property to a class that constitutes (one of) the expected type(s) for values of the property.
      has_many 'rangeIncludes' do
        extract Mida::SchemaOrg::Class
        extract Mida::DataType::Text
      end

      # Relates a property to one that supercedes it.
      has_many 'supercededBy' do
        extract Mida::SchemaOrg::Property
        extract Mida::DataType::Text
      end
    end

  end
end
