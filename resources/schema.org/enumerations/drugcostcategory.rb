require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Enumerated categories of medical drug costs.
    class DrugCostCategory < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
