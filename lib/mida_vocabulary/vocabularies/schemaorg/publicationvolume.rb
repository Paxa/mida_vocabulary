require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A part of a successively published publication such as a periodical or multi-volume work, often numbered. It may represent a time span, such as a year.
    class PublicationVolume < Mida::Vocabulary
      itemtype %r{http://schema.org/PublicationVolume}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
