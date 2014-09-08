require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Vessel, 'mida_vocabulary/vocabularies/schemaorg/vessel'
    autoload :AnatomicalSystem, 'mida_vocabulary/vocabularies/schemaorg/anatomicalsystem'

    # A type of blood vessel that specifically carries lymph fluid unidirectionally toward the heart.
    class LymphaticVessel < Mida::Vocabulary
      itemtype %r{http://schema.org/LymphaticVessel}i
      include_vocabulary Mida::SchemaOrg::AnatomicalStructure
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The vasculature the lymphatic structure originates, or afferents, from.
      has_many 'originatesFrom' do
        extract Mida::SchemaOrg::Vessel
        extract Mida::DataType::Text
      end

      # The anatomical or organ system drained by this vessel; generally refers to a specific part of an organ.
      has_many 'regionDrained' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::SchemaOrg::AnatomicalSystem
        extract Mida::DataType::Text
      end

      # The vasculature the lymphatic structure runs, or efferents, to.
      has_many 'runsTo' do
        extract Mida::SchemaOrg::Vessel
        extract Mida::DataType::Text
      end
    end

  end
end
