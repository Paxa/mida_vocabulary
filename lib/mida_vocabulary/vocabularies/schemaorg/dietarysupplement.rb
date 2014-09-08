require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :DrugLegalStatus, 'mida_vocabulary/vocabularies/schemaorg/druglegalstatus'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :MaximumDoseSchedule, 'mida_vocabulary/vocabularies/schemaorg/maximumdoseschedule'
    autoload :RecommendedDoseSchedule, 'mida_vocabulary/vocabularies/schemaorg/recommendeddoseschedule'

    # A product taken by mouth that contains a dietary ingredient intended to supplement the diet. Dietary ingredients may include vitamins, minerals, herbs or other botanicals, amino acids, and substances such as enzymes, organ tissues, glandulars and metabolites.
    class DietarySupplement < Mida::Vocabulary
      itemtype %r{http://schema.org/DietarySupplement}i
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # An active ingredient, typically chemical compounds and/or biologic substances.
      has_many 'activeIngredient'

      # Descriptive information establishing a historical perspective on the supplement. May include the rationale for the name, the population where the supplement first came to prominence, etc.
      has_many 'background'

      # A dosage form in which this drug/supplement is available, e.g. 'tablet', 'suspension', 'injection'.
      has_many 'dosageForm'

      # True if this item's name is a proprietary/brand name (vs. generic name).
      has_many 'isProprietary' do
        extract Mida::DataType::Boolean
      end

      # The drug or supplement's legal status, including any controlled substance schedules that apply.
      has_many 'legalStatus' do
        extract Mida::SchemaOrg::DrugLegalStatus
        extract Mida::DataType::Text
      end

      # The manufacturer of the product.
      has_many 'manufacturer' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # Recommended intake of this supplement for a given population as defined by a specific recommending authority.
      has_many 'maximumIntake' do
        extract Mida::SchemaOrg::MaximumDoseSchedule
        extract Mida::DataType::Text
      end

      # The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.
      has_many 'mechanismOfAction'

      # The generic name of this drug or supplement.
      has_many 'nonProprietaryName'

      # Recommended intake of this supplement for a given population as defined by a specific recommending authority.
      has_many 'recommendedIntake' do
        extract Mida::SchemaOrg::RecommendedDoseSchedule
        extract Mida::DataType::Text
      end

      # Any potential safety concern associated with the supplement. May include interactions with other drugs and foods, pregnancy, breastfeeding, known adverse reactions, and documented efficacy of the supplement.
      has_many 'safetyConsideration'

      # Characteristics of the population for which this is intended, or which typically uses it, e.g. 'adults'.
      has_many 'targetPopulation'
    end

  end
end
