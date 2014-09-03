require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of forming a personal connection with someone (object) mutually/bidirectionally/symmetrically.Related actions:FollowAction: Unlike FollowAction, BefriendAction implies that the connection is reciprocal.
    class BefriendAction < Mida::Vocabulary
      itemtype %r{http://schema.org/BefriendAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
