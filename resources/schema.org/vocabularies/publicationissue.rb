require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A part of a successively published publication such as a periodical or publication volume, often numbered, usually containing a grouping of works such as articles.
    class PublicationIssue < Mida::Vocabulary
      itemtype %r{http://schema.org/PublicationIssue}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
