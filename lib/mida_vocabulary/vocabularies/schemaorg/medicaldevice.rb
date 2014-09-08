require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalContraindication, 'mida_vocabulary/vocabularies/schemaorg/medicalcontraindication'
    autoload :MedicalIndication, 'mida_vocabulary/vocabularies/schemaorg/medicalindication'
    autoload :MedicalDevicePurpose, 'mida_vocabulary/vocabularies/schemaorg/medicaldevicepurpose'

    # Any object used in a medical capacity, such as to diagnose or treat a patient.
    class MedicalDevice < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalDevice}i
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

      # A factor that indicates use of this therapy for treatment and/or prevention of a condition, symptom, etc. For therapies such as drugs, indications can include both officially-approved indications as well as off-label uses. These can be distinguished by using the ApprovedIndication subtype of MedicalIndication.
      has_many 'indication' do
        extract Mida::SchemaOrg::MedicalIndication
        extract Mida::DataType::Text
      end

      # A description of the postoperative procedures, care, and/or followups for this device.
      has_many 'postOp'

      # A description of the workup, testing, and other preparations required before implanting this device.
      has_many 'preOp'

      # A description of the procedure involved in setting up, using, and/or installing the device.
      has_many 'procedure'

      # A goal towards an action is taken. Can be concrete or abstract.
      has_many 'purpose' do
        extract Mida::SchemaOrg::MedicalDevicePurpose
        extract Mida::SchemaOrg::Thing
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
