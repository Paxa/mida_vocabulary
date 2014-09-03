require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :EducationalOrganization, 'mida_vocabulary/vocabularies/schemaorg/educationalorganization'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A middle school (typically for children aged around 11-14, although this varies somewhat).
    class MiddleSchool < Mida::Vocabulary
      itemtype %r{http://schema.org/MiddleSchool}i
      include_vocabulary Mida::SchemaOrg::EducationalOrganization
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
