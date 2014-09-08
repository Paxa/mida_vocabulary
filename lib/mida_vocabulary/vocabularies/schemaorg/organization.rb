require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :PostalAddress, 'mida_vocabulary/vocabularies/schemaorg/postaladdress'
    autoload :AggregateRating, 'mida_vocabulary/vocabularies/schemaorg/aggregaterating'
    autoload :Brand, 'mida_vocabulary/vocabularies/schemaorg/brand'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :ContactPoint, 'mida_vocabulary/vocabularies/schemaorg/contactpoint'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :ImageObject, 'mida_vocabulary/vocabularies/schemaorg/imageobject'
    autoload :Offer, 'mida_vocabulary/vocabularies/schemaorg/offer'
    autoload :ProgramMembership, 'mida_vocabulary/vocabularies/schemaorg/programmembership'
    autoload :OwnershipInfo, 'mida_vocabulary/vocabularies/schemaorg/ownershipinfo'
    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Review, 'mida_vocabulary/vocabularies/schemaorg/review'
    autoload :Demand, 'mida_vocabulary/vocabularies/schemaorg/demand'

    # An organization such as a school, NGO, corporation, club, etc.
    class Organization < Mida::Vocabulary
      itemtype %r{http://schema.org/Organization}i
      include_vocabulary Mida::SchemaOrg::Thing

      # Physical address of the item.
      has_many 'address' do
        extract Mida::SchemaOrg::PostalAddress
        extract Mida::DataType::Text
      end

      # The overall rating, based on a collection of reviews or ratings, of the item.
      has_many 'aggregateRating' do
        extract Mida::SchemaOrg::AggregateRating
        extract Mida::DataType::Text
      end

      # The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
      has_many 'brand' do
        extract Mida::SchemaOrg::Brand
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # A contact point for a person or organization. Supercedes contactPoints.
      has_many 'contactPoint' do
        extract Mida::SchemaOrg::ContactPoint
        extract Mida::DataType::Text
      end

      # A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.
      has_many 'department' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # The date that this organization was dissolved.
      has_many 'dissolutionDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The Dun & Bradstreet DUNS number for identifying an organization or business person.
      has_many 'duns'

      # Email address.
      has_many 'email'

      # Someone working for this organization. Supercedes employees.
      has_many 'employee' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # Upcoming or past event associated with this place or organization. Supercedes events.
      has_many 'event' do
        extract Mida::SchemaOrg::Event
        extract Mida::DataType::Text
      end

      # The fax number.
      has_many 'faxNumber'

      # A person who founded this organization. Supercedes founders.
      has_many 'founder' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The date that this organization was founded.
      has_many 'foundingDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
      has_many 'globalLocationNumber'

      # Points-of-Sales operated by the organization or person.
      has_many 'hasPOS' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # A count of a specific user interactions with this item - for example, 20 UserLikes, 5 UserComments, or 300 UserDownloads. The user interaction type should be one of the sub types of UserInteraction.
      has_many 'interactionCount'

      # The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
      has_many 'isicV4'

      # The official name of the organization, e.g. the registered company name.
      has_many 'legalName'

      # The location of the event, organization or action.
      has_many 'location' do
        extract Mida::SchemaOrg::Place
        extract Mida::SchemaOrg::PostalAddress
        extract Mida::DataType::Text
      end

      # A logo associated with an organization.
      has_many 'logo' do
        extract Mida::DataType::URL
        extract Mida::SchemaOrg::ImageObject
        extract Mida::DataType::Text
      end

      # A pointer to products or services offered by the organization or person.
      has_many 'makesOffer' do
        extract Mida::SchemaOrg::Offer
        extract Mida::DataType::Text
      end

      # A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals. Supercedes members, musicGroupMember. Inverse property: memberOf.
      has_many 'member' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # An Organization (or ProgramMembership) to which this Person or Organization belongs. Inverse property: member.
      has_many 'memberOf' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::ProgramMembership
        extract Mida::DataType::Text
      end

      # The North American Industry Classification System (NAICS) code for a particular organization or business person.
      has_many 'naics'

      # Products owned by the organization or person.
      has_many 'owns' do
        extract Mida::SchemaOrg::OwnershipInfo
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # A review of the item. Supercedes reviews.
      has_many 'review' do
        extract Mida::SchemaOrg::Review
        extract Mida::DataType::Text
      end

      # A pointer to products or services sought by the organization or person (demand).
      has_many 'seeks' do
        extract Mida::SchemaOrg::Demand
        extract Mida::DataType::Text
      end

      # A relationship between two organizations where the first includes the second, e.g., as a subsidiary. See also: the more specific 'department' property.
      has_many 'subOrganization' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
      has_many 'taxID'

      # The telephone number.
      has_many 'telephone'

      # The Value-added Tax ID of the organization or person.
      has_many 'vatID'
    end

  end
end
