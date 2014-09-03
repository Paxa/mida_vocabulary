require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Entities that have a somewhat fixed, physical extension.
    class Place < Mida::Vocabulary
      itemtype %r{http://schema.org/Place}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
