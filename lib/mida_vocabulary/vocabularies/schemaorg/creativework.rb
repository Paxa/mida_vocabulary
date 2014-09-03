require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The most generic kind of creative work, including books, movies, photographs, software programs, etc.
    class CreativeWork < Mida::Vocabulary
      itemtype %r{http://schema.org/CreativeWork}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
