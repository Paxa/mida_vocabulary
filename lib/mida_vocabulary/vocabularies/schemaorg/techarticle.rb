require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Article, 'mida_vocabulary/vocabularies/schemaorg/article'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A technical article - Example: How-to (task) topics, step-by-step, procedural troubleshooting, specifications, etc.
    class TechArticle < Mida::Vocabulary
      itemtype %r{http://schema.org/TechArticle}i
      include_vocabulary Mida::SchemaOrg::Article
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # Prerequisites needed to fulfill steps in article.
      has_many 'dependencies'

      # Proficiency needed for this content; expected values: 'Beginner', 'Expert'.
      has_many 'proficiencyLevel'
    end

  end
end
