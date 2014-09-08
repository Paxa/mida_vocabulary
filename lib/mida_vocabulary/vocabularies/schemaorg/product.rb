require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :AggregateRating, 'mida_vocabulary/vocabularies/schemaorg/aggregaterating'
    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Brand, 'mida_vocabulary/vocabularies/schemaorg/brand'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Distance, 'mida_vocabulary/vocabularies/schemaorg/distance'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'
    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :OfferItemCondition, 'mida_vocabulary/vocabularies/schemaorg/offeritemcondition'
    autoload :ImageObject, 'mida_vocabulary/vocabularies/schemaorg/imageobject'
    autoload :ProductModel, 'mida_vocabulary/vocabularies/schemaorg/productmodel'
    autoload :Offer, 'mida_vocabulary/vocabularies/schemaorg/offer'
    autoload :Review, 'mida_vocabulary/vocabularies/schemaorg/review'

    # Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.
    class Product < Mida::Vocabulary
      itemtype %r{http://schema.org/Product}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The overall rating, based on a collection of reviews or ratings, of the item.
      has_many 'aggregateRating' do
        extract Mida::SchemaOrg::AggregateRating
        extract Mida::DataType::Text
      end

      # The intended audience of the item, i.e. the group for whom the item was created.
      has_many 'audience' do
        extract Mida::SchemaOrg::Audience
        extract Mida::DataType::Text
      end

      # The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
      has_many 'brand' do
        extract Mida::SchemaOrg::Brand
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # The color of the product.
      has_many 'color'

      # The depth of the product.
      has_many 'depth' do
        extract Mida::SchemaOrg::Distance
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero.
      has_many 'gtin13'

      # The GTIN-14 code of the product, or the product to which the offer refers.
      has_many 'gtin14'

      # The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN.
      has_many 'gtin8'

      # The height of the item.
      has_many 'height' do
        extract Mida::SchemaOrg::Distance
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # A pointer to another product (or multiple products) for which this product is an accessory or spare part.
      has_many 'isAccessoryOrSparePartFor' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # A pointer to another product (or multiple products) for which this product is a consumable.
      has_many 'isConsumableFor' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # A pointer to another, somehow related product (or multiple products).
      has_many 'isRelatedTo' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # A pointer to another, functionally similar product (or multiple products).
      has_many 'isSimilarTo' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.
      has_many 'itemCondition' do
        extract Mida::SchemaOrg::OfferItemCondition
      end

      # A logo associated with an organization.
      has_many 'logo' do
        extract Mida::DataType::URL
        extract Mida::SchemaOrg::ImageObject
        extract Mida::DataType::Text
      end

      # The manufacturer of the product.
      has_many 'manufacturer' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # The model of the product. Use with the URL of a ProductModel or a textual representation of the model identifier. The URL of the ProductModel can be from an external source. It is recommended to additionally provide strong product identifiers via the gtin8/gtin13/gtin14 and mpn properties.
      has_many 'model' do
        extract Mida::SchemaOrg::ProductModel
        extract Mida::DataType::Text
      end

      # The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.
      has_many 'mpn'

      # An offer to provide this item - for example, an offer to sell a product, rent the DVD of a movie, or give away tickets to an event.
      has_many 'offers' do
        extract Mida::SchemaOrg::Offer
        extract Mida::DataType::Text
      end

      # The product identifier, such as ISBN. For example: <meta itemprop='productID' content='isbn:123-456-789'/>.
      has_many 'productID'

      # The release date of a product or product model. This can be used to distinguish the exact variant of a product.
      has_many 'releaseDate' do
        extract Mida::DataType::ISO8601Date
      end

      # A review of the item. Supercedes reviews.
      has_many 'review' do
        extract Mida::SchemaOrg::Review
        extract Mida::DataType::Text
      end

      # The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.
      has_many 'sku'

      # The weight of the product.
      has_many 'weight' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # The width of the item.
      has_many 'width' do
        extract Mida::SchemaOrg::Distance
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end
    end

  end
end
