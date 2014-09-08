require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Reservation, 'mida_vocabulary/vocabularies/schemaorg/reservation'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'

    # A reservation to dine at a food-related business.
    class FoodEstablishmentReservation < Mida::Vocabulary
      itemtype %r{http://schema.org/FoodEstablishmentReservation}i
      include_vocabulary Mida::SchemaOrg::Reservation
      include_vocabulary Mida::SchemaOrg::Thing

      # The endTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to end.
      # For actions that span a period of time, when the action was performed. e.g. John wrote a book from January to *December*.
      # Note that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.

      has_many 'endTime' do
        extract Mida::DataType::ISO8601Date
      end

      # Number of people the reservation should accommodate.
      has_many 'partySize' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The startTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to start.
      # For actions that span a period of time, when the action was performed. e.g. John wrote a book from *January* to December.
      # Note that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.

      has_many 'startTime' do
        extract Mida::DataType::ISO8601Date
      end
    end

  end
end
