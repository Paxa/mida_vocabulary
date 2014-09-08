require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Nerve, 'mida_vocabulary/vocabularies/schemaorg/nerve'
    autoload :Muscle, 'mida_vocabulary/vocabularies/schemaorg/muscle'
    autoload :SuperficialAnatomy, 'mida_vocabulary/vocabularies/schemaorg/superficialanatomy'
    autoload :BrainStructure, 'mida_vocabulary/vocabularies/schemaorg/brainstructure'

    # A common pathway for the electrochemical nerve impulses that are transmitted along each of the axons.
    class Nerve < Mida::Vocabulary
      itemtype %r{http://schema.org/Nerve}i
      include_vocabulary Mida::SchemaOrg::AnatomicalStructure
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The branches that delineate from the nerve bundle.
      has_many 'branch' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::SchemaOrg::Nerve
        extract Mida::DataType::Text
      end

      # The neurological pathway extension that involves muscle control.
      has_many 'nerveMotor' do
        extract Mida::SchemaOrg::Muscle
        extract Mida::DataType::Text
      end

      # The neurological pathway extension that inputs and sends information to the brain or spinal cord.
      has_many 'sensoryUnit' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::SchemaOrg::SuperficialAnatomy
        extract Mida::DataType::Text
      end

      # The neurological pathway that originates the neurons.
      has_many 'sourcedFrom' do
        extract Mida::SchemaOrg::BrainStructure
        extract Mida::DataType::Text
      end
    end

  end
end
