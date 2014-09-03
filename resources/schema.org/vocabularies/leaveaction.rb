require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An agent leaves an event / group with participants/friends at a location.Related actions:JoinAction: The antagonym of LeaveAction.UnRegisterAction: Unlike UnRegisterAction, LeaveAction implies leaving a group/team of people rather than a service.
    class LeaveAction < Mida::Vocabulary
      itemtype %r{http://schema.org/LeaveAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
