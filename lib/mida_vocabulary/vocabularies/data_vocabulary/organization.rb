require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    autoload :Geo, 'mida_vocabulary/vocabularies/data_vocabulary/geo'

    class Organization < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Organization}i
      include_vocabulary Mida::DataVocabulary::Item

      for field in %w{name url tel}
        has_many field
      end

      has_many 'geo' do
        extract Mida::DataVocabulary::Geo
        extract Mida::DataType::Text
      end
    end
  end
end