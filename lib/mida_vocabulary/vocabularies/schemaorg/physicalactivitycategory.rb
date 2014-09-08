require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Categories of physical activity, organized by physiologic classification.
    class PhysicalActivityCategory < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
