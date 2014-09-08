require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalStudy, 'mida_vocabulary/vocabularies/schemaorg/medicalstudy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalTrialDesign, 'mida_vocabulary/vocabularies/schemaorg/medicaltrialdesign'

    # A medical trial is a type of medical study that uses scientific process used to compare the safety and efficacy of medical therapies or medical procedures. In general, medical trials are controlled and subjects are allocated at random to the different treatment and/or control groups.
    class MedicalTrial < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalTrial}i
      include_vocabulary Mida::SchemaOrg::MedicalStudy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The phase of the trial.
      has_many 'phase'

      # Specifics about the trial design (enumerated).
      has_many 'trialDesign' do
        extract Mida::SchemaOrg::MedicalTrialDesign
      end
    end

  end
end
