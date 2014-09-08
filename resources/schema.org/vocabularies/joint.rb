require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The anatomical location at which two or more bones make contact.
    class Joint < Mida::Vocabulary
      itemtype %r{http://schema.org/Joint}i
      include_vocabulary Mida::SchemaOrg::AnatomicalStructure
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The biomechanical properties of the bone.
      has_many 'biomechnicalClass'

      # The degree of mobility the joint allows.
      has_many 'functionalClass'

      # The name given to how bone physically connects to each other.
      has_many 'structuralClass'
    end

  end
end
