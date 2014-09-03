require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :InformAction, 'mida_vocabulary/vocabularies/schemaorg/informaction'
    autoload :CommunicateAction, 'mida_vocabulary/vocabularies/schemaorg/communicateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of notifying someone that a future event/action is going to happen as expected.Related actions:CancelAction: The antagonym of ConfirmAction.
    class ConfirmAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ConfirmAction}i
      include_vocabulary Mida::SchemaOrg::InformAction
      include_vocabulary Mida::SchemaOrg::CommunicateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
