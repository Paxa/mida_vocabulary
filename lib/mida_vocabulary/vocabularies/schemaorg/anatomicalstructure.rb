require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :ImageObject, 'mida_vocabulary/vocabularies/schemaorg/imageobject'
    autoload :AnatomicalSystem, 'mida_vocabulary/vocabularies/schemaorg/anatomicalsystem'
    autoload :MedicalCondition, 'mida_vocabulary/vocabularies/schemaorg/medicalcondition'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'

    # Any part of the human body, typically a component of an anatomical system. Organs, tissues, and cells are all anatomical structures.
    class AnatomicalStructure < Mida::Vocabulary
      itemtype %r{http://schema.org/AnatomicalStructure}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.
      has_many 'associatedPathophysiology'

      # Location in the body of the anatomical structure.
      has_many 'bodyLocation'

      # Other anatomical structures to which this structure is connected.
      has_many 'connectedTo' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::DataType::Text
      end

      # An image containing a diagram that illustrates the structure and/or its component substructures and/or connections with other structures.
      has_many 'diagram' do
        extract Mida::SchemaOrg::ImageObject
        extract Mida::DataType::Text
      end

      # Function of the anatomical structure.
      has_many 'function'

      # The anatomical or organ system that this structure is part of.
      has_many 'partOfSystem' do
        extract Mida::SchemaOrg::AnatomicalSystem
        extract Mida::DataType::Text
      end

      # A medical condition associated with this anatomy.
      has_many 'relatedCondition' do
        extract Mida::SchemaOrg::MedicalCondition
        extract Mida::DataType::Text
      end

      # A medical therapy related to this anatomy.
      has_many 'relatedTherapy' do
        extract Mida::SchemaOrg::MedicalTherapy
        extract Mida::DataType::Text
      end

      # Component (sub-)structure(s) that comprise this anatomical structure.
      has_many 'subStructure' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::DataType::Text
      end
    end

  end
end
