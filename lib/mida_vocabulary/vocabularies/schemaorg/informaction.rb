require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CommunicateAction, 'mida_vocabulary/vocabularies/schemaorg/communicateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'

    # The act of notifying someone of information pertinent to them, with no expectation of a response.
    class InformAction < Mida::Vocabulary
      itemtype %r{http://schema.org/InformAction}i
      include_vocabulary Mida::SchemaOrg::CommunicateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # Upcoming or past event associated with this place or organization. Supercedes events.
      has_many 'event' do
        extract Mida::SchemaOrg::Event
        extract Mida::DataType::Text
      end
    end

  end
end
