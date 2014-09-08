require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # The act of transferring/moving (abstract or concrete) animate or inanimate objects from one place to another.
    class TransferAction < Mida::Vocabulary
      itemtype %r{http://schema.org/TransferAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of location. The original location of the object or the agent before the action.
      has_many 'fromLocation' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # A sub property of location. The final location of the object or the agent after the action.
      has_many 'toLocation' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end
    end

  end
end
