require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A map.
    class Map < Mida::Vocabulary
      itemtype %r{http://schema.org/Map}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # Indicates the kind of Map, from the MapCategoryType Enumeration.
      has_many 'mapType' do
      end
    end

  end
end
