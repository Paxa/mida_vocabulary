require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.
    class Product < Mida::Vocabulary
      itemtype %r{http://schema.org/Product}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
