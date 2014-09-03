require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A means for accessing a service, e.g. a government office location, web site, or phone number.
    class ServiceChannel < Mida::Vocabulary
      itemtype %r{http://schema.org/ServiceChannel}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
