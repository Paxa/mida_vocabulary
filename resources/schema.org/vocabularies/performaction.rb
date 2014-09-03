require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PlayAction, 'mida_vocabulary/vocabularies/schemaorg/playaction'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of participating in performance arts.
    class PerformAction < Mida::Vocabulary
      itemtype %r{http://schema.org/PerformAction}i
      include_vocabulary Mida::SchemaOrg::PlayAction
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
