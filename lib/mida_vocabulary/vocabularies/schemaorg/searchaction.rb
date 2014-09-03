require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of searching for an object.Related actions:FindAction: SearchAction generally leads to a FindAction, but not necessarily.
    class SearchAction < Mida::Vocabulary
      itemtype %r{http://schema.org/SearchAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
