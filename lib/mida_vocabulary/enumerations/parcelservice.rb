require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # A private parcel service as the delivery mode available for a certain offer. Commonly used values: http://purl.org/goodrelations/v1#DHL http://purl.org/goodrelations/v1#FederalExpress http://purl.org/goodrelations/v1#UPS
    class ParcelService < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
