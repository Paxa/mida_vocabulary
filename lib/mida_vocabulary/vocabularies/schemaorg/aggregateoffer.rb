require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Offer, 'mida_vocabulary/vocabularies/schemaorg/offer'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # When a single product is associated with multiple offers (for example, the same pair of shoes is offered by different merchants), then AggregateOffer can be used.
    class AggregateOffer < Mida::Vocabulary
      itemtype %r{http://schema.org/AggregateOffer}i
      include_vocabulary Mida::SchemaOrg::Offer
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
