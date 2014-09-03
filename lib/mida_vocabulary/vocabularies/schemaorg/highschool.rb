require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :EducationalOrganization, 'mida_vocabulary/vocabularies/schemaorg/educationalorganization'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A high school.
    class HighSchool < Mida::Vocabulary
      itemtype %r{http://schema.org/HighSchool}i
      include_vocabulary Mida::SchemaOrg::EducationalOrganization
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
