require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Vessel, 'mida_vocabulary/vocabularies/schemaorg/vessel'
    autoload :AnatomicalSystem, 'mida_vocabulary/vocabularies/schemaorg/anatomicalsystem'

    # A type of blood vessel that specifically carries blood to the heart.
    class Vein < Mida::Vocabulary
      itemtype %r{http://schema.org/Vein}i
      include_vocabulary Mida::SchemaOrg::AnatomicalStructure
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The vasculature that the vein drains into.
      has_many 'drainsTo' do
        extract Mida::SchemaOrg::Vessel
        extract Mida::DataType::Text
      end

      # The anatomical or organ system drained by this vessel; generally refers to a specific part of an organ.
      has_many 'regionDrained' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::SchemaOrg::AnatomicalSystem
        extract Mida::DataType::Text
      end

      # The anatomical or organ system that the vein flows into; a larger structure that the vein connects to.
      has_many 'tributary' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::DataType::Text
      end
    end

  end
end
