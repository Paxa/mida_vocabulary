require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'

    # A strategy of regulating the intake of food to achieve or maintain a specific health-related goal.
    class Diet < Mida::Vocabulary
      itemtype %r{http://schema.org/Diet}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
    end

  end
end
