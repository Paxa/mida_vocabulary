require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Series, 'mida_vocabulary/vocabularies/schemaorg/series'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Series dedicated to TV broadcast and associated online delivery.
    class TVSeries < Mida::Vocabulary
      itemtype %r{http://schema.org/TVSeries}i
      include_vocabulary Mida::SchemaOrg::Series
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
