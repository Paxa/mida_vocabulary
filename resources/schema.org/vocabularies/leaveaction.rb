require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'

    # An agent leaves an event / group with participants/friends at a location.Related actions:JoinAction: The antagonym of LeaveAction.UnRegisterAction: Unlike UnRegisterAction, LeaveAction implies leaving a group/team of people rather than a service.
    class LeaveAction < Mida::Vocabulary
      itemtype %r{http://schema.org/LeaveAction}i
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
