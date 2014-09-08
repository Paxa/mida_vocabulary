require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # A business entity type is a conceptual entity representing the legal form, the size, the main line of business, the position in the value chain, or any combination thereof, of an organization or business person. Commonly used values: http://purl.org/goodrelations/v1#Business http://purl.org/goodrelations/v1#Enduser http://purl.org/goodrelations/v1#PublicInstitution http://purl.org/goodrelations/v1#Reseller
    class BusinessEntityType < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
