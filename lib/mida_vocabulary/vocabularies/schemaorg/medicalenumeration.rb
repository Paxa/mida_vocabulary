require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Enumerations related to health and the practice of medicine.
    class MedicalEnumeration < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
