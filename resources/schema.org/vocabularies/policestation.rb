require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CivicStructure, 'mida_vocabulary/vocabularies/schemaorg/civicstructure'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :LocalBusiness, 'mida_vocabulary/vocabularies/schemaorg/localbusiness'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'

    # A police station.
    class PoliceStation < Mida::Vocabulary
      itemtype %r{http://schema.org/PoliceStation}i
      include_vocabulary Mida::SchemaOrg::CivicStructure
      include_vocabulary Mida::SchemaOrg::Place
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::LocalBusiness
      include_vocabulary Mida::SchemaOrg::Organization
    end

  end
end
