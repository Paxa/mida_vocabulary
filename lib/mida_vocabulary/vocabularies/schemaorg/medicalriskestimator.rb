require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalRiskFactor, 'mida_vocabulary/vocabularies/schemaorg/medicalriskfactor'

    # Any rule set or interactive tool for estimating the risk of developing a complication or condition.
    class MedicalRiskEstimator < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalRiskEstimator}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The condition, complication, or symptom whose risk is being estimated.
      has_many 'estimatesRiskOf' do
        extract Mida::SchemaOrg::MedicalEntity
        extract Mida::DataType::Text
      end

      # A modifiable or non-modifiable risk factor included in the calculation, e.g. age, coexisting condition.
      has_many 'includedRiskFactor' do
        extract Mida::SchemaOrg::MedicalRiskFactor
        extract Mida::DataType::Text
      end
    end

  end
end
