require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :AggregateRating, 'mida_vocabulary/vocabularies/schemaorg/aggregaterating'
    autoload :MediaObject, 'mida_vocabulary/vocabularies/schemaorg/mediaobject'
    autoload :Audience, 'mida_vocabulary/vocabularies/schemaorg/audience'
    autoload :AudioObject, 'mida_vocabulary/vocabularies/schemaorg/audioobject'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Comment, 'mida_vocabulary/vocabularies/schemaorg/comment'
    autoload :UserComments, 'mida_vocabulary/vocabularies/schemaorg/usercomments'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :AlignmentObject, 'mida_vocabulary/vocabularies/schemaorg/alignmentobject'
    autoload :Offer, 'mida_vocabulary/vocabularies/schemaorg/offer'
    autoload :Review, 'mida_vocabulary/vocabularies/schemaorg/review'
    autoload :Duration, 'mida_vocabulary/vocabularies/schemaorg/duration'
    autoload :VideoObject, 'mida_vocabulary/vocabularies/schemaorg/videoobject'

    # The most generic kind of creative work, including books, movies, photographs, software programs, etc.
    class CreativeWork < Mida::Vocabulary
      itemtype %r{http://schema.org/CreativeWork}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The subject matter of the content.
      has_many 'about' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # Indicates that the resource is compatible with the referenced accessibility API (WebSchemas wiki lists possible values).
         
      has_many 'accessibilityAPI'

      # Identifies input methods that are sufficient to fully control the described resource (WebSchemas wiki lists possible values).
      has_many 'accessibilityControl'

      # Content features of the resource, such as accessible media, alternatives and supported enhancements for accessibility (WebSchemas wiki lists possible values).
      has_many 'accessibilityFeature'

      # A characteristic of the described resource that is physiologically dangerous to some users. Related to WCAG 2.0 guideline 2.3. (WebSchemas wiki lists possible values)
      has_many 'accessibilityHazard'

      # Specifies the Person that is legally accountable for the CreativeWork.
      has_many 'accountablePerson' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The overall rating, based on a collection of reviews or ratings, of the item.
      has_many 'aggregateRating' do
        extract Mida::SchemaOrg::AggregateRating
        extract Mida::DataType::Text
      end

      # A secondary title of the CreativeWork.
      has_many 'alternativeHeadline'

      # A media object that encodes this CreativeWork. This property is a synonym for encoding.
      has_many 'associatedMedia' do
        extract Mida::SchemaOrg::MediaObject
        extract Mida::DataType::Text
      end

      # The intended audience of the item, i.e. the group for whom the item was created.
      has_many 'audience' do
        extract Mida::SchemaOrg::Audience
        extract Mida::DataType::Text
      end

      # An embedded audio object.
      has_many 'audio' do
        extract Mida::SchemaOrg::AudioObject
        extract Mida::DataType::Text
      end

      # The author of this content. Please note that author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.
      has_many 'author' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # An award won by this person or for this creative work. Supercedes awards.
      has_many 'award'

      # A citation or reference to another creative work, such as another publication, web page, scholarly article, etc.
      has_many 'citation' do
        extract Mida::SchemaOrg::CreativeWork
        extract Mida::DataType::Text
      end

      # Comments, typically from users, on this CreativeWork.
      has_many 'comment' do
        extract Mida::SchemaOrg::Comment
        extract Mida::SchemaOrg::UserComments
        extract Mida::DataType::Text
      end

      # The number of comments this CreativeWork (e.g. Article, Question or Answer) has received. This is most applicable to works published in Web sites with commenting system; additional comments may exist elsewhere.
      has_many 'commentCount' do
        extract Mida::DataType::Integer
      end

      # The location of the content.
      has_many 'contentLocation' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # Official rating of a piece of content - for example,'MPAA PG-13'.
      has_many 'contentRating'

      # A secondary contributor to the CreativeWork.
      has_many 'contributor' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The party holding the legal copyright to the CreativeWork.
      has_many 'copyrightHolder' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The year during which the claimed copyright for the CreativeWork was first asserted.
      has_many 'copyrightYear' do
        extract Mida::DataType::Number
      end

      # The creator/author of this CreativeWork or UserComments. This is the same as the Author property for CreativeWork.
      has_many 'creator' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The date on which the CreativeWork was created.
      has_many 'dateCreated' do
        extract Mida::DataType::ISO8601Date
      end

      # The date on which the CreativeWork was most recently modified.
      has_many 'dateModified' do
        extract Mida::DataType::ISO8601Date
      end

      # Date of first broadcast/publication.
      has_many 'datePublished' do
        extract Mida::DataType::ISO8601Date
      end

      # A link to the page containing the comments of the CreativeWork.
      has_many 'discussionUrl' do
        extract Mida::DataType::URL
      end

      # Specifies the Person who edited the CreativeWork.
      has_many 'editor' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # An alignment to an established educational framework.
      has_many 'educationalAlignment' do
        extract Mida::SchemaOrg::AlignmentObject
        extract Mida::DataType::Text
      end

      # The purpose of a work in the context of education; for example, 'assignment', 'group work'.
      has_many 'educationalUse'

      # A media object that encodes this CreativeWork. This property is a synonym for associatedMedia. Supercedes encodings.
      has_many 'encoding' do
        extract Mida::SchemaOrg::MediaObject
        extract Mida::DataType::Text
      end

      # A creative work that this work is an example/instance/realization/derivation of. Inverse property: workExample.
      has_many 'exampleOfWork' do
        extract Mida::SchemaOrg::CreativeWork
        extract Mida::DataType::Text
      end

      # Genre of the creative work
      has_many 'genre'

      # Indicates a CreativeWork that is (in some sense) a part of this CreativeWork. Inverse property: isPartOf.
      has_many 'hasPart' do
        extract Mida::SchemaOrg::CreativeWork
        extract Mida::DataType::Text
      end

      # Headline of the article
      has_many 'headline'

      # The language of the content. please use one of the language codes from the IETF BCP 47 standard.
      has_many 'inLanguage'

      # A count of a specific user interactions with this item - for example, 20 UserLikes, 5 UserComments, or 300 UserDownloads. The user interaction type should be one of the sub types of UserInteraction.
      has_many 'interactionCount'

      # The predominant mode of learning supported by the learning resource. Acceptable values are 'active', 'expositive', or 'mixed'.
      has_many 'interactivityType'

      # A resource that was used in the creation of this resource. This term can be repeated for multiple sources. For example, http://example.com/great-multiplication-intro.html
      has_many 'isBasedOnUrl' do
        extract Mida::DataType::URL
      end

      # Indicates whether this content is family friendly.
      has_many 'isFamilyFriendly' do
        extract Mida::DataType::Boolean
      end

      # Indicates a CreativeWork that this CreativeWork is (in some sense) part of. Inverse property: hasPart.
      has_many 'isPartOf' do
        extract Mida::SchemaOrg::CreativeWork
        extract Mida::DataType::Text
      end

      # Keywords or tags used to describe this content. Multiple entries in a keywords list are typically delimited by commas.
      has_many 'keywords'

      # The predominant type or kind characterizing the learning resource. For example, 'presentation', 'handout'.
      has_many 'learningResourceType'

      # A license document that applies to this content, typically indicated by URL.
      has_many 'license' do
        extract Mida::DataType::URL
        extract Mida::SchemaOrg::CreativeWork
        extract Mida::DataType::Text
      end

      # Indicates that the CreativeWork contains a reference to, but is not necessarily about a concept.
      has_many 'mentions' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # An offer to provide this item - for example, an offer to sell a product, rent the DVD of a movie, or give away tickets to an event.
      has_many 'offers' do
        extract Mida::SchemaOrg::Offer
        extract Mida::DataType::Text
      end

      # The position of the creative work within a series or other ordered collection of works.
      has_many 'position' do
        extract Mida::DataType::Integer
        extract Mida::DataType::Text
      end

      # The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller. Supercedes carrier.
      has_many 'provider' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The publisher of the creative work.
      has_many 'publisher' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # Link to page describing the editorial principles of the organization primarily responsible for the creation of the CreativeWork.
      has_many 'publishingPrinciples' do
        extract Mida::DataType::URL
      end

      # A review of the item. Supercedes reviews.
      has_many 'review' do
        extract Mida::SchemaOrg::Review
        extract Mida::DataType::Text
      end

      # The Organization on whose behalf the creator was working.
      has_many 'sourceOrganization' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # The textual content of this CreativeWork.
      has_many 'text'

      # A thumbnail image relevant to the Thing.
      has_many 'thumbnailUrl' do
        extract Mida::DataType::URL
      end

      # Approximate or typical time it takes to work with or through this learning resource for the typical intended target audience, e.g. 'P30M', 'P1H25M'.
      has_many 'timeRequired' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # The typical expected age range, e.g. '7-9', '11-'.
      has_many 'typicalAgeRange'

      # The version of the CreativeWork embodied by a specified resource.
      has_many 'version' do
        extract Mida::DataType::Number
      end

      # An embedded video object.
      has_many 'video' do
        extract Mida::SchemaOrg::VideoObject
        extract Mida::DataType::Text
      end

      # Example/instance/realization/derivation of the concept of this creative work. eg. The paperback edition, first edition, or eBook. Inverse property: exampleOfWork.
      has_many 'workExample' do
        extract Mida::SchemaOrg::CreativeWork
        extract Mida::DataType::Text
      end
    end

  end
end
