require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalSignOrSymptom, 'mida_vocabulary/vocabularies/schemaorg/medicalsignorsymptom'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Any physical manifestation of a person's medical condition discoverable by objective diagnostic tests or physical examination.
    class MedicalSign < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalSign}i
      include_vocabulary Mida::SchemaOrg::MedicalSignOrSymptom
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
