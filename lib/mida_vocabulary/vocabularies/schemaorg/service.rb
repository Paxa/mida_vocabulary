require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A service provided by an organization, e.g. delivery service, print services, etc.
    class Service < Mida::Vocabulary
      itemtype %r{http://schema.org/Service}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
