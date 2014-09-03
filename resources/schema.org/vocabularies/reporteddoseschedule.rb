require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :DoseSchedule, 'mida_vocabulary/vocabularies/schemaorg/doseschedule'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A patient-reported or observed dosing schedule for a drug or supplement.
    class ReportedDoseSchedule < Mida::Vocabulary
      itemtype %r{http://schema.org/ReportedDoseSchedule}i
      include_vocabulary Mida::SchemaOrg::DoseSchedule
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
