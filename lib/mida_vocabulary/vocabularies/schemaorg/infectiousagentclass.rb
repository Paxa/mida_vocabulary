require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Classes of agents or pathogens that transmit infectious diseases. Enumerated type.
    class InfectiousAgentClass < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
