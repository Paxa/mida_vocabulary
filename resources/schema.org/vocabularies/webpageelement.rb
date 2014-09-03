require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A web page element, like a table or an image
    class WebPageElement < Mida::Vocabulary
      itemtype %r{http://schema.org/WebPageElement}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
