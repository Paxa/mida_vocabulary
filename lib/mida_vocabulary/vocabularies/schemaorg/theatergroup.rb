require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'

    # A theater group or company - for example, the Royal Shakespeare Company or Druid Theatre.
    class TheaterGroup < Mida::Vocabulary
      itemtype %r{http://schema.org/TheaterGroup}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Organization
    end

  end
end
