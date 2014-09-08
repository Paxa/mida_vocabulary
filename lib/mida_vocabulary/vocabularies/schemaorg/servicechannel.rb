require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Language, 'mida_vocabulary/vocabularies/schemaorg/language'
    autoload :Duration, 'mida_vocabulary/vocabularies/schemaorg/duration'
    autoload :Service, 'mida_vocabulary/vocabularies/schemaorg/service'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :ContactPoint, 'mida_vocabulary/vocabularies/schemaorg/contactpoint'
    autoload :PostalAddress, 'mida_vocabulary/vocabularies/schemaorg/postaladdress'

    # A means for accessing a service, e.g. a government office location, web site, or phone number.
    class ServiceChannel < Mida::Vocabulary
      itemtype %r{http://schema.org/ServiceChannel}i
      include_vocabulary Mida::SchemaOrg::Thing

      # A language someone may use with the item.
      has_many 'availableLanguage' do
        extract Mida::SchemaOrg::Language
        extract Mida::DataType::Text
      end

      # Estimated processing time for the service using this channel.
      has_many 'processingTime' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # The service provided by this channel.
      has_many 'providesService' do
        extract Mida::SchemaOrg::Service
        extract Mida::DataType::Text
      end

      # The location (e.g. civic structure, local business, etc.) where a person can go to access the service.
      has_many 'serviceLocation' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # The phone number to use to access the service.
      has_many 'servicePhone' do
        extract Mida::SchemaOrg::ContactPoint
        extract Mida::DataType::Text
      end

      # The address for accessing the service by mail.
      has_many 'servicePostalAddress' do
        extract Mida::SchemaOrg::PostalAddress
        extract Mida::DataType::Text
      end

      # The number to access the service by text message.
      has_many 'serviceSmsNumber' do
        extract Mida::SchemaOrg::ContactPoint
        extract Mida::DataType::Text
      end

      # The website to access the service.
      has_many 'serviceUrl' do
        extract Mida::DataType::URL
      end
    end

  end
end
