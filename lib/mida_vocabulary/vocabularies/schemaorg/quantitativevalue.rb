require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A point value or interval for product characteristics and other purposes.
    class QuantitativeValue < Mida::Vocabulary
      itemtype %r{http://schema.org/QuantitativeValue}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
