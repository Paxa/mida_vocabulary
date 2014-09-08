require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A single, identifiable product instance (e.g. a laptop with a particular serial number).
    class IndividualProduct < Mida::Vocabulary
      itemtype %r{http://schema.org/IndividualProduct}i
      include_vocabulary Mida::SchemaOrg::Product
      include_vocabulary Mida::SchemaOrg::Thing

      # The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.
      has_many 'serialNumber'
    end

  end
end
