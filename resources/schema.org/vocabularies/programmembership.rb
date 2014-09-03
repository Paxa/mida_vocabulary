require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Used to describe membership in a loyalty programs (e.g. "StarAliance"), traveler clubs (e.g. "AAA"), purchase clubs ("Safeway Club"), etc.
    class ProgramMembership < Mida::Vocabulary
      itemtype %r{http://schema.org/ProgramMembership}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
