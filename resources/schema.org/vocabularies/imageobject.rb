require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MediaObject, 'mida_vocabulary/vocabularies/schemaorg/mediaobject'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An image file.
    class ImageObject < Mida::Vocabulary
      itemtype %r{http://schema.org/ImageObject}i
      include_vocabulary Mida::SchemaOrg::MediaObject
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
