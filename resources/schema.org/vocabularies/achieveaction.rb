require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of accomplishing something via previous efforts. It is an instantaneous action rather than an ongoing process.
    class AchieveAction < Mida::Vocabulary
      itemtype %r{http://schema.org/AchieveAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
