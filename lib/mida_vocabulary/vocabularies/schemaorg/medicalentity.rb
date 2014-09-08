require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalCode, 'mida_vocabulary/vocabularies/schemaorg/medicalcode'
    autoload :MedicalGuideline, 'mida_vocabulary/vocabularies/schemaorg/medicalguideline'
    autoload :MedicineSystem, 'mida_vocabulary/vocabularies/schemaorg/medicinesystem'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :MedicalSpecialty, 'mida_vocabulary/vocabularies/schemaorg/medicalspecialty'
    autoload :MedicalStudy, 'mida_vocabulary/vocabularies/schemaorg/medicalstudy'

    # The most generic type of entity related to health and the practice of medicine.
    class MedicalEntity < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalEntity}i
      include_vocabulary Mida::SchemaOrg::Thing

      # An alias for the item.
      has_many 'alternateName'

      # A medical code for the entity, taken from a controlled vocabulary or ontology such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.
      has_many 'code' do
        extract Mida::SchemaOrg::MedicalCode
        extract Mida::DataType::Text
      end

      # A medical guideline related to this entity.
      has_many 'guideline' do
        extract Mida::SchemaOrg::MedicalGuideline
        extract Mida::DataType::Text
      end

      # The system of medicine that includes this MedicalEntity, for example 'evidence-based', 'homeopathic', 'chiropractic', etc.
      has_many 'medicineSystem' do
        extract Mida::SchemaOrg::MedicineSystem
      end

      # If applicable, the organization that officially recognizes this entity as part of its endorsed system of medicine.
      has_many 'recognizingAuthority' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # If applicable, a medical specialty in which this entity is relevant.
      has_many 'relevantSpecialty' do
        extract Mida::SchemaOrg::MedicalSpecialty
      end

      # A medical study or trial related to this entity.
      has_many 'study' do
        extract Mida::SchemaOrg::MedicalStudy
        extract Mida::DataType::Text
      end
    end

  end
end
