require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The rating of the video.
    class Rating < Mida::Vocabulary
      itemtype %r{http://schema.org/Rating}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
