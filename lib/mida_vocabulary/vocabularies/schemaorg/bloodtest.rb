require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTest, 'mida_vocabulary/vocabularies/schemaorg/medicaltest'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A medical test performed on a sample of a patient's blood.
    class BloodTest < Mida::Vocabulary
      itemtype %r{http://schema.org/BloodTest}i
      include_vocabulary Mida::SchemaOrg::MedicalTest
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
