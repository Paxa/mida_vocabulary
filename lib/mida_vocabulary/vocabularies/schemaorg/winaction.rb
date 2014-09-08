require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # The act of achieving victory in a competitive activity.
    class WinAction < Mida::Vocabulary
      itemtype %r{http://schema.org/WinAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of participant. The loser of the action.
      has_many 'loser' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end
    end

  end
end
