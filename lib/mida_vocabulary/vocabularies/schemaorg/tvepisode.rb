require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Episode, 'mida_vocabulary/vocabularies/schemaorg/episode'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A TV episode which can be part of a series or season.
    class TVEpisode < Mida::Vocabulary
      itemtype %r{http://schema.org/TVEpisode}i
      include_vocabulary Mida::SchemaOrg::Episode
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
