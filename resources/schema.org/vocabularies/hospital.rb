require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :LocalBusiness, 'mida_vocabulary/vocabularies/schemaorg/localbusiness'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :CivicStructure, 'mida_vocabulary/vocabularies/schemaorg/civicstructure'
    autoload :MedicalProcedure, 'mida_vocabulary/vocabularies/schemaorg/medicalprocedure'
    autoload :MedicalTest, 'mida_vocabulary/vocabularies/schemaorg/medicaltest'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalSpecialty, 'mida_vocabulary/vocabularies/schemaorg/medicalspecialty'

    # A hospital.
    class Hospital < Mida::Vocabulary
      itemtype %r{http://schema.org/Hospital}i
      include_vocabulary Mida::SchemaOrg::LocalBusiness
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Place
      include_vocabulary Mida::SchemaOrg::CivicStructure

      # A medical service available from this provider.
      has_many 'availableService' do
        extract Mida::SchemaOrg::MedicalProcedure
        extract Mida::SchemaOrg::MedicalTest
        extract Mida::SchemaOrg::MedicalTherapy
        extract Mida::DataType::Text
      end

      # A medical specialty of the provider.
      has_many 'medicalSpecialty' do
        extract Mida::SchemaOrg::MedicalSpecialty
      end
    end

  end
end
