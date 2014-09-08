require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'
    autoload :PriceSpecification, 'mida_vocabulary/vocabularies/schemaorg/pricespecification'

    # A structured value representing a monetary amount. Typically, only the subclasses of this type are used for markup.
    class PriceSpecification < Mida::Vocabulary
      itemtype %r{http://schema.org/PriceSpecification}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.
      has_many 'eligibleQuantity' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.
      has_many 'eligibleTransactionVolume' do
        extract Mida::SchemaOrg::PriceSpecification
        extract Mida::DataType::Text
      end

      # The highest price if the price is a range.
      has_many 'maxPrice' do
        extract Mida::DataType::Number
      end

      # The lowest price if the price is a range.
      has_many 'minPrice' do
        extract Mida::DataType::Number
      end

      # The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes.
      has_many 'price' do
        extract Mida::DataType::Number
        extract Mida::DataType::Text
      end

      # The currency (in 3-letter ISO 4217 format) of the price or a price component, when attached to PriceSpecification and its subtypes.
      has_many 'priceCurrency'

      # The date when the item becomes valid.
      has_many 'validFrom' do
        extract Mida::DataType::ISO8601Date
      end

      # The end of the validity of offer, price specification, or opening hours data.
      has_many 'validThrough' do
        extract Mida::DataType::ISO8601Date
      end

      # Specifies whether the applicable value-added tax (VAT) is included in the price specification or not.
      has_many 'valueAddedTaxIncluded' do
        extract Mida::DataType::Boolean
      end
    end

  end
end
