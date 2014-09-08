require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A risk factor is anything that increases a person's likelihood of developing or contracting a disease, medical condition, or complication.
    class MedicalRiskFactor < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalRiskFactor}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The condition, complication, etc. influenced by this factor.
      has_many 'increasesRiskOf' do
        extract Mida::SchemaOrg::MedicalEntity
        extract Mida::DataType::Text
      end
    end

  end
end
