require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Enumeration, 'mida_vocabulary/vocabularies/schemaorg/enumeration'
    autoload :StructuredValue, 'mida_vocabulary/vocabularies/schemaorg/structuredvalue'

    # A point value or interval for product characteristics and other purposes.
    class QuantitativeValue < Mida::Vocabulary
      itemtype %r{http://schema.org/QuantitativeValue}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The upper value of some characteristic or property.
      has_many 'maxValue' do
        extract Mida::DataType::Number
      end

      # The lower value of some characteristic or property.
      has_many 'minValue' do
        extract Mida::DataType::Number
      end

      # The unit of measurement given using the UN/CEFACT Common Code (3 characters).
      has_many 'unitCode'

      # The value of the product characteristic.
      has_many 'value' do
        extract Mida::DataType::Number
      end

      # A pointer to a secondary value that provides additional information on the original value, e.g. a reference temperature.
      has_many 'valueReference' do
        extract Mida::SchemaOrg::Enumeration
        extract Mida::SchemaOrg::StructuredValue
        extract Mida::DataType::Text
      end
    end

  end
end
