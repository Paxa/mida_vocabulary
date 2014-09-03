require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.
    class MusicGroup < Mida::Vocabulary
      itemtype %r{http://schema.org/MusicGroup}i
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
