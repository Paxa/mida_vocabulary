require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An agent joins an event/group with participants/friends at a location.Related actions:RegisterAction: Unlike RegisterAction, JoinAction refers to joining a group/team of people.SubscribeAction: Unlike SubscribeAction, JoinAction does not imply that you'll be receiving updates.FollowAction: Unlike FollowAction, JoinAction does not imply that you'll be polling for updates.
    class JoinAction < Mida::Vocabulary
      itemtype %r{http://schema.org/JoinAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
