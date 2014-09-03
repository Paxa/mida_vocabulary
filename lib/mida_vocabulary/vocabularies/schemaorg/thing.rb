require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :ImageObject, 'mida_vocabulary/vocabularies/schemaorg/imageobject'
    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'

    # The most generic type of item.
    class Thing < Mida::Vocabulary
      itemtype %r{http://schema.org/Thing}i

      # An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax. This is a relationship between something and a class that the thing is in. In RDFa syntax, it is better to use the native RDFa syntax - the 'typeof' attribute - for multiple types. Schema.org tools may have only weaker understanding of extra types, in particular those defined externally.
      has_many 'additionalType' do
        extract Mida::DataType::URL
      end

      # An alias for the item.
      has_many 'alternateName'

      # A short description of the item.
      has_many 'description'

      # URL of an image of the item.
      has_many 'image' do
        extract Mida::DataType::URL
        extract Mida::SchemaOrg::ImageObject
        extract Mida::DataType::Text
      end

      # The name of the item.
      has_many 'name'

      # Indicates a potential Action, which describes an idealized action in which this thing would play an 'object' role.
      has_many 'potentialAction' do
        extract Mida::SchemaOrg::Action
        extract Mida::DataType::Text
      end

      # URL of a reference Web page that unambiguously indicates the item's identity. E.g. the URL of the item's Wikipedia page, Freebase page, or official website.
      has_many 'sameAs' do
        extract Mida::DataType::URL
      end

      # URL of the item.
      has_many 'url' do
        extract Mida::DataType::URL
      end
    end

  end
end
