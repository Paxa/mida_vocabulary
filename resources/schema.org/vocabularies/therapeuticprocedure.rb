require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalProcedure, 'mida_vocabulary/vocabularies/schemaorg/medicalprocedure'

    # A medical procedure intended primarily for therapeutic purposes, aimed at improving a health condition.
    class TherapeuticProcedure < Mida::Vocabulary
      itemtype %r{http://schema.org/TherapeuticProcedure}i
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::MedicalProcedure
    end

  end
end
