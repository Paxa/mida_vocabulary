require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AllocateAction, 'mida_vocabulary/vocabularies/schemaorg/allocateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of allocating an action/event/task to some destination (someone or something).
    class AssignAction < Mida::Vocabulary
      itemtype %r{http://schema.org/AssignAction}i
      include_vocabulary Mida::SchemaOrg::AllocateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
