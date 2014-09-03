require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A process of care used in either a diagnostic, therapeutic, or palliative capacity that relies on invasive (surgical), non-invasive, or percutaneous techniques.
    class MedicalProcedure < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalProcedure}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
