require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :BookFormatType, 'mida_vocabulary/vocabularies/schemaorg/bookformattype'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # A book.
    class Book < Mida::Vocabulary
      itemtype %r{http://schema.org/Book}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # The edition of the book.
      has_many 'bookEdition'

      # The format of the book.
      has_many 'bookFormat' do
        extract Mida::SchemaOrg::BookFormatType
      end

      # The illustrator of the book.
      has_many 'illustrator' do
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The ISBN of the book.
      has_many 'isbn'

      # The number of pages in the book.
      has_many 'numberOfPages' do
        extract Mida::DataType::Integer
      end
    end

  end
end
