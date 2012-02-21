require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    class Breadcrumb < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Breadcrumb}i
      include_vocabulary Mida::DataVocabulary::Item

      has_many 'title'
      has_many('url') { extract Mida::DataType::URL }
      has_many('child') { extract self }
    end
  end
end
