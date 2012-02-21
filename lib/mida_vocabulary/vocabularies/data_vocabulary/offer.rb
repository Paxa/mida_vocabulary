require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    autoload :Product, 'mida_vocabulary/vocabularies/data_vocabulary/product'
    autoload :Organization, 'mida_vocabulary/vocabularies/data_vocabulary/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/data_vocabulary/person'
    
    class Offer < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Offer}i
      include_vocabulary Mida::DataVocabulary::Item

      for field in %w{price currency}
        has_many field
      end

      has_many 'priceValidUntil' do
        extract Mida::DataType::ISO8601Date
      end

      has_many 'seller' do
        extract Mida::DataVocabulary::Organization
        extract Mida::DataVocabulary::Person
      end

      # Available values: [new, used, refurbished]

      # For example:
      # <span itemprop="condition" content="new">Brand new!</span>
      has_many 'condition'

      # Available values: [out_of_stock, in_stock, instore_only, preorder]
      # should be used in attribute 'content'
      has_many 'availability'

      has_many('quantity') { extract Mida::DataType::Number }
      has_many('offerURL') { extract Mida::DataType::URL }
      has_many 'identifier'
      
      has_many 'itemOffered' do
        extract Mida::DataVocabulary::Product
        extract Mida::DataType::Text
      end
    end
  end
end
