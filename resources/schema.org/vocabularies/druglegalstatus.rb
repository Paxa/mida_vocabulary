require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AdministrativeArea, 'mida_vocabulary/vocabularies/schemaorg/administrativearea'

    # The legal availability status of a medical drug.
    class DrugLegalStatus < Mida::Vocabulary
      itemtype %r{http://schema.org/DrugLegalStatus}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The location in which the status applies.
      has_many 'applicableLocation' do
        extract Mida::SchemaOrg::AdministrativeArea
        extract Mida::DataType::Text
      end
    end

  end
end
