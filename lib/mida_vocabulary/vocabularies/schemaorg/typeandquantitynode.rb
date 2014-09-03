require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A structured value indicating the quantity, unit of measurement, and business function of goods included in a bundle offer.
    class TypeAndQuantityNode < Mida::Vocabulary
      itemtype %r{http://schema.org/TypeAndQuantityNode}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
