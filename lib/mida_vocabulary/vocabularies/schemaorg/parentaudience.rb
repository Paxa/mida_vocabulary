require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PeopleAudience, 'mida_vocabulary/vocabularies/schemaorg/peopleaudience'
    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A set of characteristics describing parents, who can be interested in viewing some content
    class ParentAudience < Mida::Vocabulary
      itemtype %r{http://schema.org/ParentAudience}i
      include_vocabulary Mida::SchemaOrg::PeopleAudience
      include_vocabulary Mida::SchemaOrg::Audience
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
