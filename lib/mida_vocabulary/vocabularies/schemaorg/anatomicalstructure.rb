require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Any part of the human body, typically a component of an anatomical system. Organs, tissues, and cells are all anatomical structures.
    class AnatomicalStructure < Mida::Vocabulary
      itemtype %r{http://schema.org/AnatomicalStructure}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
