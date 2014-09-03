require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # A predefined value for a product characteristic, e.g. the the power cord plug type "US" or the garment sizes "S", "M", "L", and "XL"
    class QualitativeValue < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
