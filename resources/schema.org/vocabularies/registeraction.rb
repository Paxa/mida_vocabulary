require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of registering to be a user of a service, product or web page.Related actions:JoinAction: Unlike JoinAction, RegisterAction implies you are registering to be a user of a service, *not* a group/team of people.FollowAction: Unlike FollowAction, RegisterAction doesn't imply that the agent is expecting to poll for updates from the object.SubscribeAction: Unlike SubscribeAction, RegisterAction doesn't imply that the agent is expecting updates from the object.
    class RegisterAction < Mida::Vocabulary
      itemtype %r{http://schema.org/RegisterAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
