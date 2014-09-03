require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of forming a personal connection with someone/something (object) unidirectionally/asymmetrically to get updates pushed to.Related actions:FollowAction: Unlike FollowAction, SubscribeAction implies that the subscriber acts as a passive agent being constantly/actively pushed for updates.RegisterAction: Unlike RegisterAction, SubscribeAction implies that the agent is interested in continuing receiving updates from the object.JoinAction: Unlike JoinAction, SubscribeAction implies that the agent is interested in continuing receiving updates from the object.
    class SubscribeAction < Mida::Vocabulary
      itemtype %r{http://schema.org/SubscribeAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
