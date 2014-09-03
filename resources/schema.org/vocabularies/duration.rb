require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Quantity: Duration (use ISO 8601 duration format).
    class Duration < Mida::Vocabulary
      itemtype %r{http://schema.org/Duration}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
