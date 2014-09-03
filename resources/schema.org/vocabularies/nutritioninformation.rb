require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Nutritional information about the recipe.
    class NutritionInformation < Mida::Vocabulary
      itemtype %r{http://schema.org/NutritionInformation}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
