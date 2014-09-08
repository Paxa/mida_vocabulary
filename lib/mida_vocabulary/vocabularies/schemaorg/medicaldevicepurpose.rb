require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Categories of medical devices, organized by the purpose or intended use of the device.
    class MedicalDevicePurpose < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
