require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :FoodEstablishment, 'mida_vocabulary/vocabularies/schemaorg/foodestablishment'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :FoodEvent, 'mida_vocabulary/vocabularies/schemaorg/foodevent'
    autoload :Recipe, 'mida_vocabulary/vocabularies/schemaorg/recipe'

    # The act of producing/preparing food.
    class CookAction < Mida::Vocabulary
      itemtype %r{http://schema.org/CookAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of location. The specific food establishment where the action occurred.
      has_many 'foodEstablishment' do
        extract Mida::SchemaOrg::FoodEstablishment
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # A sub property of location. The specific food event where the action occurred.
      has_many 'foodEvent' do
        extract Mida::SchemaOrg::FoodEvent
        extract Mida::DataType::Text
      end

      # A sub property of instrument. The recipe/instructions used to perform the action.
      has_many 'recipe' do
        extract Mida::SchemaOrg::Recipe
        extract Mida::DataType::Text
      end
    end

  end
end
