require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TransferAction, 'mida_vocabulary/vocabularies/schemaorg/transferaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :DeliveryMethod, 'mida_vocabulary/vocabularies/schemaorg/deliverymethod'
    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # The act of physically/electronically dispatching an object for transfer from an origin to a destination.Related actions:ReceiveAction: The reciprocal of SendAction.GiveAction: Unlike GiveAction, SendAction does not imply the transfer of ownership (e.g. I can send you my laptop, but I'm not necessarily giving it to you).
    class SendAction < Mida::Vocabulary
      itemtype %r{http://schema.org/SendAction}i
      include_vocabulary Mida::SchemaOrg::TransferAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of instrument. The method of delivery
      has_many 'deliveryMethod' do
        extract Mida::SchemaOrg::DeliveryMethod
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
