require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A type of blood vessel that specifically carries blood away from the heart.
    class Artery < Mida::Vocabulary
      itemtype %r{http://schema.org/Artery}i
      include_vocabulary Mida::SchemaOrg::AnatomicalStructure
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The branches that comprise the arterial structure.
      has_many 'arterialBranch' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::DataType::Text
      end

      # The anatomical or organ system that the artery originates from.
      has_many 'source' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::DataType::Text
      end

      # The area to which the artery supplies blood.
      has_many 'supplyTo' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::DataType::Text
      end
    end

  end
end
