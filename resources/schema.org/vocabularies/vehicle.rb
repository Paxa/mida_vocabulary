require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A vehicle.
    class Vehicle < Mida::Vocabulary
      itemtype %r{http://schema.org/Vehicle}i
      include_vocabulary Mida::SchemaOrg::Product
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
