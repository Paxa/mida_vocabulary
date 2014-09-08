require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :SoftwareApplication, 'mida_vocabulary/vocabularies/schemaorg/softwareapplication'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A software application designed specifically to work well on a mobile device such as a telephone.
    class MobileApplication < Mida::Vocabulary
      itemtype %r{http://schema.org/MobileApplication}i
      include_vocabulary Mida::SchemaOrg::SoftwareApplication
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # Specifies specific carrier(s) requirements for the application (e.g. an application may only work on a specific carrier network).
      has_many 'carrierRequirements'
    end

  end
end
