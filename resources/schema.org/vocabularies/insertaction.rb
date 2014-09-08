require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :UpdateAction, 'mida_vocabulary/vocabularies/schemaorg/updateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # The act of adding at a specific location in an ordered collection.
    class InsertAction < Mida::Vocabulary
      itemtype %r{http://schema.org/InsertAction}i
      include_vocabulary Mida::SchemaOrg::UpdateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of location. The final location of the object or the agent after the action.
      has_many 'toLocation' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end
    end

  end
end
