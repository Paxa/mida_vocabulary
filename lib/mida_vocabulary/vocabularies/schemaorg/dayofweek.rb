require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # The day of the week, e.g. used to specify to which day the opening hours of an OpeningHoursSpecification refer. Commonly used values: http://purl.org/goodrelations/v1#Monday http://purl.org/goodrelations/v1#Tuesday http://purl.org/goodrelations/v1#Wednesday http://purl.org/goodrelations/v1#Thursday http://purl.org/goodrelations/v1#Friday http://purl.org/goodrelations/v1#Saturday http://purl.org/goodrelations/v1#Sunday http://purl.org/goodrelations/v1#PublicHolidays
    class DayOfWeek < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
