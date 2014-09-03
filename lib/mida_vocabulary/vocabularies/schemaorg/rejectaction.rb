require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AllocateAction, 'mida_vocabulary/vocabularies/schemaorg/allocateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of rejecting to/adopting an object.Related actions:AcceptAction: The antagonym of RejectAction.
    class RejectAction < Mida::Vocabulary
      itemtype %r{http://schema.org/RejectAction}i
      include_vocabulary Mida::SchemaOrg::AllocateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
