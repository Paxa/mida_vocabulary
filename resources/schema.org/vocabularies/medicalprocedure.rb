require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalProcedureType, 'mida_vocabulary/vocabularies/schemaorg/medicalproceduretype'

    # A process of care used in either a diagnostic, therapeutic, or palliative capacity that relies on invasive (surgical), non-invasive, or percutaneous techniques.
    class MedicalProcedure < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalProcedure}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # Typical or recommended followup care after the procedure is performed.
      has_many 'followup'

      # How the procedure is performed.
      has_many 'howPerformed'

      # Typical preparation that a patient must undergo before having the procedure performed.
      has_many 'preparation'

      # The type of procedure, for example Surgical, Noninvasive, or Percutaneous.
      has_many 'procedureType' do
        extract Mida::SchemaOrg::MedicalProcedureType
      end
    end

  end
end
