require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # The publication format of the book.
    class BookFormatType < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
