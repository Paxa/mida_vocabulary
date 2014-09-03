require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An action performed by a direct agent and indirect participants upon a direct object. Optionally happens at a location with the help of an inanimate instrument. The execution of the action may produce a result. Specific action sub-type documentation specifies the exact expectation of each argument/role.
    class Action < Mida::Vocabulary
      itemtype %r{http://schema.org/Action}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
