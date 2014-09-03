require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # A particular physical business or branch of an organization. Examples of LocalBusiness include a restaurant, a particular branch of a restaurant chain, a branch of a bank, a medical practice, a club, a bowling alley, etc.
    class LocalBusiness < Mida::Vocabulary
      itemtype %r{http://schema.org/LocalBusiness}i
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Place
    end

  end
end
