require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An offer to transfer some rights to an item or to provide a service - for example, an offer to sell tickets to an event, to rent the DVD of a movie, to stream a TV show over the internet, to repair a motorcycle, or to loan a book.
    class Offer < Mida::Vocabulary
      itemtype %r{http://schema.org/Offer}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
