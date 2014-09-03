require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An answer offered to a question; perhaps correct, perhaps opinionated or wrong.
    class Answer < Mida::Vocabulary
      itemtype %r{http://schema.org/Answer}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
