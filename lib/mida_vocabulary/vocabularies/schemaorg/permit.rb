require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Service, 'mida_vocabulary/vocabularies/schemaorg/service'
    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Duration, 'mida_vocabulary/vocabularies/schemaorg/duration'
    autoload :AdministrativeArea, 'mida_vocabulary/vocabularies/schemaorg/administrativearea'

    # A permit issued by an organization, e.g. a parking pass.
    class Permit < Mida::Vocabulary
      itemtype %r{http://schema.org/Permit}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The organization issuing the ticket or permit.
      has_many 'issuedBy' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # The service through with the permit was granted.
      has_many 'issuedThrough' do
        extract Mida::SchemaOrg::Service
        extract Mida::DataType::Text
      end

      # The target audience for this permit.
      has_many 'permitAudience' do
        extract Mida::SchemaOrg::Audience
        extract Mida::DataType::Text
      end

      # The time validity of the permit.
      has_many 'validFor' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # The date when the item becomes valid.
      has_many 'validFrom' do
        extract Mida::DataType::ISO8601Date
      end

      # The geographic area where the permit is valid.
      has_many 'validIn' do
        extract Mida::SchemaOrg::AdministrativeArea
        extract Mida::DataType::Text
      end

      # The date when the item is no longer valid.
      has_many 'validUntil' do
        extract Mida::DataType::ISO8601Date
      end
    end

  end
end
