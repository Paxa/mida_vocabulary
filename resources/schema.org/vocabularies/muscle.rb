require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Muscle, 'mida_vocabulary/vocabularies/schemaorg/muscle'
    autoload :Vessel, 'mida_vocabulary/vocabularies/schemaorg/vessel'
    autoload :Nerve, 'mida_vocabulary/vocabularies/schemaorg/nerve'

    # A muscle is an anatomical structure consisting of a contractile form of tissue that animals use to effect movement.
    class Muscle < Mida::Vocabulary
      itemtype %r{http://schema.org/Muscle}i
      include_vocabulary Mida::SchemaOrg::AnatomicalStructure
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The muscle whose action counteracts the specified muscle.
      has_many 'antagonist' do
        extract Mida::SchemaOrg::Muscle
        extract Mida::DataType::Text
      end

      # The blood vessel that carries blood from the heart to the muscle.
      has_many 'bloodSupply' do
        extract Mida::SchemaOrg::Vessel
        extract Mida::DataType::Text
      end

      # The place of attachment of a muscle, or what the muscle moves.
      has_many 'insertion' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::DataType::Text
      end

      # The movement the muscle generates. Supercedes action.
      has_many 'muscleAction'

      # The underlying innervation associated with the muscle.
      has_many 'nerve' do
        extract Mida::SchemaOrg::Nerve
        extract Mida::DataType::Text
      end

      # The place or point where a muscle arises.
      has_many 'origin' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::DataType::Text
      end
    end

  end
end
