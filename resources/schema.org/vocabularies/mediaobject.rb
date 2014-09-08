require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :NewsArticle, 'mida_vocabulary/vocabularies/schemaorg/newsarticle'
    autoload :Duration, 'mida_vocabulary/vocabularies/schemaorg/duration'
    autoload :Distance, 'mida_vocabulary/vocabularies/schemaorg/distance'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'
    autoload :Offer, 'mida_vocabulary/vocabularies/schemaorg/offer'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :PublicationEvent, 'mida_vocabulary/vocabularies/schemaorg/publicationevent'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # An image, video, or audio object embedded in a web page. Note that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 AudioObject's).
    class MediaObject < Mida::Vocabulary
      itemtype %r{http://schema.org/MediaObject}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # A NewsArticle associated with the Media Object.
      has_many 'associatedArticle' do
        extract Mida::SchemaOrg::NewsArticle
        extract Mida::DataType::Text
      end

      # The bitrate of the media object.
      has_many 'bitrate'

      # File size in (mega/kilo) bytes.
      has_many 'contentSize'

      # Actual bytes of the media object, for example the image file or video file. (previous spelling: contentURL)
      has_many 'contentUrl' do
        extract Mida::DataType::URL
      end

      # The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
      has_many 'duration' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # A URL pointing to a player for a specific video. In general, this is the information in the src element of an embed tag and should not be the same as the content of the loc tag. (previous spelling: embedURL)
      has_many 'embedUrl' do
        extract Mida::DataType::URL
      end

      # The CreativeWork encoded by this media object.
      has_many 'encodesCreativeWork' do
        extract Mida::SchemaOrg::CreativeWork
        extract Mida::DataType::Text
      end

      # mp3, mpeg4, etc.
      has_many 'encodingFormat'

      # Date the content expires and is no longer useful or available. Useful for videos.
      has_many 'expires' do
        extract Mida::DataType::ISO8601Date
      end

      # The height of the item.
      has_many 'height' do
        extract Mida::SchemaOrg::Distance
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # A count of a specific user interactions with this item - for example, 20 UserLikes, 5 UserComments, or 300 UserDownloads. The user interaction type should be one of the sub types of UserInteraction.
      has_many 'interactionCount'

      # An offer to provide this item - for example, an offer to sell a product, rent the DVD of a movie, or give away tickets to an event.
      has_many 'offers' do
        extract Mida::SchemaOrg::Offer
        extract Mida::DataType::Text
      end

      # Player type required - for example, Flash or Silverlight.
      has_many 'playerType'

      # The production company or studio that made the movie, tv/radio series, season, or episode, or media object.
      has_many 'productionCompany' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # A publication event associated with the episode, clip or media object.
      has_many 'publication' do
        extract Mida::SchemaOrg::PublicationEvent
        extract Mida::DataType::Text
      end

      # The regions where the media is allowed. If not specified, then it's assumed to be allowed everywhere. Specify the countries in ISO 3166 format.
      has_many 'regionsAllowed' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # Indicates if use of the media require a subscription  (either paid or free). Allowed values are true or false (note that an earlier version had 'yes', 'no').
      has_many 'requiresSubscription' do
        extract Mida::DataType::Boolean
      end

      # Date when this media object was uploaded to this site.
      has_many 'uploadDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The width of the item.
      has_many 'width' do
        extract Mida::SchemaOrg::Distance
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end
    end

  end
end
