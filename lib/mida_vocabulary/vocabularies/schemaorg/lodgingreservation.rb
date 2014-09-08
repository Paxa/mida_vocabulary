require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Reservation, 'mida_vocabulary/vocabularies/schemaorg/reservation'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :QualitativeValue, 'mida_vocabulary/vocabularies/schemaorg/qualitativevalue'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'

    # A reservation for lodging at a hotel, motel, inn, etc.
    class LodgingReservation < Mida::Vocabulary
      itemtype %r{http://schema.org/LodgingReservation}i
      include_vocabulary Mida::SchemaOrg::Reservation
      include_vocabulary Mida::SchemaOrg::Thing

      # The earliest someone may check into a lodging establishment.
      has_many 'checkinTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The latest someone may check out of a lodging establishment.
      has_many 'checkoutTime' do
        extract Mida::DataType::ISO8601Date
      end

      # A full description of the lodging unit.
      has_many 'lodgingUnitDescription'

      # Textual description of the unit type (including suite vs. room, size of bed, etc.).
      has_many 'lodgingUnitType' do
        extract Mida::SchemaOrg::QualitativeValue
        extract Mida::DataType::Text
      end

      # The number of adults staying in the unit.
      has_many 'numAdults' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The number of children staying in the unit.
      has_many 'numChildren' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end
    end

  end
end
