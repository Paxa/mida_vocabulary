require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalGuideline, 'mida_vocabulary/vocabularies/schemaorg/medicalguideline'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A guideline contraindication that designates a process as harmful and where quality of the data supporting the contraindication is sound.
    class MedicalGuidelineContraindication < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalGuidelineContraindication}i
      include_vocabulary Mida::SchemaOrg::MedicalGuideline
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
