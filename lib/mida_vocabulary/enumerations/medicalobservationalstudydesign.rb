require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Design models for observational medical studies. Enumerated type.
    class MedicalObservationalStudyDesign < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
