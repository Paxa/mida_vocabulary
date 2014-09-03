require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CivicStructure, 'mida_vocabulary/vocabularies/schemaorg/civicstructure'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A subway station.
    class SubwayStation < Mida::Vocabulary
      itemtype %r{http://schema.org/SubwayStation}i
      include_vocabulary Mida::SchemaOrg::CivicStructure
      include_vocabulary Mida::SchemaOrg::Place
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
