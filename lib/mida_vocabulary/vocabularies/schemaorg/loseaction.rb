require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # The act of being defeated in a competitive activity.
    class LoseAction < Mida::Vocabulary
      itemtype %r{http://schema.org/LoseAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of participant. The winner of the action.
      has_many 'winner' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end
    end

  end
end
