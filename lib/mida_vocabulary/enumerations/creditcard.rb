require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # A credit or debit card type as a standardized procedure for transferring the monetary amount for a purchase. Commonly used values: http://purl.org/goodrelations/v1#AmericanExpress http://purl.org/goodrelations/v1#DinersClub http://purl.org/goodrelations/v1#Discover http://purl.org/goodrelations/v1#JCB http://purl.org/goodrelations/v1#MasterCard http://purl.org/goodrelations/v1#VISA
    class CreditCard < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
