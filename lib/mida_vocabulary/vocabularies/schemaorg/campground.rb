require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :CivicStructure, 'mida_vocabulary/vocabularies/schemaorg/civicstructure'

    # A campground.
    class Campground < Mida::Vocabulary
      itemtype %r{http://schema.org/Campground}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Place
      include_vocabulary Mida::SchemaOrg::CivicStructure
    end

  end
end
