require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :CreativeWork, 'mida_vocabulary/vocabularies/schemaorg/creativework'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :ImageObject, 'mida_vocabulary/vocabularies/schemaorg/imageobject'

    # A software application.
    class SoftwareApplication < Mida::Vocabulary
      itemtype %r{http://schema.org/SoftwareApplication}i
      include_vocabulary Mida::SchemaOrg::CreativeWork
      include_vocabulary Mida::SchemaOrg::Thing

      # Type of software application, e.g. "Game, Multimedia".
      has_many 'applicationCategory' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end

      # Subcategory of the application, e.g. "Arcade Game".
      has_many 'applicationSubCategory' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end

      # The name of the application suite to which the application belongs (e.g. Excel belongs to Office)
      has_many 'applicationSuite'

      # Countries for which the application is not supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
      has_many 'countriesNotSupported'

      # Countries for which the application is supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.
      has_many 'countriesSupported'

      # Device required to run the application. Used in cases where a specific make/model is required to run the application.
      has_many 'device'

      # If the file can be downloaded, URL to download the binary.
      has_many 'downloadUrl' do
        extract Mida::DataType::URL
      end

      # Features or modules provided by this application (and possibly required by other applications).
      has_many 'featureList' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end

      # MIME format of the binary (e.g. application/zip).
      has_many 'fileFormat'

      # Size of the application / package (e.g. 18MB). In the absence of a unit (MB, KB etc.), KB will be assumed.
      has_many 'fileSize' do
        extract Mida::DataType::Integer
      end

      # URL at which the app may be installed, if different from the URL of the item.
      has_many 'installUrl' do
        extract Mida::DataType::URL
      end

      # Minimum memory requirements.
      has_many 'memoryRequirements' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end

      # Operating systems supported (Windows 7, OSX 10.6, Android 1.6).
      has_many 'operatingSystem'

      # Permission(s) required to run the app (for example, a mobile app may require full internet access or may run only on wifi).
      has_many 'permissions'

      # Processor architecture required to run the application (e.g. IA64).
      has_many 'processorRequirements'

      # Description of what changed in this version.
      has_many 'releaseNotes' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end

      # Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (Examples: DirectX, Java or .NET runtime).
      has_many 'requirements' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end

      # A link to a screenshot image of the app.
      has_many 'screenshot' do
        extract Mida::DataType::URL
        extract Mida::SchemaOrg::ImageObject
        extract Mida::DataType::Text
      end

      # Version of the software instance.
      has_many 'softwareVersion'

      # Storage requirements (free space required).
      has_many 'storageRequirements' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end
    end

  end
end
