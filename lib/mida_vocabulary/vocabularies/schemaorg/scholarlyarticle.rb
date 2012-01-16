require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Article, 'mida_vocabulary/vocabularies/schemaorg/article'

    # A scholarly article.
    class ScholarlyArticle < Mida::Vocabulary
      itemtype %r{http://schema.org/ScholarlyArticle}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Article
    end

  end
end
