require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :WebPage, 'mida_vocabulary/vocabularies/schemaorg/webpage'

    # Web page type: Search results page.
    class SearchResultsPage < Mida::Vocabulary
      itemtype %r{http://schema.org/SearchResultsPage}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::WebPage
    end

  end
end
