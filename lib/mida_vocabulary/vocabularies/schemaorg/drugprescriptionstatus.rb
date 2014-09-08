require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Indicates whether this drug is available by prescription or over-the-counter.
    class DrugPrescriptionStatus < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
