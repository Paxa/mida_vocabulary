require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    class Address < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Address}i
      include_vocabulary Mida::DataVocabulary::Item

      for field in %w{street-address locality region postal-code country-name}
        has_many field
      end
    end
  end
end
