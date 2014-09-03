require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of finding an object.Related actions:SearchAction: FindAction is generally lead by a SearchAction, but not necessarily.
    class FindAction < Mida::Vocabulary
      itemtype %r{http://schema.org/FindAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
