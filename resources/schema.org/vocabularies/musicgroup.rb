require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :MusicAlbum, 'mida_vocabulary/vocabularies/schemaorg/musicalbum'
    autoload :MusicRecording, 'mida_vocabulary/vocabularies/schemaorg/musicrecording'

    # A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.
    class MusicGroup < Mida::Vocabulary
      itemtype %r{http://schema.org/MusicGroup}i
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing

      # A music album. Supercedes albums.
      has_many 'album' do
        extract Mida::SchemaOrg::MusicAlbum
        extract Mida::DataType::Text
      end

      # A music recording (track) - usually a single song. Supercedes tracks.
      has_many 'track' do
        extract Mida::SchemaOrg::MusicRecording
        extract Mida::DataType::Text
      end
    end

  end
end
