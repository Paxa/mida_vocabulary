require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'

    # A governmental organization or agency.
    class GovernmentOrganization < Mida::Vocabulary
      itemtype %r{http://schema.org/GovernmentOrganization}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Organization
    end

  end
end
