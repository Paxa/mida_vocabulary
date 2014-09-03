require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A class of medical drugs, e.g., statins. Classes can represent general pharmacological class, common mechanisms of action, common physiological effects, etc.
    class DrugClass < Mida::Vocabulary
      itemtype %r{http://schema.org/DrugClass}i
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
