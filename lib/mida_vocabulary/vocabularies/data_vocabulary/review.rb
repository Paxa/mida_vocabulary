require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    autoload :Organization, 'mida_vocabulary/vocabularies/data_vocabulary/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/data_vocabulary/person'
    
    class Review < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Review}i
      include_vocabulary Mida::DataVocabulary::Item

      has_one('rating') { extract Mida::DataType::Number }

      has_one 'reviewer' do
        extract Mida::DataVocabulary::Person
        extract Mida::DataType::Text
      end

      has_many('dtreviewed') { extract Mida::DataType::ISO8601Date }

      has_many 'description'
      has_many 'summary'
      
      has_many 'itemreviewed' do
        extract Mida::DataVocabulary::Item
        extract Mida::DataType::Text
      end
    end
  end
end
