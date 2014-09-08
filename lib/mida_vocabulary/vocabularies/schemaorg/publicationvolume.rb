require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A part of a successively published publication such as a periodical or multi-volume work, often numbered. It may represent a time span, such as a year.
    class PublicationVolume < Mida::Vocabulary
      itemtype %r{http://schema.org/PublicationVolume}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The page on which the work ends; for example "138" or "xvi".
      has_many 'pageEnd' do
        extract Mida::DataType::Integer
        extract Mida::DataType::Text
      end

      # The page on which the work starts; for example "135" or "xiii".
      has_many 'pageStart' do
        extract Mida::DataType::Integer
        extract Mida::DataType::Text
      end

      # Any description of pages that is not separated into pageStart and pageEnd; for example, "1-6, 9, 55" or "10-12, 46-49".
      has_many 'pagination'

      # Identifies the volume of publication or multi-part work; for example, "iii" or "2".
      has_many 'volumeNumber' do
        extract Mida::DataType::Integer
        extract Mida::DataType::Text
      end
    end

  end
end
