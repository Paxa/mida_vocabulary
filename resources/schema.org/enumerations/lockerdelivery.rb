require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # A DeliveryMethod in which an item is made available via locker.
    class LockerDelivery < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
