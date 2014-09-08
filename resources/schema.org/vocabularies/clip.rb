require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Episode, 'mida_vocabulary/vocabularies/schemaorg/episode'
    autoload :Season, 'mida_vocabulary/vocabularies/schemaorg/season'
    autoload :Series, 'mida_vocabulary/vocabularies/schemaorg/series'
    autoload :PublicationEvent, 'mida_vocabulary/vocabularies/schemaorg/publicationevent'

    # A short TV or radio program or a segment/part of a program.
    class Clip < Mida::Vocabulary
      itemtype %r{http://schema.org/Clip}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # Position of the clip within an ordered group of clips.
      has_many 'clipNumber' do
        extract Mida::DataType::Integer
        extract Mida::DataType::Text
      end

      # The episode to which this clip belongs.
      has_many 'partOfEpisode' do
        extract Mida::SchemaOrg::Episode
        extract Mida::DataType::Text
      end

      # The season to which this episode belongs.
      has_many 'partOfSeason' do
        extract Mida::SchemaOrg::Season
        extract Mida::DataType::Text
      end

      # The series to which this episode or season belongs. Supercedes partOfTVSeries.
      has_many 'partOfSeries' do
        extract Mida::SchemaOrg::Series
        extract Mida::DataType::Text
      end

      # A publication event associated with the episode, clip or media object.
      has_many 'publication' do
        extract Mida::SchemaOrg::PublicationEvent
        extract Mida::DataType::Text
      end
    end

  end
end
