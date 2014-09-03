require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A process of care using radiation aimed at improving a health condition.
    class RadiationTherapy < Mida::Vocabulary
      itemtype %r{http://schema.org/RadiationTherapy}i
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
