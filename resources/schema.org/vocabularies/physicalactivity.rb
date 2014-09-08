require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :AnatomicalSystem, 'mida_vocabulary/vocabularies/schemaorg/anatomicalsystem'
    autoload :SuperficialAnatomy, 'mida_vocabulary/vocabularies/schemaorg/superficialanatomy'
    autoload :PhysicalActivityCategory, 'mida_vocabulary/vocabularies/schemaorg/physicalactivitycategory'

    # Any bodily activity that enhances or maintains physical fitness and overall health and wellness. Includes activity that is part of daily living and routine, structured exercise, and exercise prescribed as part of a medical treatment or recovery plan.
    class PhysicalActivity < Mida::Vocabulary
      itemtype %r{http://schema.org/PhysicalActivity}i
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The anatomy of the underlying organ system or structures associated with this entity.
      has_many 'associatedAnatomy' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::SchemaOrg::AnatomicalSystem
        extract Mida::SchemaOrg::SuperficialAnatomy
        extract Mida::DataType::Text
      end

      # A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.
      has_many 'category' do
        extract Mida::SchemaOrg::PhysicalActivityCategory
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # The characteristics of associated patients, such as age, gender, race etc.
      has_many 'epidemiology'

      # Changes in the normal mechanical, physical, and biochemical functions that are associated with this activity or condition.
      has_many 'pathophysiology'
    end

  end
end
