require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # A type of physical examination of a patient performed by a physician. Enumerated type.
    class PhysicalExam < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
