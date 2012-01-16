require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :MusicPlaylist, 'mida_vocabulary/vocabularies/schemaorg/musicplaylist'
    autoload :MusicGroup, 'mida_vocabulary/vocabularies/schemaorg/musicgroup'

    # A collection of music tracks.
    class MusicAlbum < Mida::Vocabulary
      itemtype %r{http://schema.org/MusicAlbum}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::MusicPlaylist

      # The artist that performed this album or recording.
      has_many 'byArtist' do
        extract Mida::SchemaOrg::MusicGroup
        extract Mida::DataType::Text
      end
    end

  end
end
