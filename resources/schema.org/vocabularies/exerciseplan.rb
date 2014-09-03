require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PhysicalActivity, 'mida_vocabulary/vocabularies/schemaorg/physicalactivity'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'

    # Fitness-related activity designed for a specific health-related purpose, including defined exercise routines as well as activity prescribed by a clinician.
    class ExercisePlan < Mida::Vocabulary
      itemtype %r{http://schema.org/ExercisePlan}i
      include_vocabulary Mida::SchemaOrg::PhysicalActivity
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork
    end

  end
end
