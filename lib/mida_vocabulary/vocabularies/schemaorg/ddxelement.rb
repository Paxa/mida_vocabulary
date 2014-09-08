require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MedicalCondition, 'mida_vocabulary/vocabularies/schemaorg/medicalcondition'
    autoload :MedicalSignOrSymptom, 'mida_vocabulary/vocabularies/schemaorg/medicalsignorsymptom'

    # An alternative, closely-related condition typically considered later in the differential diagnosis process along with the signs that are used to distinguish it.
    class DDxElement < Mida::Vocabulary
      itemtype %r{http://schema.org/DDxElement}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # One or more alternative conditions considered in the differential diagnosis process.
      has_many 'diagnosis' do
        extract Mida::SchemaOrg::MedicalCondition
        extract Mida::DataType::Text
      end

      # One of a set of signs and symptoms that can be used to distinguish this diagnosis from others in the differential diagnosis.
      has_many 'distinguishingSign' do
        extract Mida::SchemaOrg::MedicalSignOrSymptom
        extract Mida::DataType::Text
      end
    end

  end
end
