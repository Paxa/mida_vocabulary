require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CommunicateAction, 'mida_vocabulary/vocabularies/schemaorg/communicateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of an agent communicating (service provider, social media, etc) their departure of a previously reserved service (e.g. flight check in) or place (e.g. hotel).Related actions:CheckInAction: The antagonym of CheckOutAction.DepartAction: Unlike DepartAction, CheckOutAction implies that the agent is informing/confirming the end of a previously reserved service.CancelAction: Unlike CancelAction, CheckOutAction implies that the agent is informing/confirming the end of a previously reserved service.
    class CheckOutAction < Mida::Vocabulary
      itemtype %r{http://schema.org/CheckOutAction}i
      include_vocabulary Mida::SchemaOrg::CommunicateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
