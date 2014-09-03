require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MedicalEntity, 'mida_vocabulary/vocabularies/schemaorg/medicalentity'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An alternative, closely-related condition typically considered later in the differential diagnosis process along with the signs that are used to distinguish it.
    class DDxElement < Mida::Vocabulary
      itemtype %r{http://schema.org/DDxElement}i
      include_vocabulary Mida::SchemaOrg::MedicalEntity
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
