require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A trip on a commercial bus line.
    class BusTrip < Mida::Vocabulary
      itemtype %r{http://schema.org/BusTrip}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
