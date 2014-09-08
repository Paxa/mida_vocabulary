require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Drug, 'mida_vocabulary/vocabularies/schemaorg/drug'
    autoload :MedicalSign, 'mida_vocabulary/vocabularies/schemaorg/medicalsign'
    autoload :MedicalCondition, 'mida_vocabulary/vocabularies/schemaorg/medicalcondition'
    autoload :MedicalDevice, 'mida_vocabulary/vocabularies/schemaorg/medicaldevice'

    # Any medical test, typically performed for diagnostic purposes.
    class MedicalTest < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalTest}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # Drugs that affect the test's results.
      has_many 'affectedBy' do
        extract Mida::SchemaOrg::Drug
        extract Mida::DataType::Text
      end

      # Range of acceptable values for a typical patient, when applicable.
      has_many 'normalRange'

      # A sign detected by the test.
      has_many 'signDetected' do
        extract Mida::SchemaOrg::MedicalSign
        extract Mida::DataType::Text
      end

      # A condition the test is used to diagnose.
      has_many 'usedToDiagnose' do
        extract Mida::SchemaOrg::MedicalCondition
        extract Mida::DataType::Text
      end

      # Device used to perform the test.
      has_many 'usesDevice' do
        extract Mida::SchemaOrg::MedicalDevice
        extract Mida::DataType::Text
      end
    end

  end
end
