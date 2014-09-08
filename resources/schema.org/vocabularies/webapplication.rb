require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :SoftwareApplication, 'mida_vocabulary/vocabularies/schemaorg/softwareapplication'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Web applications.
    class WebApplication < Mida::Vocabulary
      itemtype %r{http://schema.org/WebApplication}i
      include_vocabulary Mida::SchemaOrg::SoftwareApplication
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # Specifies browser requirements in human-readable text. For example,"requires HTML5 support".
      has_many 'browserRequirements'
    end

  end
end
