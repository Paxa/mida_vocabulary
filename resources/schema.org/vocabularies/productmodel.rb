require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :ProductModel, 'mida_vocabulary/vocabularies/schemaorg/productmodel'

    # A datasheet or vendor specification of a product (in the sense of a prototypical description).
    class ProductModel < Mida::Vocabulary
      itemtype %r{http://schema.org/ProductModel}i
      include_vocabulary Mida::SchemaOrg::Product
      include_vocabulary Mida::SchemaOrg::Thing

      # A pointer to a base product from which this product is a variant. It is safe to infer that the variant inherits all product features from the base model, unless defined locally. This is not transitive.
      has_many 'isVariantOf' do
        extract Mida::SchemaOrg::ProductModel
        extract Mida::DataType::Text
      end

      # A pointer from a previous, often discontinued variant of the product to its newer variant.
      has_many 'predecessorOf' do
        extract Mida::SchemaOrg::ProductModel
        extract Mida::DataType::Text
      end

      # A pointer from a newer variant of a product  to its previous, often discontinued predecessor.
      has_many 'successorOf' do
        extract Mida::SchemaOrg::ProductModel
        extract Mida::DataType::Text
      end
    end

  end
end
