require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A set of characteristics belonging to people, e.g. who compose an item's target audience.
    class PeopleAudience < Mida::Vocabulary
      itemtype %r{http://schema.org/PeopleAudience}i
      include_vocabulary Mida::SchemaOrg::Audience
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
