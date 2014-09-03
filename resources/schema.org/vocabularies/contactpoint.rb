require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A contact point - for example, a Customer Complaints department.
    class ContactPoint < Mida::Vocabulary
      itemtype %r{http://schema.org/ContactPoint}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
