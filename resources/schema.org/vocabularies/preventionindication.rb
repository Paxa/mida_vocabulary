require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An indication for preventing an underlying condition, symptom, etc.
    class PreventionIndication < Mida::Vocabulary
      itemtype %r{http://schema.org/PreventionIndication}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
