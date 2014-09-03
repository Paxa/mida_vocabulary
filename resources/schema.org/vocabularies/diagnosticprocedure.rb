require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTest, 'mida_vocabulary/vocabularies/schemaorg/medicaltest'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalProcedure, 'mida_vocabulary/vocabularies/schemaorg/medicalprocedure'

    # A medical procedure intended primarily for diagnostic, as opposed to therapeutic, purposes.
    class DiagnosticProcedure < Mida::Vocabulary
      itemtype %r{http://schema.org/DiagnosticProcedure}i
      include_vocabulary Mida::SchemaOrg::MedicalTest
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::MedicalProcedure
    end

  end
end
