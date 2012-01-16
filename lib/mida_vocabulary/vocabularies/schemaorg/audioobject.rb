require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :MediaObject, 'mida_vocabulary/vocabularies/schemaorg/mediaobject'

    # An audio file.
    class AudioObject < Mida::Vocabulary
      itemtype %r{http://schema.org/AudioObject}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::MediaObject

      # If this MediaObject is an AudioObject or VideoObject, the transcript of that object.
      has_many 'transcript'
    end

  end
end
