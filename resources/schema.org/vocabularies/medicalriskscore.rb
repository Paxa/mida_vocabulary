require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalRiskEstimator, 'mida_vocabulary/vocabularies/schemaorg/medicalriskestimator'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A simple system that adds up the number of risk factors to yield a score that is associated with prognosis, e.g. CHAD score, TIMI risk score.
    class MedicalRiskScore < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalRiskScore}i
      include_vocabulary Mida::SchemaOrg::MedicalRiskEstimator
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
