require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MusicPlaylist, 'mida_vocabulary/vocabularies/schemaorg/musicplaylist'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A collection of music tracks.
    class MusicAlbum < Mida::Vocabulary
      itemtype %r{http://schema.org/MusicAlbum}i
      include_vocabulary Mida::SchemaOrg::MusicPlaylist
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
