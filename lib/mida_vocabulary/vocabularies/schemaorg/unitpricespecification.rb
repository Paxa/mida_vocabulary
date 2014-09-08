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

      # This property specifies the minimal quantity and rounding increment that will be the basis for the billing. The unit of measurement is specified by the unitCode property.
      has_many 'billingIncrement' do
        extract Mida::DataType::Number
      end

      # A short text or acronym indicating multiple price specifications for the same offer, e.g. SRP for the suggested retail price or INVOICE for the invoice price, mostly used in the car industry.
      has_many 'priceType'

      # The unit of measurement given using the UN/CEFACT Common Code (3 characters).
      has_many 'unitCode'
    end

  end
end
