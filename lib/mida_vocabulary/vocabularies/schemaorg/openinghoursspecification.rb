require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :DayOfWeek, 'mida_vocabulary/vocabularies/schemaorg/dayofweek'

    # A structured value providing information about the opening hours of a place or a certain service inside a place.
    class OpeningHoursSpecification < Mida::Vocabulary
      itemtype %r{http://schema.org/OpeningHoursSpecification}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The closing hour of the place or service on the given day(s) of the week.
      has_many 'closes' do
        extract Mida::DataType::Time
      end

      # The day of the week for which these opening hours are valid.
      has_many 'dayOfWeek' do
        extract Mida::SchemaOrg::DayOfWeek
      end

      # The opening hour of the place or service on the given day(s) of the week.
      has_many 'opens' do
        extract Mida::DataType::Time
      end

      # The date when the item becomes valid.
      has_many 'validFrom' do
        extract Mida::DataType::ISO8601Date
      end

      # The end of the validity of offer, price specification, or opening hours data.
      has_many 'validThrough' do
        extract Mida::DataType::ISO8601Date
      end
    end

  end
end
