require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalContraindication, 'mida_vocabulary/vocabularies/schemaorg/medicalcontraindication'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalIndication, 'mida_vocabulary/vocabularies/schemaorg/medicalindication'

    # Any medical intervention designed to prevent, treat, and cure human diseases and medical conditions, including both curative and palliative therapies. Medical therapies are typically processes of care relying upon pharmacotherapy, behavioral therapy, supportive therapy (with fluid or nutrition for example), or detoxification (e.g. hemodialysis) aimed at improving or preventing a health condition.
    class MedicalTherapy < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalTherapy}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # A possible complication and/or side effect of this therapy. If it is known that an adverse outcome is serious (resulting in death, disability, or permanent damage; requiring hospitalization; or is otherwise life-threatening or requires immediate medical attention), tag it as a seriouseAdverseOutcome instead.
      has_many 'adverseOutcome' do
        extract Mida::SchemaOrg::MedicalEntity
        extract Mida::DataType::Text
      end

      # A contraindication for this therapy.
      has_many 'contraindication' do
        extract Mida::SchemaOrg::MedicalContraindication
        extract Mida::DataType::Text
      end

      # A therapy that duplicates or overlaps this one.
      has_many 'duplicateTherapy' do
        extract Mida::SchemaOrg::MedicalTherapy
        extract Mida::DataType::Text
      end

      # A factor that indicates use of this therapy for treatment and/or prevention of a condition, symptom, etc. For therapies such as drugs, indications can include both officially-approved indications as well as off-label uses. These can be distinguished by using the ApprovedIndication subtype of MedicalIndication.
      has_many 'indication' do
        extract Mida::SchemaOrg::MedicalIndication
        extract Mida::DataType::Text
      end

      # A possible serious complication and/or serious side effect of this therapy. Serious adverse outcomes include those that are life-threatening; result in death, disability, or permanent damage; require hospitalization or prolong existing hospitalization; cause congenital anomalies or birth defects; or jeopardize the patient and may require medical or surgical intervention to prevent one of the outcomes in this definition.
      has_many 'seriousAdverseOutcome' do
        extract Mida::SchemaOrg::MedicalEntity
        extract Mida::DataType::Text
      end
    end

  end
end
