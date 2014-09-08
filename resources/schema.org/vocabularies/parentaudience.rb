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

      # Maximal age of the child
      has_many 'childMaxAge' do
        extract Mida::DataType::Number
      end

      # Minimal age of the child
      has_many 'childMinAge' do
        extract Mida::DataType::Number
      end
    end

  end
end
