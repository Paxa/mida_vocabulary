require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Any indication of the existence of a medical condition or disease.
    class MedicalSignOrSymptom < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalSignOrSymptom}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
