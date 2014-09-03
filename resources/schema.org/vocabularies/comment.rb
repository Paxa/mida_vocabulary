require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A comment on an item - for example, a comment on a blog post. The comment's content is expressed via the "text" property, and its topic via "about", properties shared with all CreativeWorks.
    class Comment < Mida::Vocabulary
      itemtype %r{http://schema.org/Comment}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
