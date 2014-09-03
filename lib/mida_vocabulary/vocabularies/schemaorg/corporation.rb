require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Organization: A business corporation.
    class Corporation < Mida::Vocabulary
      itemtype %r{http://schema.org/Corporation}i
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
