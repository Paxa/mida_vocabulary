require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An EducationalAudience
    class EducationalAudience < Mida::Vocabulary
      itemtype %r{http://schema.org/EducationalAudience}i
      include_vocabulary Mida::SchemaOrg::Audience
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
