require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MoveAction, 'mida_vocabulary/vocabularies/schemaorg/moveaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of arriving at a place. An agent arrives at a destination from an fromLocation, optionally with participants.
    class ArriveAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ArriveAction}i
      include_vocabulary Mida::SchemaOrg::MoveAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
