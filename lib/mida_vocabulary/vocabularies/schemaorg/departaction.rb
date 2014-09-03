require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MoveAction, 'mida_vocabulary/vocabularies/schemaorg/moveaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of departing from a place. An agent departs from an fromLocation for a destination, optionally with participants.
    class DepartAction < Mida::Vocabulary
      itemtype %r{http://schema.org/DepartAction}i
      include_vocabulary Mida::SchemaOrg::MoveAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
