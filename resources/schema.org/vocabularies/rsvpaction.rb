require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :InformAction, 'mida_vocabulary/vocabularies/schemaorg/informaction'
    autoload :CommunicateAction, 'mida_vocabulary/vocabularies/schemaorg/communicateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of notifying an event organizer as to whether you expect to attend the event.
    class RsvpAction < Mida::Vocabulary
      itemtype %r{http://schema.org/RsvpAction}i
      include_vocabulary Mida::SchemaOrg::InformAction
      include_vocabulary Mida::SchemaOrg::CommunicateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
