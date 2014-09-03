require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of an agent relocating to a place.Related actions:TransferAction: Unlike TransferAction, the subject of the move is a living Person or Organization rather than an inanimate object.
    class MoveAction < Mida::Vocabulary
      itemtype %r{http://schema.org/MoveAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
