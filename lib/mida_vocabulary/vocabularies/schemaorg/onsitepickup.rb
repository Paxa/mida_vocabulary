require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # A DeliveryMethod in which an item is collected on site, e.g. in a store or at a box office. Schema Version 1.9 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) })(window,document,'script','//www.google-analytics.com/analytics.js','ga'); ga('create', 'UA-52672119-1', 'auto');ga('send', 'pageview');
    class OnSitePickup < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
