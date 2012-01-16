require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :BlogPosting, 'mida_vocabulary/vocabularies/schemaorg/blogposting'

    # A blog
    class Blog < Mida::Vocabulary
      itemtype %r{http://schema.org/Blog}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork

      # The postings that are part of this blog
      has_many 'blogPosts' do
        extract Mida::SchemaOrg::BlogPosting
        extract Mida::DataType::Text
      end
    end

  end
end
