require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CommunicateAction, 'mida_vocabulary/vocabularies/schemaorg/communicateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of an agent communicating (service provider, social media, etc) their arrival by registering/confirming for a previously reserved service (e.g. flight check in) or at a place (e.g. hotel), possibly resulting in a result (boarding pass, etc).Related actions:CheckOutAction: The antagonym of CheckInAction.ArriveAction: Unlike ArriveAction, CheckInAction implies that the agent is informing/confirming the start of a previously reserved service.ConfirmAction: Unlike ConfirmAction, CheckInAction implies that the agent is informing/confirming the *start* of a previously reserved service rather than its validity/existence.
    class CheckInAction < Mida::Vocabulary
      itemtype %r{http://schema.org/CheckInAction}i
      include_vocabulary Mida::SchemaOrg::CommunicateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
