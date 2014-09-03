require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A person (alive, dead, undead, or fictional).
    class Person < Mida::Vocabulary
      itemtype %r{http://schema.org/Person}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
