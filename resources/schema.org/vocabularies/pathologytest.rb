require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalTest, 'mida_vocabulary/vocabularies/schemaorg/medicaltest'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A medical test performed by a laboratory that typically involves examination of a tissue sample by a pathologist.
    class PathologyTest < Mida::Vocabulary
      itemtype %r{http://schema.org/PathologyTest}i
      include_vocabulary Mida::SchemaOrg::MedicalTest
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
