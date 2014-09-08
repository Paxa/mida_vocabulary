require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :MedicalStudyStatus, 'mida_vocabulary/vocabularies/schemaorg/medicalstudystatus'
    autoload :AdministrativeArea, 'mida_vocabulary/vocabularies/schemaorg/administrativearea'

    # A medical study is an umbrella type covering all kinds of research studies relating to human medicine or health, including observational studies and interventional trials and registries, randomized, controlled or not. When the specific type of study is known, use one of the extensions of this type, such as MedicalTrial or MedicalObservationalStudy. Also, note that this type should be used to mark up data that describes the study itself; to tag an article that publishes the results of a study, use MedicalScholarlyArticle. Note: use the code property of MedicalEntity to store study IDs, e.g. clinicaltrials.gov ID.
    class MedicalStudy < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalStudy}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # Expected or actual outcomes of the study.
      has_many 'outcome'

      # Any characteristics of the population used in the study, e.g. 'males under 65'.
      has_many 'population'

      # Sponsor of the study.
      has_many 'sponsor' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # The status of the study (enumerated).
      has_many 'status' do
        extract Mida::SchemaOrg::MedicalStudyStatus
      end

      # The location in which the study is taking/took place.
      has_many 'studyLocation' do
        extract Mida::SchemaOrg::AdministrativeArea
        extract Mida::DataType::Text
      end

      # A subject of the study, i.e. one of the medical conditions, therapies, devices, drugs, etc. investigated by the study.
      has_many 'studySubject' do
        extract Mida::SchemaOrg::MedicalEntity
        extract Mida::DataType::Text
      end
    end

  end
end
