require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :ContactPoint, 'mida_vocabulary/vocabularies/schemaorg/contactpoint'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Country, 'mida_vocabulary/vocabularies/schemaorg/country'

    # The mailing address.
    class PostalAddress < Mida::Vocabulary
      itemtype %r{http://schema.org/PostalAddress}i
      include_vocabulary Mida::SchemaOrg::ContactPoint
      include_vocabulary Mida::SchemaOrg::Thing

      # The country. For example, USA. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
      has_many 'addressCountry' do
        extract Mida::SchemaOrg::Country
        extract Mida::DataType::Text
      end

      # The locality. For example, Mountain View.
      has_many 'addressLocality'

      # The region. For example, CA.
      has_many 'addressRegion'

      # The post office box number for PO box addresses.
      has_many 'postOfficeBoxNumber'

      # The postal code. For example, 94043.
      has_many 'postalCode'

      # The street address. For example, 1600 Amphitheatre Pkwy.
      has_many 'streetAddress'
    end

  end
end
