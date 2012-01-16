require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :MediaObject, 'mida_vocabulary/vocabularies/schemaorg/mediaobject'

    # A music video file.
    class MusicVideoObject < Mida::Vocabulary
      itemtype %r{http://schema.org/MusicVideoObject}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::MediaObject
    end

  end
end
