require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :DoseSchedule, 'mida_vocabulary/vocabularies/schemaorg/doseschedule'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A recommended dosing schedule for a drug or supplement as prescribed or recommended by an authority or by the drug/supplement's manufacturer. Capture the recommending authority in the recognizingAuthority property of MedicalEntity.
    class RecommendedDoseSchedule < Mida::Vocabulary
      itemtype %r{http://schema.org/RecommendedDoseSchedule}i
      include_vocabulary Mida::SchemaOrg::DoseSchedule
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
