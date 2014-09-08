require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :DataCatalog, 'mida_vocabulary/vocabularies/schemaorg/datacatalog'
    autoload :DataDownload, 'mida_vocabulary/vocabularies/schemaorg/datadownload'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # A body of structured information describing some topic(s) of interest.
    class Dataset < Mida::Vocabulary
      itemtype %r{http://schema.org/Dataset}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # A data catalog which contains a dataset.
      has_many 'catalog' do
        extract Mida::SchemaOrg::DataCatalog
        extract Mida::DataType::Text
      end

      # A downloadable form of this dataset, at a specific location, in a specific format.
      has_many 'distribution' do
        extract Mida::SchemaOrg::DataDownload
        extract Mida::DataType::Text
      end

      # The range of spatial applicability of a dataset, e.g. for a dataset of New York weather, the state of New York.
      has_many 'spatial' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # The range of temporal applicability of a dataset, e.g. for a 2011 census dataset, the year 2011 (in ISO 8601 time interval format).
      has_many 'temporal' do
        extract Mida::DataType::ISO8601Date
      end
    end

  end
end
