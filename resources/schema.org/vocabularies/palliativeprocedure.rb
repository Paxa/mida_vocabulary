require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalProcedure, 'mida_vocabulary/vocabularies/schemaorg/medicalprocedure'

    # A medical procedure intended primarily for palliative purposes, aimed at relieving the symptoms of an underlying health condition.
    class PalliativeProcedure < Mida::Vocabulary
      itemtype %r{http://schema.org/PalliativeProcedure}i
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::MedicalProcedure
    end

  end
end
