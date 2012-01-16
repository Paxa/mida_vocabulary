require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'

    # A dance group - for example, the Alvin Ailey Dance Theater or Riverdance.
    class DanceGroup < Mida::Vocabulary
      itemtype %r{http://schema.org/DanceGroup}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Organization
    end

  end
end
