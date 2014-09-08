require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # An educational organization.
    class EducationalOrganization < Mida::Vocabulary
      itemtype %r{http://schema.org/EducationalOrganization}i
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing

      # Alumni of educational organization. Inverse property: alumniOf.
      has_many 'alumni' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end
    end

  end
end
