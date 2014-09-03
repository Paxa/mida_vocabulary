require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An educational organization.
    class EducationalOrganization < Mida::Vocabulary
      itemtype %r{http://schema.org/EducationalOrganization}i
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
