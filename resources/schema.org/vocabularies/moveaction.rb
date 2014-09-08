require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # The act of an agent relocating to a place.Related actions:TransferAction: Unlike TransferAction, the subject of the move is a living Person or Organization rather than an inanimate object.
    class MoveAction < Mida::Vocabulary
      itemtype %r{http://schema.org/MoveAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of location. The original location of the object or the agent before the action.
      has_many 'fromLocation' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # A sub property of location. The final location of the object or the agent after the action.
      has_many 'toLocation' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end
    end

  end
end
