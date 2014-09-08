require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MusicPlaylist, 'mida_vocabulary/vocabularies/schemaorg/musicplaylist'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MusicGroup, 'mida_vocabulary/vocabularies/schemaorg/musicgroup'

    # A collection of music tracks.
    class MusicAlbum < Mida::Vocabulary
      itemtype %r{http://schema.org/MusicAlbum}i
      include_vocabulary Mida::SchemaOrg::MusicPlaylist
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The artist that performed this album or recording.
      has_many 'byArtist' do
        extract Mida::SchemaOrg::MusicGroup
        extract Mida::DataType::Text
      end
    end

  end
end
