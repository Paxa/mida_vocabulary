require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PlanAction, 'mida_vocabulary/vocabularies/schemaorg/planaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of asserting that a future event/action is no longer going to happen.Related actions:ConfirmAction: The antagonym of CancelAction.
    class CancelAction < Mida::Vocabulary
      itemtype %r{http://schema.org/CancelAction}i
      include_vocabulary Mida::SchemaOrg::PlanAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
