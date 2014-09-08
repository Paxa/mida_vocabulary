require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Language, 'mida_vocabulary/vocabularies/schemaorg/language'

    # The act of authoring written creative content.
    class WriteAction < Mida::Vocabulary
      itemtype %r{http://schema.org/WriteAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of instrument. The language used on this action.
      has_many 'language' do
        extract Mida::SchemaOrg::Language
        extract Mida::DataType::Text
      end
    end

  end
end
