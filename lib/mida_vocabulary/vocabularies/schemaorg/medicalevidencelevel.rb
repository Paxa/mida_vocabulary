require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Level of evidence for a medical guideline. Enumerated type.
    class MedicalEvidenceLevel < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
