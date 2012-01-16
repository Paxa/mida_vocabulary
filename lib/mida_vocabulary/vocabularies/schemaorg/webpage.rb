require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :CollectionPage, 'mida_vocabulary/vocabularies/schemaorg/collectionpage'
    autoload :WebPageElement, 'mida_vocabulary/vocabularies/schemaorg/webpageelement'
    autoload :ImageObject, 'mida_vocabulary/vocabularies/schemaorg/imageobject'

    # A web page. Every web page is implicitly assumed to be declared to be of type WebPage, so the various properties about that webpage, such as breadcrumb may be used. We recommend explicit declaration if these properties are specified, but if they are found outside of an itemscope, they will be assumed to be about the page
    class WebPage < Mida::Vocabulary
      itemtype %r{http://schema.org/WebPage}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork

      # A set of links that can help a user understand and navigate a website hierarchy.
      has_many 'breadcrumb'

      # Indicates the collection or gallery to which the item belongs.
      has_many 'isPartOf' do
        extract Mida::SchemaOrg::CollectionPage
        extract Mida::DataType::Text
      end

      # Indicates if this web page element is the main subject of the page.
      has_many 'mainContentOfPage' do
        extract Mida::SchemaOrg::WebPageElement
        extract Mida::DataType::Text
      end

      # Indicates the main image on the page
      has_many 'primaryImageOfPage' do
        extract Mida::SchemaOrg::ImageObject
        extract Mida::DataType::Text
      end

      # The most significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most
      has_many 'significantLinks' do
        extract Mida::DataType::URL
      end
    end

  end
end
