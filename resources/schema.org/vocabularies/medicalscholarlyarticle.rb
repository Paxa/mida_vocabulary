require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Article, 'mida_vocabulary/vocabularies/schemaorg/article'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A scholarly article in the medical domain.
    class MedicalScholarlyArticle < Mida::Vocabulary
      itemtype %r{http://schema.org/MedicalScholarlyArticle}i
      include_vocabulary Mida::SchemaOrg::Article
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The type of the medical article, taken from the US NLM MeSH publication type catalog.
      has_many 'publicationType'
    end

  end
end
