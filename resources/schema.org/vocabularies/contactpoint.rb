require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AdministrativeArea, 'mida_vocabulary/vocabularies/schemaorg/administrativearea'
    autoload :Language, 'mida_vocabulary/vocabularies/schemaorg/language'
    autoload :ContactPointOption, 'mida_vocabulary/vocabularies/schemaorg/contactpointoption'
    autoload :OpeningHoursSpecification, 'mida_vocabulary/vocabularies/schemaorg/openinghoursspecification'
    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'

    # A contact point - for example, a Customer Complaints department.
    class ContactPoint < Mida::Vocabulary
      itemtype %r{http://schema.org/ContactPoint}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The location served by this contact point (e.g., a phone number intended for Europeans vs. North Americans or only within the United States.)
      has_many 'areaServed' do
        extract Mida::SchemaOrg::AdministrativeArea
        extract Mida::DataType::Text
      end

      # A language someone may use with the item.
      has_many 'availableLanguage' do
        extract Mida::SchemaOrg::Language
        extract Mida::DataType::Text
      end

      # An option available on this contact point (e.g. a toll-free number or support for hearing-impaired callers.)
      has_many 'contactOption' do
        extract Mida::SchemaOrg::ContactPointOption
      end

      # A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.
      has_many 'contactType'

      # Email address.
      has_many 'email'

      # The fax number.
      has_many 'faxNumber'

      # The hours during which this contact point is available.
      has_many 'hoursAvailable' do
        extract Mida::SchemaOrg::OpeningHoursSpecification
        extract Mida::DataType::Text
      end

      # The product or service this support contact point is related to (such as product support for a particular product line). This can be a specific product or product line (e.g. "iPhone") or a general category of products or services (e.g. "smartphones").
      has_many 'productSupported' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # The telephone number.
      has_many 'telephone'
    end

  end
end
