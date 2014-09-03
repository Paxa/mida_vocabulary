require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Clip, 'mida_vocabulary/vocabularies/schemaorg/clip'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A short TV program or a segment/part of a TV program.
    class TVClip < Mida::Vocabulary
      itemtype %r{http://schema.org/TVClip}i
      include_vocabulary Mida::SchemaOrg::Clip
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
