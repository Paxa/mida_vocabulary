require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An airline flight.
    class Flight < Mida::Vocabulary
      itemtype %r{http://schema.org/Flight}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
