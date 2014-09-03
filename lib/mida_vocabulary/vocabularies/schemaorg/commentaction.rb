require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CommunicateAction, 'mida_vocabulary/vocabularies/schemaorg/communicateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of generating a comment about a subject.
    class CommentAction < Mida::Vocabulary
      itemtype %r{http://schema.org/CommentAction}i
      include_vocabulary Mida::SchemaOrg::CommunicateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
