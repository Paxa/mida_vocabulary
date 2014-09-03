require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A trip on a commercial train line.
    class TrainTrip < Mida::Vocabulary
      itemtype %r{http://schema.org/TrainTrip}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
