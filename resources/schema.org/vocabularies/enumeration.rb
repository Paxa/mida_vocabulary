require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Lists or enumerations - for example, a list of cuisines or music genres, etc.
    class Enumeration < Mida::Vocabulary
      itemtype %r{http://schema.org/Enumeration}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
