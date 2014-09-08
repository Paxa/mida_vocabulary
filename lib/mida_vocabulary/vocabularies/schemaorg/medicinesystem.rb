require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Systems of medical practice.
    class MedicineSystem < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
