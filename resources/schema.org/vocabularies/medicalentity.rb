require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The most generic type of entity related to health and the practice of medicine.
    class MedicalEntity < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalEntity}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
