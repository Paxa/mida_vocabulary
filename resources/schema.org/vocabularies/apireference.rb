require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :TechArticle, 'mida_vocabulary/vocabularies/schemaorg/techarticle'
    autoload :Article, 'mida_vocabulary/vocabularies/schemaorg/article'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Reference documentation for application programming interfaces (APIs).
    class APIReference < Mida::Vocabulary
      itemtype %r{http://schema.org/APIReference}i
      include_vocabulary Mida::SchemaOrg::TechArticle
      include_vocabulary Mida::SchemaOrg::Article
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
