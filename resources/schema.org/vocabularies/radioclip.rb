require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Clip, 'mida_vocabulary/vocabularies/schemaorg/clip'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Season, 'mida_vocabulary/vocabularies/schemaorg/season'
    autoload :Series, 'mida_vocabulary/vocabularies/schemaorg/series'

    # A short radio program or a segment/part of a radio program.
    class RadioClip < Mida::Vocabulary
      itemtype %r{http://schema.org/RadioClip}i
      include_vocabulary Mida::SchemaOrg::Clip
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

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
    end

  end
end
