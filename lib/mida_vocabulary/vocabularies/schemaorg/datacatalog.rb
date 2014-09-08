require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Dataset, 'mida_vocabulary/vocabularies/schemaorg/dataset'

    # A collection of datasets.
    class DataCatalog < Mida::Vocabulary
      itemtype %r{http://schema.org/DataCatalog}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # A dataset contained in a catalog.
      has_many 'dataset' do
        extract Mida::SchemaOrg::Dataset
        extract Mida::DataType::Text
      end
    end

  end
end
