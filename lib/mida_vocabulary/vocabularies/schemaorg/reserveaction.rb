require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PlanAction, 'mida_vocabulary/vocabularies/schemaorg/planaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Reserving a concrete object.Related actions:ScheduleAction: Unlike ScheduleAction, ReserveAction reserves concrete objects (e.g. a table, a hotel) towards a time slot / spatial allocation.
    class ReserveAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ReserveAction}i
      include_vocabulary Mida::SchemaOrg::PlanAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # The time the object is scheduled to.
      has_many 'scheduledTime' do
        extract Mida::DataType::ISO8601Date
      end
    end

  end
end
