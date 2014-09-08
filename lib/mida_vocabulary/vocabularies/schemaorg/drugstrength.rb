require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AdministrativeArea, 'mida_vocabulary/vocabularies/schemaorg/administrativearea'

    # A specific strength in which a medical drug is available in a specific country.
    class DrugStrength < Mida::Vocabulary
      itemtype %r{http://schema.org/DrugStrength}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # An active ingredient, typically chemical compounds and/or biologic substances.
      has_many 'activeIngredient'

      # The location in which the strength is available.
      has_many 'availableIn' do
        extract Mida::SchemaOrg::AdministrativeArea
        extract Mida::DataType::Text
      end

      # The units of an active ingredient's strength, e.g. mg.
      has_many 'strengthUnit'

      # The value of an active ingredient's strength, e.g. 325.
      has_many 'strengthValue' do
        extract Mida::DataType::Number
      end
    end

  end
end
