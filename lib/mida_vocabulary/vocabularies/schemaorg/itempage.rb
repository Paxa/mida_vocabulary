require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :WebPage, 'mida_vocabulary/vocabularies/schemaorg/webpage'

    # A page devoted to a single item, such as a particular product or hotel.
    class ItemPage < Mida::Vocabulary
      itemtype %r{http://schema.org/ItemPage}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::WebPage
    end

  end
end
