require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # A list of possible product availability options.
    class ItemAvailability < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
