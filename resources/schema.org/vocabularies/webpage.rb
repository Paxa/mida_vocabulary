require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :WebPageElement, 'mida_vocabulary/vocabularies/schemaorg/webpageelement'
    autoload :ImageObject, 'mida_vocabulary/vocabularies/schemaorg/imageobject'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :Specialty, 'mida_vocabulary/vocabularies/schemaorg/specialty'

    # A web page. Every web page is implicitly assumed to be declared to be of type WebPage, so the various properties about that webpage, such as breadcrumb may be used. We recommend explicit declaration if these properties are specified, but if they are found outside of an itemscope, they will be assumed to be about the page
    class WebPage < Mida::Vocabulary
      itemtype %r{http://schema.org/WebPage}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # A set of links that can help a user understand and navigate a website hierarchy.
      has_many 'breadcrumb'

      # Date on which the content on this web page was last reviewed for accuracy and/or completeness.
      has_many 'lastReviewed' do
        extract Mida::DataType::ISO8601Date
      end

      # Indicates if this web page element is the main subject of the page.
      has_many 'mainContentOfPage' do
        extract Mida::SchemaOrg::WebPageElement
        extract Mida::DataType::Text
      end

      # Indicates the main image on the page.
      has_many 'primaryImageOfPage' do
        extract Mida::SchemaOrg::ImageObject
        extract Mida::DataType::Text
      end

      # A link related to this web page, for example to other related web pages.
      has_many 'relatedLink' do
        extract Mida::DataType::URL
      end

      # People or organizations that have reviewed the content on this web page for accuracy and/or completeness.
      has_many 'reviewedBy' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # One of the more significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most. Supercedes significantLinks.
      has_many 'significantLink' do
        extract Mida::DataType::URL
      end

      # One of the domain specialities to which this web page's content applies.
      has_many 'specialty' do
        extract Mida::SchemaOrg::Specialty
      end
    end

  end
end
