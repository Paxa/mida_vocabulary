require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'
    autoload :WarrantyScope, 'mida_vocabulary/vocabularies/schemaorg/warrantyscope'

    # A structured value representing the duration and scope of services that will be provided to a customer free of charge in case of a defect or malfunction of a product.
    class WarrantyPromise < Mida::Vocabulary
      itemtype %r{http://schema.org/WarrantyPromise}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The duration of the warranty promise. Common unitCode values are ANN for year, MON for months, or DAY for days.
      has_many 'durationOfWarranty' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The scope of the warranty promise.
      has_many 'warrantyScope' do
        extract Mida::SchemaOrg::WarrantyScope
      end
    end

  end
end
