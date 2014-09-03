require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A condition or factor that indicates use of a medical therapy, including signs, symptoms, risk factors, anatomical states, etc.
    class MedicalIndication < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalIndication}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
