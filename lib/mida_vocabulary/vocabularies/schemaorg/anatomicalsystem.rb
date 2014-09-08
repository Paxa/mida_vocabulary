require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :AnatomicalSystem, 'mida_vocabulary/vocabularies/schemaorg/anatomicalsystem'
    autoload :MedicalCondition, 'mida_vocabulary/vocabularies/schemaorg/medicalcondition'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'

    # An anatomical system is a group of anatomical structures that work together to perform a certain task. Anatomical systems, such as organ systems, are one organizing principle of anatomy, and can includes circulatory, digestive, endocrine, integumentary, immune, lymphatic, muscular, nervous, reproductive, respiratory, skeletal, urinary, vestibular, and other systems.
    class AnatomicalSystem < Mida::Vocabulary
      itemtype %r{http://schema.org/AnatomicalSystem}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.
      has_many 'associatedPathophysiology'

      # The underlying anatomical structures, such as organs, that comprise the anatomical system.
      has_many 'comprisedOf' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::SchemaOrg::AnatomicalSystem
        extract Mida::DataType::Text
      end

      # A medical condition associated with this anatomy.
      has_many 'relatedCondition' do
        extract Mida::SchemaOrg::MedicalCondition
        extract Mida::DataType::Text
      end

      # Related anatomical structure(s) that are not part of the system but relate or connect to it, such as vascular bundles associated with an organ system.
      has_many 'relatedStructure' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::DataType::Text
      end

      # A medical therapy related to this anatomy.
      has_many 'relatedTherapy' do
        extract Mida::SchemaOrg::MedicalTherapy
        extract Mida::DataType::Text
      end
    end

  end
end
