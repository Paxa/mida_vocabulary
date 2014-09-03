require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalCondition, 'mida_vocabulary/vocabularies/schemaorg/medicalcondition'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An infectious disease is a clinically evident human disease resulting from the presence of pathogenic microbial agents, like pathogenic viruses, pathogenic bacteria, fungi, protozoa, multicellular parasites, and prions. To be considered an infectious disease, such pathogens are known to be able to cause this disease.
    class InfectiousDisease < Mida::Vocabulary
      itemtype %r{http://schema.org/InfectiousDisease}i
      include_vocabulary Mida::SchemaOrg::MedicalCondition
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
