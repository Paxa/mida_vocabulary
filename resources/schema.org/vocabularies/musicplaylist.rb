require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MusicRecording, 'mida_vocabulary/vocabularies/schemaorg/musicrecording'

    # A collection of music tracks in playlist form.
    class MusicPlaylist < Mida::Vocabulary
      itemtype %r{http://schema.org/MusicPlaylist}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The number of tracks in this album or playlist.
      has_many 'numTracks' do
        extract Mida::DataType::Integer
      end

      # A music recording (track) - usually a single song. Supercedes tracks.
      has_many 'track' do
        extract Mida::SchemaOrg::MusicRecording
        extract Mida::DataType::Text
      end
    end

  end
end
