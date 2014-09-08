require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'

    # The UserInteraction event in which a user comments on an item.
    class UserComments < Mida::Vocabulary
      itemtype %r{http://schema.org/UserComments}i
      include_vocabulary Mida::SchemaOrg::Event
      include_vocabulary Mida::SchemaOrg::Thing

      # The text of the UserComment.
      has_many 'commentText'

      # The time at which the UserComment was made.
      has_many 'commentTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The creator/author of this CreativeWork or UserComments. This is the same as the Author property for CreativeWork.
      has_many 'creator' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # Specifies the CreativeWork associated with the UserComment.
      has_many 'discusses' do
        extract Mida::SchemaOrg::CreativeWork
        extract Mida::DataType::Text
      end

      # The URL at which a reply may be posted to the specified UserComment.
      has_many 'replyToUrl' do
        extract Mida::DataType::URL
      end
    end

  end
end
