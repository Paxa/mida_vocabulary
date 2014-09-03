require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TransferAction, 'mida_vocabulary/vocabularies/schemaorg/transferaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of gaining ownership of an object from an origin. Reciprocal of GiveAction.Related actions:GiveAction: The reciprocal of TakeAction.ReceiveAction: Unlike ReceiveAction, TakeAction implies that ownership has been transfered.
    class TakeAction < Mida::Vocabulary
      itemtype %r{http://schema.org/TakeAction}i
      include_vocabulary Mida::SchemaOrg::TransferAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
