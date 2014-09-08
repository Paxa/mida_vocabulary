require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Service, 'mida_vocabulary/vocabularies/schemaorg/service'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'

    # A service provided by a government organization, e.g. food stamps, veterans benefits, etc.
    class GovernmentService < Mida::Vocabulary
      itemtype %r{http://schema.org/GovernmentService}i
      include_vocabulary Mida::SchemaOrg::Service
      include_vocabulary Mida::SchemaOrg::Thing

      # The operating organization, if different from the provider.  This enables the representation of services that are provided by an organization, but operated by another organization like a subcontractor.
      has_many 'serviceOperator' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end
    end

  end
end
