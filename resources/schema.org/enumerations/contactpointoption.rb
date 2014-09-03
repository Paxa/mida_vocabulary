require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Enumerated options related to a ContactPoint
    class ContactPointOption < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
