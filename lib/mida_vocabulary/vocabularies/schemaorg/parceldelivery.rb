require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The delivery of a parcel either via the postal service or a commercial service.
    class ParcelDelivery < Mida::Vocabulary
      itemtype %r{http://schema.org/ParcelDelivery}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
