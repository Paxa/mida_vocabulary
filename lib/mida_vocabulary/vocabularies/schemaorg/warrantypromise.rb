require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A structured value representing the duration and scope of services that will be provided to a customer free of charge in case of a defect or malfunction of a product.
    class WarrantyPromise < Mida::Vocabulary
      itemtype %r{http://schema.org/WarrantyPromise}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
