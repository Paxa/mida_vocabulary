require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A class, also often called a 'Type'; equivalent to rdfs:Class.
    class Class < Mida::Vocabulary
      itemtype %r{http://schema.org/Class}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
