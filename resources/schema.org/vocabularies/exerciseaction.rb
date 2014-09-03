require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PlayAction, 'mida_vocabulary/vocabularies/schemaorg/playaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of participating in exertive activity for the purposes of improving health and fitness
    class ExerciseAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ExerciseAction}i
      include_vocabulary Mida::SchemaOrg::PlayAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
