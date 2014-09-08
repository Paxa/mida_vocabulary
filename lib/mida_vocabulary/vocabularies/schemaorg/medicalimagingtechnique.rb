require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Any medical imaging modality typically used for diagnostic purposes. Enumerated type.
    class MedicalImagingTechnique < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
