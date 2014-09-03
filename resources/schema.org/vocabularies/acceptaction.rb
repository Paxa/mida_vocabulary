require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AllocateAction, 'mida_vocabulary/vocabularies/schemaorg/allocateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of committing to/adopting an object.Related actions:RejectAction: The antagonym of AcceptAction.
    class AcceptAction < Mida::Vocabulary
      itemtype %r{http://schema.org/AcceptAction}i
      include_vocabulary Mida::SchemaOrg::AllocateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
