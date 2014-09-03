require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # EventStatusType is an enumeration type whose instances represent several states that an Event may be in.
    class EventStatusType < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
