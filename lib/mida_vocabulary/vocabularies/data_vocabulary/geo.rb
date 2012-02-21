require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    class Geo < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Geo}i
      include_vocabulary Mida::DataVocabulary::Item

      for field in %w{latitude longitude}
        has_many field do
          extract Mida::DataType::Float
        end
      end

      has_many 'itemreviewed' do
        extract Mida::DataVocabulary::Item
      end
    end
  end
end
