class PopulateExistingTendersIntoPaperclipAttachemnts < ActiveRecord::Migration
  def up
    require 'open-uri'
    tenders = [
      {
        url: "https://s3-ap-southeast-1.amazonaws.com/smartgridgurgaon/documents/Archive.zip",
        text: "Conducting foot survey, designing the system, supply of material and erection for conversion of existing 11 kV and LT overhead distribution system into 100% redundant underground system in Ring main configuration and installation of 11/ 0.433 kV Distribution Transformer (conventional and package type) and SCADA enabling equipments such as RMU with inbuilt FRTU and FPI, optical fibre cable, LT feeder panel, street light alongwith the associated civil works, dismantlement of existing HT/ LT system, integration with existing systems, complete testing and commissioning,  alongwith the support services including operation and maintenance of the system so installed for a period of 5 years after the commissioning of entire project- in the area of DLF operation sub-division, DHBVN, Gurgaon, under the jurisdiction of DHBVN."
      }, {
        url: "https://www.dropbox.com/s/df9lej55uutwcvr/tender.zip?dl=1",
        text: "Request for conducting the land/field surveys photogrammetry through GPR/GIS and office work required to compile a TOPOGRAPHIC/ UNDERGROUND map of property(s) identified in tender documents to generate requisite information for design and field engineering activities for the area pertaining to DLF sub-division of Gurgaon circle under the jurisdiction of DHBVN on turnkey basis in Haryana State against tender enquiry no. TSGP-01/ 2016-17"
      }
    ].reverse
    tenders.each do |tender|
      u = Tender.new(text: tender[:text], file: open(tender[:url]))
      u.save!
      close
    end
  end

  def down
  end
end

