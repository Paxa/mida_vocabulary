require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A type of blood vessel that specifically carries lymph fluid unidirectionally toward the heart.
    class LymphaticVessel < Mida::Vocabulary
      itemtype %r{http://schema.org/LymphaticVessel}i
      include_vocabulary Mida::SchemaOrg::AnatomicalStructure
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
