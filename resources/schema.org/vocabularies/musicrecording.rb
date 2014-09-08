require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MusicGroup, 'mida_vocabulary/vocabularies/schemaorg/musicgroup'
    autoload :Duration, 'mida_vocabulary/vocabularies/schemaorg/duration'
    autoload :MusicAlbum, 'mida_vocabulary/vocabularies/schemaorg/musicalbum'
    autoload :MusicPlaylist, 'mida_vocabulary/vocabularies/schemaorg/musicplaylist'

    # A music recording (track), usually a single song.
    class MusicRecording < Mida::Vocabulary
      itemtype %r{http://schema.org/MusicRecording}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The artist that performed this album or recording.
      has_many 'byArtist' do
        extract Mida::SchemaOrg::MusicGroup
        extract Mida::DataType::Text
      end

      # The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
      has_many 'duration' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # The album to which this recording belongs.
      has_many 'inAlbum' do
        extract Mida::SchemaOrg::MusicAlbum
        extract Mida::DataType::Text
      end

      # The playlist to which this recording belongs.
      has_many 'inPlaylist' do
        extract Mida::SchemaOrg::MusicPlaylist
        extract Mida::DataType::Text
      end
    end

  end
end
