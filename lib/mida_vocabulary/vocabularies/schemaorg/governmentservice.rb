require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Service, 'mida_vocabulary/vocabularies/schemaorg/service'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A service provided by a government organization, e.g. food stamps, veterans benefits, etc.
    class GovernmentService < Mida::Vocabulary
      itemtype %r{http://schema.org/GovernmentService}i
      include_vocabulary Mida::SchemaOrg::Service
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
