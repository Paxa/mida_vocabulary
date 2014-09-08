require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'

    # A structured value providing information about when a certain organization or person owned a certain product.
    class OwnershipInfo < Mida::Vocabulary
      itemtype %r{http://schema.org/OwnershipInfo}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The organization or person from which the product was acquired.
      has_many 'acquiredFrom' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The date and time of obtaining the product.
      has_many 'ownedFrom' do
        extract Mida::DataType::ISO8601Date
      end

      # The date and time of giving up ownership on the product.
      has_many 'ownedThrough' do
        extract Mida::DataType::ISO8601Date
      end

      # The product that this structured value is referring to.
      has_many 'typeOfGood' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end
    end

  end
end
