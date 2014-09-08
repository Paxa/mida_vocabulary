require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Design models for medical trials. Enumerated type.
    class MedicalTrialDesign < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
