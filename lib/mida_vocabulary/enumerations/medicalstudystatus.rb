require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # The status of a medical study. Enumerated type.
    class MedicalStudyStatus < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
