require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :AnatomicalStructure, 'mida_vocabulary/vocabularies/schemaorg/anatomicalstructure'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A short band of tough, flexible, fibrous connective tissue that functions to connect multiple bones, cartilages, and structurally support joints.
    class Ligament < Mida::Vocabulary
      itemtype %r{http://schema.org/Ligament}i
      include_vocabulary Mida::SchemaOrg::AnatomicalStructure
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
