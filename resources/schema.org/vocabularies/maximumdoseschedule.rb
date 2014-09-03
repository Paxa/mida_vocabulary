require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :DoseSchedule, 'mida_vocabulary/vocabularies/schemaorg/doseschedule'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The maximum dosing schedule considered safe for a drug or supplement as recommended by an authority or by the drug/supplement's manufacturer. Capture the recommending authority in the recognizingAuthority property of MedicalEntity.
    class MaximumDoseSchedule < Mida::Vocabulary
      itemtype %r{http://schema.org/MaximumDoseSchedule}i
      include_vocabulary Mida::SchemaOrg::DoseSchedule
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
