require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalRiskEstimator, 'mida_vocabulary/vocabularies/schemaorg/medicalriskestimator'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A complex mathematical calculation requiring an online calculator, used to assess prognosis. Note: use the url property of Thing to record any URLs for online calculators.
    class MedicalRiskCalculator < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalRiskCalculator}i
      include_vocabulary Mida::SchemaOrg::MedicalRiskEstimator
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
