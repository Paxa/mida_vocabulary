require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CommunicateAction, 'mida_vocabulary/vocabularies/schemaorg/communicateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of responding to a question/message asked/sent by the object. Related to AskAction.Related actions:AskAction: Appears generally as an origin of a ReplyAction.
    class ReplyAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ReplyAction}i
      include_vocabulary Mida::SchemaOrg::CommunicateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
