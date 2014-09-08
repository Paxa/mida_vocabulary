require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :PaymentMethod, 'mida_vocabulary/vocabularies/schemaorg/paymentmethod'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'
    autoload :ItemAvailability, 'mida_vocabulary/vocabularies/schemaorg/itemavailability'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :DeliveryMethod, 'mida_vocabulary/vocabularies/schemaorg/deliverymethod'
    autoload :BusinessFunction, 'mida_vocabulary/vocabularies/schemaorg/businessfunction'
    autoload :BusinessEntityType, 'mida_vocabulary/vocabularies/schemaorg/businessentitytype'
    autoload :GeoShape, 'mida_vocabulary/vocabularies/schemaorg/geoshape'
    autoload :PriceSpecification, 'mida_vocabulary/vocabularies/schemaorg/pricespecification'
    autoload :TypeAndQuantityNode, 'mida_vocabulary/vocabularies/schemaorg/typeandquantitynode'
    autoload :OfferItemCondition, 'mida_vocabulary/vocabularies/schemaorg/offeritemcondition'
    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :WarrantyPromise, 'mida_vocabulary/vocabularies/schemaorg/warrantypromise'

    # A demand entity represents the public, not necessarily binding, not necessarily exclusive, announcement by an organization or person to seek a certain type of goods or services. For describing demand using this type, the very same properties used for Offer apply.
    class Demand < Mida::Vocabulary
      itemtype %r{http://schema.org/Demand}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The payment method(s) accepted by seller for this offer.
      has_many 'acceptedPaymentMethod' do
        extract Mida::SchemaOrg::PaymentMethod
      end

      # The amount of time that is required between accepting the offer and the actual usage of the resource or service.
      has_many 'advanceBookingRequirement' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The availability of this item - for example In stock, Out of stock, Pre-order, etc.
      has_many 'availability' do
        extract Mida::SchemaOrg::ItemAvailability
      end

      # The end of the availability of the product or service included in the offer.
      has_many 'availabilityEnds' do
        extract Mida::DataType::ISO8601Date
      end

      # The beginning of the availability of the product or service included in the offer.
      has_many 'availabilityStarts' do
        extract Mida::DataType::ISO8601Date
      end

      # The place(s) from which the offer can be obtained (e.g. store locations).
      has_many 'availableAtOrFrom' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # The delivery method(s) available for this offer.
      has_many 'availableDeliveryMethod' do
        extract Mida::SchemaOrg::DeliveryMethod
      end

      # The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.
      has_many 'businessFunction' do
        extract Mida::SchemaOrg::BusinessFunction
      end

      # The typical delay between the receipt of the order and the goods leaving the warehouse.
      has_many 'deliveryLeadTime' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The type(s) of customers for which the given offer is valid.
      has_many 'eligibleCustomerType' do
        extract Mida::SchemaOrg::BusinessEntityType
      end

      # The duration for which the given offer is valid.
      has_many 'eligibleDuration' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.
      has_many 'eligibleQuantity' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.
      has_many 'eligibleRegion' do
        extract Mida::SchemaOrg::GeoShape
        extract Mida::DataType::Text
      end

      # The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.
      has_many 'eligibleTransactionVolume' do
        extract Mida::SchemaOrg::PriceSpecification
        extract Mida::DataType::Text
      end

      # The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero.
      has_many 'gtin13'

      # The GTIN-14 code of the product, or the product to which the offer refers.
      has_many 'gtin14'

      # The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN.
      has_many 'gtin8'

      # This links to a node or nodes indicating the exact quantity of the products included in the offer.
      has_many 'includesObject' do
        extract Mida::SchemaOrg::TypeAndQuantityNode
        extract Mida::DataType::Text
      end

      # The current approximate inventory level for the item or items.
      has_many 'inventoryLevel' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.
      has_many 'itemCondition' do
        extract Mida::SchemaOrg::OfferItemCondition
      end

      # The item being offered.
      has_many 'itemOffered' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.
      has_many 'mpn'

      # One or more detailed price specifications, indicating the unit price and delivery or payment charges.
      has_many 'priceSpecification' do
        extract Mida::SchemaOrg::PriceSpecification
        extract Mida::DataType::Text
      end

      # An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider. Supercedes merchant, vendor.
      has_many 'seller' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.
      has_many 'serialNumber'

      # The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.
      has_many 'sku'

      # The date when the item becomes valid.
      has_many 'validFrom' do
        extract Mida::DataType::ISO8601Date
      end

      # The end of the validity of offer, price specification, or opening hours data.
      has_many 'validThrough' do
        extract Mida::DataType::ISO8601Date
      end

      # The warranty promise(s) included in the offer.
      has_many 'warranty' do
        extract Mida::SchemaOrg::WarrantyPromise
        extract Mida::DataType::Text
      end
    end

  end
end
