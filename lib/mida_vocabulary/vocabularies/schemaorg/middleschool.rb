require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :EducationalOrganization, 'mida_vocabulary/vocabularies/schemaorg/educationalorganization'

    # A middle school.
    class MiddleSchool < Mida::Vocabulary
      itemtype %r{http://schema.org/MiddleSchool}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::EducationalOrganization
    end

  end
end
