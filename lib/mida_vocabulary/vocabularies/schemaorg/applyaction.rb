require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of registering to an organization/service without the guarantee to receive it. NOTE(goto): should this be under InteractAction instead?Related actions:RegisterAction: Unlike RegisterAction, ApplyAction has no guarantees that the application will be accepted.
    class ApplyAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ApplyAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
