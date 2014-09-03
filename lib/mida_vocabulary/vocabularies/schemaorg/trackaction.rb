require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An agent tracks an object for updates.Related actions:FollowAction: Unlike FollowAction, TrackAction refers to the interest on the location of innanimates objects.SubscribeAction: Unlike SubscribeAction, TrackAction refers to the interest on the location of innanimate objects.
    class TrackAction < Mida::Vocabulary
      itemtype %r{http://schema.org/TrackAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
