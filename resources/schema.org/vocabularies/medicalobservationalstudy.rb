require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalStudy, 'mida_vocabulary/vocabularies/schemaorg/medicalstudy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalObservationalStudyDesign, 'mida_vocabulary/vocabularies/schemaorg/medicalobservationalstudydesign'

    # An observational study is a type of medical study that attempts to infer the possible effect of a treatment through observation of a cohort of subjects over a period of time. In an observational study, the assignment of subjects into treatment groups versus control groups is outside the control of the investigator. This is in contrast with controlled studies, such as the randomized controlled trials represented by MedicalTrial, where each subject is randomly assigned to a treatment group or a control group before the start of the treatment.
    class MedicalObservationalStudy < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalObservationalStudy}i
      include_vocabulary Mida::SchemaOrg::MedicalStudy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # Specifics about the observational study design (enumerated).
      has_many 'studyDesign' do
        extract Mida::SchemaOrg::MedicalObservationalStudyDesign
      end
    end

  end
end
