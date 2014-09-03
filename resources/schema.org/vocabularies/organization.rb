require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An organization such as a school, NGO, corporation, club, etc.
    class Organization < Mida::Vocabulary
      itemtype %r{http://schema.org/Organization}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
