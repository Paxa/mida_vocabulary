require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :UpdateAction, 'mida_vocabulary/vocabularies/schemaorg/updateaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of editing a recipient by replacing an old object with a new object.
    class ReplaceAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ReplaceAction}i
      include_vocabulary Mida::SchemaOrg::UpdateAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of object. The object that is being replaced.
      has_many 'replacee' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # A sub property of object. The object that replaces.
      has_many 'replacer' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end
    end

  end
end
