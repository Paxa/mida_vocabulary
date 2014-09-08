require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Season, 'mida_vocabulary/vocabularies/schemaorg/season'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Episode, 'mida_vocabulary/vocabularies/schemaorg/episode'
    autoload :Series, 'mida_vocabulary/vocabularies/schemaorg/series'
    autoload :VideoObject, 'mida_vocabulary/vocabularies/schemaorg/videoobject'

    # Season dedicated to radio broadcast and associated online delivery.
    class RadioSeason < Mida::Vocabulary
      itemtype %r{http://schema.org/RadioSeason}i
      include_vocabulary Mida::SchemaOrg::Season
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

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

      # The trailer of a movie or tv/radio series, season, or episode.
      has_many 'trailer' do
        extract Mida::SchemaOrg::VideoObject
        extract Mida::DataType::Text
      end
    end

  end
end
