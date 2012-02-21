require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    autoload :Organization, 'mida_vocabulary/vocabularies/data_vocabulary/organization'
    autoload :Address, 'mida_vocabulary/vocabularies/data_vocabulary/address'

    class Person < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Person}i
      include_vocabulary Mida::DataVocabulary::Item

      for field in %w{name nickname photo title role affiliation }
        has_many field
      end

      has_many('url') { extract Mida::DataType::URL }

      has_many 'address' do
        extract Mida::DataVocabulary::Address
      end

      has_many 'acquaintance' do
        extract self
        extract Mida::DataType::Text
      end

      has_many 'friend' do
        extract self
        extract Mida::DataType::Text
      end
    end
  end
end
