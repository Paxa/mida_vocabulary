require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # A strategy of regulating the intake of food to achieve or maintain a specific health-related goal.
    class Diet < Mida::Vocabulary
      itemtype %r{http://schema.org/Diet}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity

      # Nutritional information specific to the dietary plan. May include dietary recommendations on what foods to avoid, what foods to consume, and specific alterations/deviations from the USDA or other regulatory body's approved dietary guidelines.
      has_many 'dietFeatures'

      # People or organizations that endorse the plan.
      has_many 'endorsers' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # Medical expert advice related to the plan.
      has_many 'expertConsiderations'

      # Descriptive information establishing the overarching theory/philosophy of the plan. May include the rationale for the name, the population where the plan first came to prominence, etc.
      has_many 'overview'

      # Specific physiologic benefits associated to the plan.
      has_many 'physiologicalBenefits'

      # Proprietary name given to the diet plan, typically by its originator or creator.
      has_many 'proprietaryName'

      # Specific physiologic risks associated to the plan.
      has_many 'risks'
    end

  end
end
