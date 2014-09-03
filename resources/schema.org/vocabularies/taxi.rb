require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Service, 'mida_vocabulary/vocabularies/schemaorg/service'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A taxi.
    class Taxi < Mida::Vocabulary
      itemtype %r{http://schema.org/Taxi}i
      include_vocabulary Mida::SchemaOrg::Service
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
