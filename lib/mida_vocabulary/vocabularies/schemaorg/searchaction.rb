require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Class, 'mida_vocabulary/vocabularies/schemaorg/class'

    # The act of searching for an object.Related actions:FindAction: SearchAction generally leads to a FindAction, but not necessarily.
    class SearchAction < Mida::Vocabulary
      itemtype %r{http://schema.org/SearchAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # A sub property of instrument. The query used on this action.
      has_many 'query' do
        extract Mida::SchemaOrg::Class
        extract Mida::DataType::Text
      end
    end

  end
end
