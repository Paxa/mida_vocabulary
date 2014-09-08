require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :Duration, 'mida_vocabulary/vocabularies/schemaorg/duration'
    autoload :EventStatusType, 'mida_vocabulary/vocabularies/schemaorg/eventstatustype'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :PostalAddress, 'mida_vocabulary/vocabularies/schemaorg/postaladdress'
    autoload :Offer, 'mida_vocabulary/vocabularies/schemaorg/offer'
    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'

    # An event happening at a certain time and location, such as a concert, lecture, or festival. Ticketing information may be added via the 'offers' property. Repeated events may be structured as separate Event objects.
    class Event < Mida::Vocabulary
      itemtype %r{http://schema.org/Event}i
      include_vocabulary Mida::SchemaOrg::Thing

      # A person or organization attending the event.
      has_many 'attendee' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The time admission will commence.
      has_many 'doorTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format.
      has_many 'duration' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # The end date and time of the role, event or item (in ISO 8601 date format).
      has_many 'endDate' do
        extract Mida::DataType::ISO8601Date
      end

      # An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.
      has_many 'eventStatus' do
        extract Mida::SchemaOrg::EventStatusType
      end

      # The location of the event, organization or action.
      has_many 'location' do
        extract Mida::SchemaOrg::Place
        extract Mida::SchemaOrg::PostalAddress
        extract Mida::DataType::Text
      end

      # An offer to provide this item - for example, an offer to sell a product, rent the DVD of a movie, or give away tickets to an event.
      has_many 'offers' do
        extract Mida::SchemaOrg::Offer
        extract Mida::DataType::Text
      end

      # An organizer of an Event.
      has_many 'organizer' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # A performer at the event - for example, a presenter, musician, musical group or actor. Supercedes performers.
      has_many 'performer' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # Used in conjunction with eventStatus for rescheduled or cancelled events. This property contains the previously scheduled start date. For rescheduled events, the startDate property should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and rescheduled multiple times, this field may be repeated.
      has_many 'previousStartDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The start date and time of the event, role or item (in ISO 8601 date format).
      has_many 'startDate' do
        extract Mida::DataType::ISO8601Date
      end

      # An Event that is part of this event. For example, a conference event includes many presentations, each of which is a subEvent of the conference. Supercedes subEvents.
      has_many 'subEvent' do
        extract Mida::SchemaOrg::Event
        extract Mida::DataType::Text
      end

      # An event that this event is a part of. For example, a collection of individual music performances might each have a music festival as their superEvent.
      has_many 'superEvent' do
        extract Mida::SchemaOrg::Event
        extract Mida::DataType::Text
      end

      # The typical expected age range, e.g. '7-9', '11-'.
      has_many 'typicalAgeRange'

      # A work performed in some event, for example a play performed in a TheaterEvent.
      has_many 'workPerformed' do
        extract Mida::SchemaOrg::CreativeWork
        extract Mida::DataType::Text
      end
    end

  end
end
