require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalEvidenceLevel, 'mida_vocabulary/vocabularies/schemaorg/medicalevidencelevel'

    # Any recommendation made by a standard society (e.g. ACC/AHA) or consensus statement that denotes how to diagnose and treat a particular condition. Note: this type should be used to tag the actual guideline recommendation; if the guideline recommendation occurs in a larger scholarly article, use MedicalScholarlyArticle to tag the overall article, not this type. Note also: the organization making the recommendation should be captured in the recognizingAuthority base property of MedicalEntity.
    class MedicalGuideline < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalGuideline}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # Strength of evidence of the data used to formulate the guideline (enumerated).
      has_many 'evidenceLevel' do
        extract Mida::SchemaOrg::MedicalEvidenceLevel
      end

      # Source of the data used to formulate the guidance, e.g. RCT, consensus opinion, etc.
      has_many 'evidenceOrigin'

      # Date on which this guideline's recommendation was made.
      has_many 'guidelineDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The medical conditions, treatments, etc. that are the subject of the guideline.
      has_many 'guidelineSubject' do
        extract Mida::SchemaOrg::MedicalEntity
        extract Mida::DataType::Text
      end
    end

  end
end
