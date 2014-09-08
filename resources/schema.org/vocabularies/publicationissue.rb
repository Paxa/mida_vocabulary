require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A part of a successively published publication such as a periodical or publication volume, often numbered, usually containing a grouping of works such as articles.
    class PublicationIssue < Mida::Vocabulary
      itemtype %r{http://schema.org/PublicationIssue}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # Identifies the issue of publication; for example, "iii" or "2".
      has_many 'issueNumber' do
        extract Mida::DataType::Integer
        extract Mida::DataType::Text
      end

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
    end

  end
end
