require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :LocalBusiness, 'mida_vocabulary/vocabularies/schemaorg/localbusiness'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # An emergency service, such as a fire station or ER.
    class EmergencyService < Mida::Vocabulary
      itemtype %r{http://schema.org/EmergencyService}i
      include_vocabulary Mida::SchemaOrg::LocalBusiness
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Place
    end

  end
end
