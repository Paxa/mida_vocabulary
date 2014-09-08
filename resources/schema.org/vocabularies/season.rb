require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Episode, 'mida_vocabulary/vocabularies/schemaorg/episode'
    autoload :Series, 'mida_vocabulary/vocabularies/schemaorg/series'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :VideoObject, 'mida_vocabulary/vocabularies/schemaorg/videoobject'

    # A TV or radio season.
    class Season < Mida::Vocabulary
      itemtype %r{http://schema.org/Season}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The end date and time of the role, event or item (in ISO 8601 date format).
      has_many 'endDate' do
        extract Mida::DataType::ISO8601Date
      end

      # An episode of a TV/radio series or season Supercedes episodes.
      has_many 'episode' do
        extract Mida::SchemaOrg::Episode
        extract Mida::DataType::Text
      end

      # The number of episodes in this season or series.
      has_many 'numberOfEpisodes' do
        extract Mida::DataType::Number
      end

      # The series to which this episode or season belongs. Supercedes partOfTVSeries.
      has_many 'partOfSeries' do
        extract Mida::SchemaOrg::Series
        extract Mida::DataType::Text
      end

      # The producer of the movie, tv/radio series, season, or episode, or video.
      has_many 'producer' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The production company or studio that made the movie, tv/radio series, season, or episode, or media object.
      has_many 'productionCompany' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # Position of the season within an ordered group of seasons.
      has_many 'seasonNumber' do
        extract Mida::DataType::Integer
        extract Mida::DataType::Text
      end

      # The start date and time of the event, role or item (in ISO 8601 date format).
      has_many 'startDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The trailer of a movie or tv/radio series, season, or episode.
      has_many 'trailer' do
        extract Mida::SchemaOrg::VideoObject
        extract Mida::DataType::Text
      end
    end

  end
end
