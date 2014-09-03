require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A placeholder for multiple similar products of the same kind.
    class SomeProducts < Mida::Vocabulary
      itemtype %r{http://schema.org/SomeProducts}i
      include_vocabulary Mida::SchemaOrg::Product
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
