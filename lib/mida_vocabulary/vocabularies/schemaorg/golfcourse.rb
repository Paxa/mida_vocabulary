require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :LocalBusiness, 'mida_vocabulary/vocabularies/schemaorg/localbusiness'

    # A golf course.
    class GolfCourse < Mida::Vocabulary
      itemtype %r{http://schema.org/GolfCourse}i
      include_vocabulary Mida::SchemaOrg::Thing
      include_vocabulary Mida::SchemaOrg::Place
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::LocalBusiness
    end

  end
end
