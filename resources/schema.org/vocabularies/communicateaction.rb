require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of conveying information to another person via a communication medium (instrument) such as speech, email, or telephone conversation.
    class CommunicateAction < Mida::Vocabulary
      itemtype %r{http://schema.org/CommunicateAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
