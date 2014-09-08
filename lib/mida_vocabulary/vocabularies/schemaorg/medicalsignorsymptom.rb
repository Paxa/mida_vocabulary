require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalCause, 'mida_vocabulary/vocabularies/schemaorg/medicalcause'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'

    # Any indication of the existence of a medical condition or disease.
    class MedicalSignOrSymptom < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalSignOrSymptom}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # An underlying cause. More specifically, one of the causative agent(s) that are most directly responsible for the pathophysiologic process that eventually results in the occurrence.
      has_many 'cause' do
        extract Mida::SchemaOrg::MedicalCause
        extract Mida::DataType::Text
      end

      # A possible treatment to address this condition, sign or symptom.
      has_many 'possibleTreatment' do
        extract Mida::SchemaOrg::MedicalTherapy
        extract Mida::DataType::Text
      end
    end

  end
end
