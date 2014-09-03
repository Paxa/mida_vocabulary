require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PriceSpecification, 'mida_vocabulary/vocabularies/schemaorg/pricespecification'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The price asked for a given offer by the respective organization or person.
    class UnitPriceSpecification < Mida::Vocabulary
      itemtype %r{http://schema.org/UnitPriceSpecification}i
      include_vocabulary Mida::SchemaOrg::PriceSpecification
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
