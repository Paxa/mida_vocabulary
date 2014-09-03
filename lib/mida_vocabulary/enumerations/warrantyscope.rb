require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # A range of of services that will be provided to a customer free of charge in case of a defect or malfunction of a product. Commonly used values: http://purl.org/goodrelations/v1#Labor-BringIn http://purl.org/goodrelations/v1#PartsAndLabor-BringIn http://purl.org/goodrelations/v1#PartsAndLabor-PickUp
    class WarrantyScope < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
