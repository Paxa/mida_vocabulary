require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Target audiences for medical web pages. Enumerated type.
    class MedicalAudience < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
