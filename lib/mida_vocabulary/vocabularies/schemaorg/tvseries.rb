require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :TVEpisode, 'mida_vocabulary/vocabularies/schemaorg/tvepisode'
    autoload :MusicGroup, 'mida_vocabulary/vocabularies/schemaorg/musicgroup'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :TVSeason, 'mida_vocabulary/vocabularies/schemaorg/tvseason'
    autoload :VideoObject, 'mida_vocabulary/vocabularies/schemaorg/videoobject'

    # A television series.
    class TVSeries < Mida::Vocabulary
      itemtype %r{http://schema.org/TVSeries}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork

      # A cast member of the movie, TV series, season, or episode, or video.
      has_many 'actors' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The director of the movie, TV episode, or series.
      has_many 'director' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The end date and time of the event (in ISO 8601 date format).
      has_many 'endDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The episode of a TV series or season.
      has_many 'episodes' do
        extract Mida::SchemaOrg::TVEpisode
        extract Mida::DataType::Text
      end

      # The composer of the movie or TV soundtrack.
      has_many 'musicBy' do
        extract Mida::SchemaOrg::MusicGroup
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The number of episodes in this season or series.
      has_many 'numberOfEpisodes' do
        extract Mida::DataType::Number
      end

      # The producer of the movie, TV series, season, or episode, or video.
      has_many 'producer' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The production company or studio that made the movie, TV series, season, or episode, or video.
      has_many 'productionCompany' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # The seasons of the TV series.
      has_many 'seasons' do
        extract Mida::SchemaOrg::TVSeason
        extract Mida::DataType::Text
      end

      # The start date and time of the event (in ISO 8601 date format).
      has_many 'startDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The trailer of the movie or TV series, season, or episode.
      has_many 'trailer' do
        extract Mida::SchemaOrg::VideoObject
        extract Mida::DataType::Text
      end
    end

  end
end
