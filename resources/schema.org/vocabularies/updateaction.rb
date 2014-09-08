require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of managing by changing/editing the state of the object.
    class UpdateAction < Mida::Vocabulary
      itemtype %r{http://schema.org/UpdateAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of object. The collection target of the action.
      has_many 'collection' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end
    end

  end
end
