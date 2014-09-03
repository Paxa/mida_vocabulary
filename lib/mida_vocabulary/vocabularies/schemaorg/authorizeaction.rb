require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AllocateAction, 'mida_vocabulary/vocabularies/schemaorg/allocateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of granting permission to an object.
    class AuthorizeAction < Mida::Vocabulary
      itemtype %r{http://schema.org/AuthorizeAction}i
      include_vocabulary Mida::SchemaOrg::AllocateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
