require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TransferAction, 'mida_vocabulary/vocabularies/schemaorg/transferaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # The act of returning to the origin that which was previously received (concrete objects) or taken (ownership).
    class ReturnAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ReturnAction}i
      include_vocabulary Mida::SchemaOrg::TransferAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

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
