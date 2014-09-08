require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A stage of a medical condition, such as 'Stage IIIa'.
    class MedicalConditionStage < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalConditionStage}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The stage represented as a number, e.g. 3.
      has_many 'stageAsNumber' do
        extract Mida::DataType::Number
      end

      # The substage, e.g. 'a' for Stage IIIa.
      has_many 'subStageSuffix'
    end

  end
end
