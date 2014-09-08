require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :PostalAddress, 'mida_vocabulary/vocabularies/schemaorg/postaladdress'

    # An action performed by a direct agent and indirect participants upon a direct object. Optionally happens at a location with the help of an inanimate instrument. The execution of the action may produce a result. Specific action sub-type documentation specifies the exact expectation of each argument/role.
    class Action < Mida::Vocabulary
      itemtype %r{http://schema.org/Action}i
      include_vocabulary Mida::SchemaOrg::Thing

      # Indicates the current disposition of the Action.
      has_many 'actionStatus' do
      end

      # The direct performer or driver of the action (animate or inanimate). e.g. *John* wrote a book.
      has_many 'agent' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The endTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to end. For actions that span a period of time, when the action was performed. e.g. John wrote a book from January to *December*.
      #Note that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.

      has_many 'endTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The object that helped the agent perform the action. e.g. John wrote a book with *a pen*.
      has_many 'instrument' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # The location of the event, organization or action.
      has_many 'location' do
        extract Mida::SchemaOrg::Place
        extract Mida::SchemaOrg::PostalAddress
        extract Mida::DataType::Text
      end

      # The object upon the action is carried out, whose state is kept intact or changed. Also known as the semantic roles patient, affected or undergoer (which change their state) or theme (which doesn't). e.g. John read *a book*.
      has_many 'object' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # Other co-agents that participated in the action indirectly. e.g. John wrote a book with *Steve*.
      has_many 'participant' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The result produced in the action. e.g. John wrote *a book*.
      has_many 'result' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # The startTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to start. For actions that span a period of time, when the action was performed. e.g. John wrote a book from *January* to December.
      # Note that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.

      has_many 'startTime' do
        extract Mida::DataType::ISO8601Date
      end

      # Indicates a target EntryPoint for an Action.
      has_many 'target' do
      end
    end

  end
end
