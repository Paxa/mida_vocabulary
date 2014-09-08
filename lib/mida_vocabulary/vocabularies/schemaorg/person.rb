require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :PostalAddress, 'mida_vocabulary/vocabularies/schemaorg/postaladdress'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :EducationalOrganization, 'mida_vocabulary/vocabularies/schemaorg/educationalorganization'
    autoload :Brand, 'mida_vocabulary/vocabularies/schemaorg/brand'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :ContactPoint, 'mida_vocabulary/vocabularies/schemaorg/contactpoint'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :Offer, 'mida_vocabulary/vocabularies/schemaorg/offer'
    autoload :ProgramMembership, 'mida_vocabulary/vocabularies/schemaorg/programmembership'
    autoload :Country, 'mida_vocabulary/vocabularies/schemaorg/country'
    autoload :OwnershipInfo, 'mida_vocabulary/vocabularies/schemaorg/ownershipinfo'
    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :Demand, 'mida_vocabulary/vocabularies/schemaorg/demand'

    # A person (alive, dead, undead, or fictional).
    class Person < Mida::Vocabulary
      itemtype %r{http://schema.org/Person}i
      include_vocabulary Mida::SchemaOrg::Thing

      # An additional name for a Person, can be used for a middle name.
      has_many 'additionalName'

      # Physical address of the item.
      has_many 'address' do
        extract Mida::SchemaOrg::PostalAddress
        extract Mida::DataType::Text
      end

      # An organization that this person is affiliated with. For example, a school/university, a club, or a team.
      has_many 'affiliation' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # An educational organizations that the person is an alumni of. Inverse property: alumni.
      has_many 'alumniOf' do
        extract Mida::SchemaOrg::EducationalOrganization
        extract Mida::DataType::Text
      end

      # An award won by this person or for this creative work. Supercedes awards.
      has_many 'award'

      # Date of birth.
      has_many 'birthDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.
      has_many 'brand' do
        extract Mida::SchemaOrg::Brand
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # A child of the person.
      has_many 'children' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # A colleague of the person. Supercedes colleagues.
      has_many 'colleague' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # A contact point for a person or organization. Supercedes contactPoints.
      has_many 'contactPoint' do
        extract Mida::SchemaOrg::ContactPoint
        extract Mida::DataType::Text
      end

      # Date of death.
      has_many 'deathDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The Dun & Bradstreet DUNS number for identifying an organization or business person.
      has_many 'duns'

      # Email address.
      has_many 'email'

      # Family name. In the U.S., the last name of an Person. This can be used along with givenName instead of the Name property.
      has_many 'familyName'

      # The fax number.
      has_many 'faxNumber'

      # The most generic uni-directional social relation.
      has_many 'follows' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # Gender of the person.
      has_many 'gender'

      # Given name. In the U.S., the first name of a Person. This can be used along with familyName instead of the Name property.
      has_many 'givenName'

      # The Global Location Number (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.
      has_many 'globalLocationNumber'

      # Points-of-Sales operated by the organization or person.
      has_many 'hasPOS' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # A contact location for a person's residence.
      has_many 'homeLocation' do
        extract Mida::SchemaOrg::ContactPoint
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # An honorific prefix preceding a Person's name such as Dr/Mrs/Mr.
      has_many 'honorificPrefix'

      # An honorific suffix preceding a Person's name such as M.D. /PhD/MSCSW.
      has_many 'honorificSuffix'

      # A count of a specific user interactions with this item - for example, 20 UserLikes, 5 UserComments, or 300 UserDownloads. The user interaction type should be one of the sub types of UserInteraction.
      has_many 'interactionCount'

      # The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.
      has_many 'isicV4'

      # The job title of the person (for example, Financial Manager).
      has_many 'jobTitle'

      # The most generic bi-directional social/work relation.
      has_many 'knows' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # A pointer to products or services offered by the organization or person.
      has_many 'makesOffer' do
        extract Mida::SchemaOrg::Offer
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

      # Nationality of the person.
      has_many 'nationality' do
        extract Mida::SchemaOrg::Country
        extract Mida::DataType::Text
      end

      # Products owned by the organization or person.
      has_many 'owns' do
        extract Mida::SchemaOrg::OwnershipInfo
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # A parent of this person. Supercedes parents.
      has_many 'parent' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # Event that this person is a performer or participant in.
      has_many 'performerIn' do
        extract Mida::SchemaOrg::Event
        extract Mida::DataType::Text
      end

      # The most generic familial relation.
      has_many 'relatedTo' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # A pointer to products or services sought by the organization or person (demand).
      has_many 'seeks' do
        extract Mida::SchemaOrg::Demand
        extract Mida::DataType::Text
      end

      # A sibling of the person. Supercedes siblings.
      has_many 'sibling' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The person's spouse.
      has_many 'spouse' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.
      has_many 'taxID'

      # The telephone number.
      has_many 'telephone'

      # The Value-added Tax ID of the organization or person.
      has_many 'vatID'

      # A contact location for a person's place of work.
      has_many 'workLocation' do
        extract Mida::SchemaOrg::ContactPoint
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # Organizations that the person works for.
      has_many 'worksFor' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end
    end

  end
end
