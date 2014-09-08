require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # An enumeration that describes different types of medical procedures.
    class MedicalProcedureType < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
