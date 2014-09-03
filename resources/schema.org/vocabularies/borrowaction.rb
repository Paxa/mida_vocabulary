require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TransferAction, 'mida_vocabulary/vocabularies/schemaorg/transferaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of obtaining an object under an agreement to return it at a later date. Reciprocal of LendAction.Related actions:LendAction: Reciprocal of BorrowAction.
    class BorrowAction < Mida::Vocabulary
      itemtype %r{http://schema.org/BorrowAction}i
      include_vocabulary Mida::SchemaOrg::TransferAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
