require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TransferAction, 'mida_vocabulary/vocabularies/schemaorg/transferaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of physically/electronically taking delivery of an object thathas been transferred from an origin to a destination. Reciprocal of SendAction.Related actions:SendAction: The reciprocal of ReceiveAction.TakeAction: Unlike TakeAction, ReceiveAction does not imply that the ownership has been transfered (e.g. I can receive a package, but it does not mean the package is now mine).
    class ReceiveAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ReceiveAction}i
      include_vocabulary Mida::SchemaOrg::TransferAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
