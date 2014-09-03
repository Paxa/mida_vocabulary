require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Season, 'mida_vocabulary/vocabularies/schemaorg/season'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Season dedicated to radio broadcast and associated online delivery.
    class RadioSeason < Mida::Vocabulary
      itemtype %r{http://schema.org/RadioSeason}i
      include_vocabulary Mida::SchemaOrg::Season
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
