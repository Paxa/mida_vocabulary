require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of planning the execution of an event/task/action/reservation/plan to a future date.
    class PlanAction < Mida::Vocabulary
      itemtype %r{http://schema.org/PlanAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # The time the object is scheduled to.
      has_many 'scheduledTime' do
        extract Mida::DataType::ISO8601Date
      end
    end

  end
end
