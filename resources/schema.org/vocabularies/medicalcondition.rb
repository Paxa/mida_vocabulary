require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :AnatomicalSystem, 'mida_vocabulary/vocabularies/schemaorg/anatomicalsystem'
    autoload :SuperficialAnatomy, 'mida_vocabulary/vocabularies/schemaorg/superficialanatomy'
    autoload :MedicalCause, 'mida_vocabulary/vocabularies/schemaorg/medicalcause'
    autoload :DDxElement, 'mida_vocabulary/vocabularies/schemaorg/ddxelement'
    autoload :MedicalTherapy, 'mida_vocabulary/vocabularies/schemaorg/medicaltherapy'
    autoload :MedicalRiskFactor, 'mida_vocabulary/vocabularies/schemaorg/medicalriskfactor'
    autoload :MedicalSignOrSymptom, 'mida_vocabulary/vocabularies/schemaorg/medicalsignorsymptom'
    autoload :MedicalConditionStage, 'mida_vocabulary/vocabularies/schemaorg/medicalconditionstage'
    autoload :MedicalTest, 'mida_vocabulary/vocabularies/schemaorg/medicaltest'

    # Any condition of the human body that affects the normal functioning of a person, whether physically or mentally. Includes diseases, injuries, disabilities, disorders, syndromes, etc.
    class MedicalCondition < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalCondition}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The anatomy of the underlying organ system or structures associated with this entity.
      has_many 'associatedAnatomy' do
        extract Mida::SchemaOrg::AnatomicalStructure
        extract Mida::SchemaOrg::AnatomicalSystem
        extract Mida::SchemaOrg::SuperficialAnatomy
        extract Mida::DataType::Text
      end

      # An underlying cause. More specifically, one of the causative agent(s) that are most directly responsible for the pathophysiologic process that eventually results in the occurrence.
      has_many 'cause' do
        extract Mida::SchemaOrg::MedicalCause
        extract Mida::DataType::Text
      end

      # One of a set of differential diagnoses for the condition. Specifically, a closely-related or competing diagnosis typically considered later in the cognitive process whereby this medical condition is distinguished from others most likely responsible for a similar collection of signs and symptoms to reach the most parsimonious diagnosis or diagnoses in a patient.
      has_many 'differentialDiagnosis' do
        extract Mida::SchemaOrg::DDxElement
        extract Mida::DataType::Text
      end

      # The characteristics of associated patients, such as age, gender, race etc.
      has_many 'epidemiology'

      # The likely outcome in either the short term or long term of the medical condition.
      has_many 'expectedPrognosis'

      # The expected progression of the condition if it is not treated and allowed to progress naturally.
      has_many 'naturalProgression'

      # Changes in the normal mechanical, physical, and biochemical functions that are associated with this activity or condition.
      has_many 'pathophysiology'

      # A possible unexpected and unfavorable evolution of a medical condition. Complications may include worsening of the signs or symptoms of the disease, extension of the condition to other organ systems, etc.
      has_many 'possibleComplication'

      # A possible treatment to address this condition, sign or symptom.
      has_many 'possibleTreatment' do
        extract Mida::SchemaOrg::MedicalTherapy
        extract Mida::DataType::Text
      end

      # A preventative therapy used to prevent an initial occurrence of the medical condition, such as vaccination.
      has_many 'primaryPrevention' do
        extract Mida::SchemaOrg::MedicalTherapy
        extract Mida::DataType::Text
      end

      # A modifiable or non-modifiable factor that increases the risk of a patient contracting this condition, e.g. age,  coexisting condition.
      has_many 'riskFactor' do
        extract Mida::SchemaOrg::MedicalRiskFactor
        extract Mida::DataType::Text
      end

      # A preventative therapy used to prevent reoccurrence of the medical condition after an initial episode of the condition.
      has_many 'secondaryPrevention' do
        extract Mida::SchemaOrg::MedicalTherapy
        extract Mida::DataType::Text
      end

      # A sign or symptom of this condition. Signs are objective or physically observable manifestations of the medical condition while symptoms are the subjective experience of the medical condition.
      has_many 'signOrSymptom' do
        extract Mida::SchemaOrg::MedicalSignOrSymptom
        extract Mida::DataType::Text
      end

      # The stage of the condition, if applicable.
      has_many 'stage' do
        extract Mida::SchemaOrg::MedicalConditionStage
        extract Mida::DataType::Text
      end

      # A more specific type of the condition, where applicable, for example 'Type 1 Diabetes', 'Type 2 Diabetes', or 'Gestational Diabetes' for Diabetes.
      has_many 'subtype'

      # A medical test typically performed given this condition.
      has_many 'typicalTest' do
        extract Mida::SchemaOrg::MedicalTest
        extract Mida::DataType::Text
      end
    end

  end
end
