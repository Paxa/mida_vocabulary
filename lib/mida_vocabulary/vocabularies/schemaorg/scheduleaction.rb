require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PlanAction, 'mida_vocabulary/vocabularies/schemaorg/planaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Scheduling future actions, events, or tasks.Related actions:ReserveAction: Unlike ReserveAction, ScheduleAction allocates future actions (e.g. an event, a task, etc) towards a time slot / spatial allocation.
    class ScheduleAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ScheduleAction}i
      include_vocabulary Mida::SchemaOrg::PlanAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
