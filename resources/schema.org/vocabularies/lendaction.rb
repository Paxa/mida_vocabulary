require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TransferAction, 'mida_vocabulary/vocabularies/schemaorg/transferaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of providing an object under an agreement that it will be returned at a later date. Reciprocal of BorrowAction.Related actions:BorrowAction: Reciprocal of LendAction.
    class LendAction < Mida::Vocabulary
      itemtype %r{http://schema.org/LendAction}i
      include_vocabulary Mida::SchemaOrg::TransferAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
