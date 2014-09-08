require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Any branch of a field in which people typically develop specific expertise, usually after significant study, time, and effort.
    class Specialty < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
