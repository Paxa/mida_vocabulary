require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Duration, 'mida_vocabulary/vocabularies/schemaorg/duration'
    autoload :NutritionInformation, 'mida_vocabulary/vocabularies/schemaorg/nutritioninformation'

    # A recipe.
    class Recipe < Mida::Vocabulary
      itemtype %r{http://schema.org/Recipe}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The time it takes to actually cook the dish, in ISO 8601 duration format.
      has_many 'cookTime' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # The method of cooking, such as Frying, Steaming, ...
      has_many 'cookingMethod'

      # An ingredient used in the recipe.
      has_many 'ingredients'

      # Nutrition information about the recipe.
      has_many 'nutrition' do
        extract Mida::SchemaOrg::NutritionInformation
        extract Mida::DataType::Text
      end

      # The length of time it takes to prepare the recipe, in ISO 8601 duration format.
      has_many 'prepTime' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # The category of the recipe - for example, appetizer, entree, etc.
      has_many 'recipeCategory'

      # The cuisine of the recipe (for example, French or Ethiopian).
      has_many 'recipeCuisine'

      # The steps to make the dish.
      has_many 'recipeInstructions'

      # The quantity produced by the recipe (for example, number of people served, number of servings, etc).
      has_many 'recipeYield'

      # The total time it takes to prepare and cook the recipe, in ISO 8601 duration format.
      has_many 'totalTime' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end
    end

  end
end
