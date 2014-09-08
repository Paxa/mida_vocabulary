require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Language, 'mida_vocabulary/vocabularies/schemaorg/language'
    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # The act of conveying information to another person via a communication medium (instrument) such as speech, email, or telephone conversation.
    class CommunicateAction < Mida::Vocabulary
      itemtype %r{http://schema.org/CommunicateAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # The subject matter of the content.
      has_many 'about' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # A sub property of instrument. The language used on this action.
      has_many 'language' do
        extract Mida::SchemaOrg::Language
        extract Mida::DataType::Text
      end

      # A sub property of participant. The participant who is at the receiving end of the action.
      has_many 'recipient' do
        extract Mida::SchemaOrg::Audience
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end
    end

  end
end
