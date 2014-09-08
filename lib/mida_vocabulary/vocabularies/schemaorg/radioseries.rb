require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Series, 'mida_vocabulary/vocabularies/schemaorg/series'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :Episode, 'mida_vocabulary/vocabularies/schemaorg/episode'
    autoload :MusicGroup, 'mida_vocabulary/vocabularies/schemaorg/musicgroup'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Season, 'mida_vocabulary/vocabularies/schemaorg/season'
    autoload :VideoObject, 'mida_vocabulary/vocabularies/schemaorg/videoobject'

    # Series dedicated to radio broadcast and associated online delivery.
    class RadioSeries < Mida::Vocabulary
      itemtype %r{http://schema.org/RadioSeries}i
      include_vocabulary Mida::SchemaOrg::Series
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # A cast member of the movie, tv/radio series, season, episode, or video. Supercedes actors.
      has_many 'actor' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The director of the movie, tv/radio episode or series. Supercedes directors.
      has_many 'director' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # An episode of a TV/radio series or season Supercedes episodes.
      has_many 'episode' do
        extract Mida::SchemaOrg::Episode
        extract Mida::DataType::Text
      end

      # The composer of the movie or TV/radio soundtrack.
      has_many 'musicBy' do
        extract Mida::SchemaOrg::MusicGroup
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The number of episodes in this season or series.
      has_many 'numberOfEpisodes' do
        extract Mida::DataType::Number
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

      # A season in a tv/radio series. Supercedes seasons.
      has_many 'season' do
        extract Mida::SchemaOrg::Season
        extract Mida::DataType::Text
      end

      # The trailer of a movie or tv/radio series, season, or episode.
      has_many 'trailer' do
        extract Mida::SchemaOrg::VideoObject
        extract Mida::DataType::Text
      end
    end

  end
end
