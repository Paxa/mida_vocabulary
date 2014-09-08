require 'mida_vocabulary/datatype/generic'
require 'date'

module Mida
  module DataType

    # ISO 8601 Date data type
    # Provides access to DateTime methods
    class Time < Generic

      # Raises +ArgumentError+ if value not valid
      def initialize(value)
        @parsedValue = ::DateTime.parse(value)
      rescue => e
        raise ArgumentError, e
      end

      def to_s
        @parsedValue.strftime("%I:%M%P")
      end

    end

  end
end
