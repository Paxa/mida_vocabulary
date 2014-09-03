require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A listing that describes a job opening in a certain organization.
    class JobPosting < Mida::Vocabulary
      itemtype %r{http://schema.org/JobPosting}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
