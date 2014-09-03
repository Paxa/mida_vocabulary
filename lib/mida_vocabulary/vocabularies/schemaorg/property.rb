require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A property, used to indicate attributes and relationships of some Thing; equivalent to rdf:Property.
    class Property < Mida::Vocabulary
      itemtype %r{http://schema.org/Property}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
