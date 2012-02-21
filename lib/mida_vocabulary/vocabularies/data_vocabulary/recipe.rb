require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    autoload :Person, 'mida_vocabulary/vocabularies/data_vocabulary/person'
    autoload :Review, 'mida_vocabulary/vocabularies/data_vocabulary/review'

    class Recipe < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Recipe}i
      include_vocabulary Mida::DataVocabulary::Item

      for field in %w{name recipeType photo summary instructions ingredient}
        has_many field
      end

      for field in %w{published prepTime cookTime totalTime}
        has_many(field) { extract Mida::DataType::ISO8601Date }
      end

      has_many 'review' do
        extract Mida::DataVocabulary::Review
        extract Mida::DataType::Text
      end

      # [servingSize, calories, fat, saturatedFat, unsaturatedFat, carbohydrates, sugar, fiber, protein, cholesterol]
      has_many 'nutrition'

      has_many 'author' do
        extract Mida::DataVocabulary::Person
        extract Mida::DataType::Text
      end
    end
  end
end
