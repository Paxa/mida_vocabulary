require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalSignOrSymptom, 'mida_vocabulary/vocabularies/schemaorg/medicalsignorsymptom'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :PhysicalExam, 'mida_vocabulary/vocabularies/schemaorg/physicalexam'
    autoload :MedicalTest, 'mida_vocabulary/vocabularies/schemaorg/medicaltest'

    # Any physical manifestation of a person's medical condition discoverable by objective diagnostic tests or physical examination.
    class MedicalSign < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalSign}i
      include_vocabulary Mida::SchemaOrg::MedicalSignOrSymptom
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # A physical examination that can identify this sign.
      has_many 'identifyingExam' do
        extract Mida::SchemaOrg::PhysicalExam
      end

      # A diagnostic test that can identify this sign.
      has_many 'identifyingTest' do
        extract Mida::SchemaOrg::MedicalTest
        extract Mida::DataType::Text
      end
    end

  end
end
