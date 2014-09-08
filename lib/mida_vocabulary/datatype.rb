module Mida
  # Module to hold the various data types.
  # Each DataType should be a module containing the class method: +extract+
  # which returns the value extracted or raises an +ArgumentError+ exception
  # if input value is not valid.
  module DataType
  end
end

require 'mida_vocabulary/datatype/boolean'
require 'mida_vocabulary/datatype/enumeration'
require 'mida_vocabulary/datatype/float'
require 'mida_vocabulary/datatype/integer'
require 'mida_vocabulary/datatype/iso8601date'
require 'mida_vocabulary/datatype/number'
require 'mida_vocabulary/datatype/text'
require 'mida_vocabulary/datatype/url'
require 'mida_vocabulary/datatype/time'
