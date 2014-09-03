require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalSignOrSymptom, 'mida_vocabulary/vocabularies/schemaorg/medicalsignorsymptom'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Any indication of the existence of a medical condition or disease that is apparent to the patient.
    class MedicalSymptom < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalSymptom}i
      include_vocabulary Mida::SchemaOrg::MedicalSignOrSymptom
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
