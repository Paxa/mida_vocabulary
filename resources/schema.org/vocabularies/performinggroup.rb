require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A performance group, such as a band, an orchestra, or a circus.
    class PerformingGroup < Mida::Vocabulary
      itemtype %r{http://schema.org/PerformingGroup}i
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
