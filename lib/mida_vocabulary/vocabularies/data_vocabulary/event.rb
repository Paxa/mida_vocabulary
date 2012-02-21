require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    autoload :Organization, 'mida_vocabulary/vocabularies/data_vocabulary/organization'
    autoload :Geo, 'mida_vocabulary/vocabularies/data_vocabulary/geo'
    autoload :Offer, 'mida_vocabulary/vocabularies/data_vocabulary/offer'
    autoload :OfferAggregate, 'mida_vocabulary/vocabularies/data_vocabulary/offer_aggregate'

    class Event < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Event}i
      include_vocabulary Mida::DataVocabulary::Item

      for field in %w{summary url description eventType photo}
        has_many field
      end

      for field in %w{startDate dtstart endDate dtend duration}
        has_many(field) { extract Mida::DataType::ISO8601Date }
      end

      has_many 'location' do
        extract Mida::DataVocabulary::Organization
        extract Mida::DataVocabulary::Geo
        extract Mida::DataType::Text
      end

      has_many 'tickets' do
        extract Mida::DataVocabulary::Offer
      end

      has_many 'ticketAggregate' do
        extract Mida::DataVocabulary::OfferAggregate
      end
    end
  end
end
