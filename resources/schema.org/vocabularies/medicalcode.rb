require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A code for a medical entity.
    class MedicalCode < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalCode}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The actual code.
      has_many 'codeValue'

      # The coding system, e.g. 'ICD-10'.
      has_many 'codingSystem'
    end

  end
end
