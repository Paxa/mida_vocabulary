require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A datasheet or vendor specification of a product (in the sense of a prototypical description).
    class ProductModel < Mida::Vocabulary
      itemtype %r{http://schema.org/ProductModel}i
      include_vocabulary Mida::SchemaOrg::Product
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
