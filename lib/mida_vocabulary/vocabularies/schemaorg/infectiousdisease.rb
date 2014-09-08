require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalCondition, 'mida_vocabulary/vocabularies/schemaorg/medicalcondition'
    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :InfectiousAgentClass, 'mida_vocabulary/vocabularies/schemaorg/infectiousagentclass'

    # An infectious disease is a clinically evident human disease resulting from the presence of pathogenic microbial agents, like pathogenic viruses, pathogenic bacteria, fungi, protozoa, multicellular parasites, and prions. To be considered an infectious disease, such pathogens are known to be able to cause this disease.
    class InfectiousDisease < Mida::Vocabulary
      itemtype %r{http://schema.org/InfectiousDisease}i
      include_vocabulary Mida::SchemaOrg::MedicalCondition
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing

      # The actual infectious agent, such as a specific bacterium.
      has_many 'infectiousAgent'

      # The class of infectious agent (bacteria, prion, etc.) that causes the disease.
      has_many 'infectiousAgentClass' do
        extract Mida::SchemaOrg::InfectiousAgentClass
      end

      # How the disease spreads, either as a route or vector, for example 'direct contact', 'Aedes aegypti', etc.
      has_many 'transmissionMethod'
    end

  end
end
