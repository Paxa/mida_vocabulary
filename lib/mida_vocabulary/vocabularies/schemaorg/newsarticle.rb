require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Article, 'mida_vocabulary/vocabularies/schemaorg/article'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A news article
    class NewsArticle < Mida::Vocabulary
      itemtype %r{http://schema.org/NewsArticle}i
      include_vocabulary Mida::SchemaOrg::Article
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
