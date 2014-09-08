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

      # Library file name e.g., mscorlib.dll, system.web.dll
      has_many 'assembly'

      # Associated product/technology version. e.g., .NET Framework 4.5
      has_many 'assemblyVersion'

      # Indicates whether API is managed or unmanaged.
      has_many 'programmingModel'

      # Type of app development: phone, Metro style, desktop, XBox, etc.
      has_many 'targetPlatform'
    end

  end
end
