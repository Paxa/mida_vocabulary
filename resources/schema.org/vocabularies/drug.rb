require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :DrugStrength, 'mida_vocabulary/vocabularies/schemaorg/drugstrength'
    autoload :DrugCost, 'mida_vocabulary/vocabularies/schemaorg/drugcost'
    autoload :DoseSchedule, 'mida_vocabulary/vocabularies/schemaorg/doseschedule'
    autoload :DrugClass, 'mida_vocabulary/vocabularies/schemaorg/drugclass'
    autoload :Drug, 'mida_vocabulary/vocabularies/schemaorg/drug'
    autoload :DrugLegalStatus, 'mida_vocabulary/vocabularies/schemaorg/druglegalstatus'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :DrugPregnancyCategory, 'mida_vocabulary/vocabularies/schemaorg/drugpregnancycategory'
    autoload :DrugPrescriptionStatus, 'mida_vocabulary/vocabularies/schemaorg/drugprescriptionstatus'

    # A chemical or biologic substance, used as a medical therapy, that has a physiological effect on an organism.
    class Drug < Mida::Vocabulary
      itemtype %r{http://schema.org/Drug}i
      include_vocabulary Mida::SchemaOrg::MedicalTherapy
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # An active ingredient, typically chemical compounds and/or biologic substances.
      has_many 'activeIngredient'

      # A route by which this drug may be administered, e.g. 'oral'.
      has_many 'administrationRoute'

      # Any precaution, guidance, contraindication, etc. related to consumption of alcohol while taking this drug.
      has_many 'alcoholWarning'

      # An available dosage strength for the drug.
      has_many 'availableStrength' do
        extract Mida::SchemaOrg::DrugStrength
        extract Mida::DataType::Text
      end

      # Any precaution, guidance, contraindication, etc. related to this drug's use by breastfeeding mothers.
      has_many 'breastfeedingWarning'

      # Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).
      has_many 'clincalPharmacology'

      # Cost per unit of the drug, as reported by the source being tagged.
      has_many 'cost' do
        extract Mida::SchemaOrg::DrugCost
        extract Mida::DataType::Text
      end

      # A dosage form in which this drug/supplement is available, e.g. 'tablet', 'suspension', 'injection'.
      has_many 'dosageForm'

      # A dosing schedule for the drug for a given population, either observed, recommended, or maximum dose based on the type used.
      has_many 'doseSchedule' do
        extract Mida::SchemaOrg::DoseSchedule
        extract Mida::DataType::Text
      end

      # The class of drug this belongs to (e.g., statins).
      has_many 'drugClass' do
        extract Mida::SchemaOrg::DrugClass
        extract Mida::DataType::Text
      end

      # Any precaution, guidance, contraindication, etc. related to consumption of specific foods while taking this drug.
      has_many 'foodWarning'

      # Another drug that is known to interact with this drug in a way that impacts the effect of this drug or causes a risk to the patient. Note: disease interactions are typically captured as contraindications.
      has_many 'interactingDrug' do
        extract Mida::SchemaOrg::Drug
        extract Mida::DataType::Text
      end

      # True if the drug is available in a generic form (regardless of name).
      has_many 'isAvailableGenerically' do
        extract Mida::DataType::Boolean
      end

      # True if this item's name is a proprietary/brand name (vs. generic name).
      has_many 'isProprietary' do
        extract Mida::DataType::Boolean
      end

      # Link to the drug's label details.
      has_many 'labelDetails' do
        extract Mida::DataType::URL
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

      # The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.
      has_many 'mechanismOfAction'

      # The generic name of this drug or supplement.
      has_many 'nonProprietaryName'

      # Any information related to overdose on a drug, including signs or symptoms, treatments, contact information for emergency response.
      has_many 'overdosage'

      # Pregnancy category of this drug.
      has_many 'pregnancyCategory' do
        extract Mida::SchemaOrg::DrugPregnancyCategory
      end

      # Any precaution, guidance, contraindication, etc. related to this drug's use during pregnancy.
      has_many 'pregnancyWarning'

      # Link to prescribing information for the drug.
      has_many 'prescribingInfo' do
        extract Mida::DataType::URL
      end

      # Indicates whether this drug is available by prescription or over-the-counter.
      has_many 'prescriptionStatus' do
        extract Mida::SchemaOrg::DrugPrescriptionStatus
      end

      # Any other drug related to this one, for example commonly-prescribed alternatives.
      has_many 'relatedDrug' do
        extract Mida::SchemaOrg::Drug
        extract Mida::DataType::Text
      end

      # Any FDA or other warnings about the drug (text or URL).
      has_many 'warning' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end
    end

  end
end
