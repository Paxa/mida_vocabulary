require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'

    # The act of playing/exercising/training/performing for enjoyment, leisure, recreation, Competition or exercise.Related actions:ListenAction: Unlike ListenAction (which is under ConsumeAction), PlayAction refers to performing for an audience or at an event, rather than consuming music.WatchAction: Unlike WatchAction (which is under ConsumeAction), PlayAction refers to showing/displaying for an audience or at an event, rather than consuming visual content.
    class PlayAction < Mida::Vocabulary
      itemtype %r{http://schema.org/PlayAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # The intended audience of the item, i.e. the group for whom the item was created.
      has_many 'audience' do
        extract Mida::SchemaOrg::Audience
        extract Mida::DataType::Text
      end

      # Upcoming or past event associated with this place or organization. Supercedes events.
      has_many 'event' do
        extract Mida::SchemaOrg::Event
        extract Mida::DataType::Text
      end
    end

  end
end
