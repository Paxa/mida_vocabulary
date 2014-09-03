require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Any rule set or interactive tool for estimating the risk of developing a complication or condition.
    class MedicalRiskEstimator < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalRiskEstimator}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
