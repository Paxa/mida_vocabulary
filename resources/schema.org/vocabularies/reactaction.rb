require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of responding instinctively and emotionally to an object, expressing a sentiment.
    class ReactAction < Mida::Vocabulary
      itemtype %r{http://schema.org/ReactAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
