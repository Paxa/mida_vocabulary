require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A structured value providing information about the opening hours of a place or a certain service inside a place.
    class OpeningHoursSpecification < Mida::Vocabulary
      itemtype %r{http://schema.org/OpeningHoursSpecification}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
