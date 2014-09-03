require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An event happening at a certain time and location, such as a concert, lecture, or festival. Ticketing information may be added via the 'offers' property. Repeated events may be structured as separate Event objects.
    class Event < Mida::Vocabulary
      itemtype %r{http://schema.org/Event}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
