$LOAD_PATH.unshift File.dirname(__FILE__)

# Mida is a Microdata parser and extractor.
module Mida
  module SchemaOrg
  end
  module DataVocabulary
  end
end

require 'mida_vocabulary/vocabulary'

[
  'Product', 'OfferAggregate', 'Address', 'Breadcrumb', 'Event', 'Geo', 'Item', 'Offer', 'Organization',
  'Person', 'Product', 'Recipe', 'Review'
].each {|class_name|
  Mida::DataVocabulary.const_set(class_name.to_sym, Class.new(Mida::Vocabulary))
}

[
  "APIReference", "AboutPage", "AcceptAction", "AccountingService", "AchieveAction", "Action",
  "AddAction", "AdministrativeArea", "AdultEntertainment", "AggregateOffer", "AggregateRating",
  "AgreeAction", "Airline", "Airport", "AlignmentObject", "AllocateAction", "AmusementPark",
  "AnatomicalStructure", "AnatomicalSystem", "AnimalShelter", "Answer", "ApartmentComplex",
  "AppendAction", "ApplyAction", "ApprovedIndication", "Aquarium", "ArriveAction", "ArtGallery",
  "Artery", "Article", "AskAction", "AssessAction", "AssignAction", "Attorney", "Audience",
  "AudioObject", "AuthorizeAction", "AutoBodyShop", "AutoDealer", "AutoPartsStore", "AutoRental",
  "AutoRepair", "AutoWash", "AutomatedTeller", "AutomotiveBusiness", "Bakery", "BankOrCreditUnion",
  "BarOrPub", "Beach", "BeautySalon", "BedAndBreakfast", "BefriendAction", "BikeStore", "BlogPosting",
  "BloodTest", "BodyOfWater", "Bone", "Book", "BookFormatType", "BookStore", "BookmarkAction", "BorrowAction",
  "BowlingAlley", "BrainStructure", "Brand", "Brewery", "BroadcastEvent", "BroadcastService", "BuddhistTemple",
  "BusReservation", "BusStation", "BusStop", "BusTrip", "BusinessAudience", "BusinessEntityType", "BusinessEvent",
  "BusinessFunction", "BuyAction", "CafeOrCoffeeShop", "Campground", "Canal", "CancelAction", "Car", "Casino",
  "CatholicChurch", "Cemetery", "CheckAction", "CheckInAction", "CheckOutAction", "CheckoutPage", "ChildCare",
  "ChildrensEvent", "ChooseAction", "Church", "City", "CityHall", "CivicStructure", "Class", "Clip", "ClothingStore",
  "Code", "CollectionPage", "CollegeOrUniversity", "ComedyClub", "ComedyEvent", "Comment", "CommentAction",
  "CommunicateAction", "ComputerStore", "ConfirmAction", "ConsumeAction", "ContactPage", "ContactPoint", "ContactPointOption",
  "Continent", "ConvenienceStore", "CookAction", "Corporation", "Country", "Courthouse", "CreateAction", "CreativeWork",
  "CreditCard", "Crematorium", "DDxElement", "DanceEvent", "DanceGroup", "DataCatalog", "DataDownload", "Dataset", "DayOfWeek",
  "DaySpa", "DefenceEstablishment", "DeleteAction", "DeliveryChargeSpecification", "DeliveryEvent", "DeliveryMethod", "Demand",
  "Dentist", "DepartAction", "DepartmentStore", "DiagnosticLab", "DiagnosticProcedure", "Diet", "DietarySupplement",
  "DisagreeAction", "DiscoverAction", "DislikeAction", "Distance", "DonateAction", "DoseSchedule", "DownloadAction",
  "DrawAction", "DrinkAction", "Drug", "DrugClass", "DrugCost", "DrugCostCategory", "DrugLegalStatus",
  "DrugPregnancyCategory", "DrugPrescriptionStatus", "DrugStrength", "DryCleaningOrLaundry", "Duration", "EatAction",
  "EducationEvent", "EducationalAudience", "EducationalOrganization", "Electrician", "ElectronicsStore", "ElementarySchool",
  "EmailMessage", "Embassy", "EmergencyService", "EmploymentAgency", "EndorseAction", "Energy", "EntertainmentBusiness",
  "Enumeration", "Episode", "Event", "EventReservation", "EventStatusType", "EventVenue", "ExerciseAction",
  "ExerciseGym", "ExercisePlan", "FastFoodRestaurant", "Festival", "FilmAction", "FinancialService", "FindAction",
  "FireStation", "Flight", "FlightReservation", "Florist", "FollowAction", "FoodEstablishment",
  "FoodEstablishmentReservation", "FoodEvent", "FurnitureStore", "GardenStore", "GasStation", "GatedResidenceCommunity",
  "GeneralContractor", "GeoCoordinates", "GeoShape", "GiveAction", "GolfCourse", "GovernmentBuilding",
  "GovernmentOffice", "GovernmentOrganization", "GovernmentPermit", "GovernmentService", "GroceryStore",
  "HVACBusiness", "HairSalon", "HardwareStore", "HealthAndBeautyBusiness", "HealthClub", "HighSchool", "HinduTemple",
  "HobbyShop", "HomeAndConstructionBusiness", "HomeGoodsStore", "Hospital", "Hostel", "Hotel", "HousePainter",
  "IceCreamShop", "IgnoreAction", "ImageGallery", "ImageObject", "ImagingTest", "IndividualProduct", "InfectiousAgentClass",
  "InfectiousDisease", "InformAction", "InsertAction", "InstallAction", "InsuranceAgency", "Intangible",
  "InteractAction", "InternetCafe", "InviteAction", "ItemAvailability", "ItemList", "ItemPage",
  "JewelryStore", "JobPosting", "JoinAction", "Joint", "LakeBodyOfWater", "Landform",
  "LandmarksOrHistoricalBuildings", "Language", "LeaveAction", "LegislativeBuilding",
  "LendAction", "Library", "LifestyleModification", "Ligament", "LikeAction", "LiquorStore",
  "ListenAction", "LiteraryEvent", "LocalBusiness", "LockerDelivery", "Locksmith", "LodgingBusiness",
  "LodgingReservation", "LoseAction", "LymphaticVessel", "Map", "MarryAction", "Mass",
  "MaximumDoseSchedule", "MediaObject", "MedicalAudience", "MedicalCause", "MedicalClinic",
  "MedicalCode", "MedicalCondition", "MedicalConditionStage", "MedicalContraindication",
  "MedicalDevice", "MedicalDevicePurpose", "MedicalEntity", "MedicalEnumeration",
  "MedicalEvidenceLevel", "MedicalGuideline", "MedicalGuidelineContraindication", "MedicalGuidelineRecommendation",
  "MedicalImagingTechnique", "MedicalIndication", "MedicalIntangible", "MedicalObservationalStudy",
  "MedicalObservationalStudyDesign", "MedicalOrganization", "MedicalProcedure", "MedicalProcedureType",
  "MedicalRiskCalculator", "MedicalRiskEstimator", "MedicalRiskFactor", "MedicalRiskScore", "MedicalScholarlyArticle",
  "MedicalSign", "MedicalSignOrSymptom", "MedicalSpecialty", "MedicalStudy", "MedicalStudyStatus", "MedicalSymptom",
  "MedicalTest", "MedicalTestPanel", "MedicalTherapy", "MedicalTrial", "MedicalTrialDesign", "MedicalWebPage",
  "MedicineSystem", "MensClothingStore", "MiddleSchool", "MobileApplication", "MobilePhoneStore", "Mosque",
  "Motel", "MotorcycleDealer", "MotorcycleRepair", "Mountain", "MoveAction", "Movie", "MovieRentalStore",
  "MovieTheater", "MovingCompany", "Muscle", "Museum", "MusicAlbum", "MusicEvent", "MusicGroup",
  "MusicPlaylist", "MusicRecording", "MusicStore", "MusicVenue", "MusicVideoObject", "NGO", "NailSalon",
  "Nerve", "NewsArticle", "NightClub", "Notary", "NutritionInformation", "OceanBodyOfWater", "Offer",
  "OfferItemCondition", "OfficeEquipmentStore", "OnDemandEvent", "OnSitePickup", "OpeningHoursSpecification",
  "Optician", "Order", "OrderAction", "OrderStatus", "Organization", "OrganizeAction", "OutletStore",
  "OwnershipInfo", "PaintAction", "Painting", "PalliativeProcedure", "ParcelDelivery", "ParcelService",
  "ParentAudience", "Park", "ParkingFacility", "PathologyTest", "PawnShop", "PayAction", "PaymentChargeSpecification",
  "PaymentMethod", "PeopleAudience", "PerformAction", "PerformingArtsTheater", "PerformingGroup", "Periodical",
  "Permit", "Person", "PetStore", "Pharmacy", "Photograph", "PhotographAction", "PhysicalActivity",
  "PhysicalActivityCategory", "PhysicalExam", "PhysicalTherapy", "Physician", "Place", "PlaceOfWorship",
  "PlanAction", "PlayAction", "Playground", "Plumber", "PoliceStation", "Pond", "PostOffice", "PostalAddress",
  "PrependAction", "Preschool", "PreventionIndication", "PriceSpecification", "Product", "ProductModel",
  "ProfessionalService", "ProfilePage", "ProgramMembership", "Property", "PsychologicalTreatment",
  "PublicSwimmingPool", "PublicationEvent", "PublicationIssue", "PublicationVolume", "QAPage", "QualitativeValue",
  "QuantitativeValue", "Quantity", "Question", "QuoteAction", "RVPark", "RadiationTherapy", "RadioClip",
  "RadioEpisode", "RadioSeason", "RadioSeries", "RadioStation", "Rating", "ReactAction", "ReadAction",
  "RealEstateAgent", "ReceiveAction", "Recipe", "RecommendedDoseSchedule", "RecyclingCenter", "RegisterAction",
  "RejectAction", "RentAction", "RentalCarReservation", "ReplaceAction", "ReplyAction", "ReportedDoseSchedule",
  "Reservation", "ReservationPackage", "ReservationStatusType", "ReserveAction", "Reservoir", "Residence",
  "Restaurant", "ReturnAction", "Review", "ReviewAction", "RiverBodyOfWater", "RoofingContractor", "RsvpAction",
  "SaleEvent", "ScheduleAction", "ScholarlyArticle", "School", "Sculpture", "SeaBodyOfWater", "SearchAction",
  "SearchResultsPage", "Season", "Seat", "SelfStorage", "SellAction", "SendAction", "Series", "Service",
  "ServiceChannel", "ShareAction", "ShoeStore", "ShoppingCenter", "SingleFamilyResidence", "SiteNavigationElement",
  "SkiResort", "SocialEvent", "SoftwareApplication", "SomeProducts", "Specialty", "SportingGoodsStore",
  "SportsActivityLocation", "SportsClub", "SportsEvent", "SportsTeam", "StadiumOrArena", "State", "Store",
  "StructuredValue", "SubscribeAction", "SubwayStation", "SuperficialAnatomy", "Synagogue", "TVClip", "TVEpisode",
  "TVSeason", "TVSeries", "Table", "TakeAction", "TattooParlor", "Taxi", "TaxiReservation", "TaxiStand", "TechArticle",
  "TelevisionStation", "TennisComplex", "TheaterEvent", "TheaterGroup", "TherapeuticProcedure", "Thing", "Ticket",
  "TieAction", "TipAction", "TireShop", "TouristAttraction", "TouristInformationCenter", "ToyStore", "TrackAction",
  "TradeAction", "TrainReservation", "TrainStation", "TrainTrip", "TransferAction", "TravelAction", "TravelAgency",
  "TreatmentIndication", "TypeAndQuantityNode", "UnRegisterAction", "UnitPriceSpecification", "UpdateAction",
  "UseAction", "UserBlocks", "UserCheckins", "UserComments", "UserDownloads", "UserInteraction", "UserLikes",
  "UserPageVisits", "UserPlays", "UserPlusOnes", "UserTweets", "Vehicle", "Vein", "Vessel", "VeterinaryCare",
  "VideoGallery", "VideoObject", "ViewAction", "VisualArtsEvent", "Volcano", "VoteAction", "WPAdBlock", "WPFooter",
  "WPHeader", "WPSideBar", "WantAction", "WarrantyPromise", "WarrantyScope", "WatchAction", "Waterfall", "WearAction",
  "WebApplication", "WebPage", "WebPageElement", "WholesaleStore", "WinAction", "Winery", "WriteAction", "Zoo"
].each {|class_name|
  Mida::SchemaOrg.const_set(class_name.to_sym, Class.new(Mida::Vocabulary))
}



Dir[File.dirname(__FILE__) + '/mida_vocabulary/*.rb'].each { |f| require f }

require 'mida_vocabulary/vocabularies/genericvocabulary'
require 'mida_vocabulary/vocabularies/schemaorg'
require 'mida_vocabulary/vocabularies/data_vocabulary'