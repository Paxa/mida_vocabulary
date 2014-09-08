require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :MediaObject, 'mida_vocabulary/vocabularies/schemaorg/mediaobject'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :ImageObject, 'mida_vocabulary/vocabularies/schemaorg/imageobject'

    # An image file.
    class ImageObject < Mida::Vocabulary
      itemtype %r{http://schema.org/ImageObject}i
      include_vocabulary Mida::SchemaOrg::MediaObject
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The caption for this object.
      has_many 'caption'

      # exif data for this object.
      has_many 'exifData'

      # Indicates whether this image is representative of the content of the page.
      has_many 'representativeOfPage' do
        extract Mida::DataType::Boolean
      end

      # Thumbnail image for an image or video.
      has_many 'thumbnail' do
        extract Mida::SchemaOrg::ImageObject
        extract Mida::DataType::Text
      end
    end

  end
end
