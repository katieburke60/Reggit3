require 'pry'
# require_relative '../assets/javascript/xmlToJson.js'

desc "Scrape regulations"

task :scrape_regulations_xml => [:environment] do
  Regulation.all.each do |regulation|

    begin
      date = regulation.publication_date.gsub(/^(.{10,}?).*$/m,'\1')
      year = date[0...4]
      month = date[5...7]
      day = date[8...10]
      formatted_date = year + '/' + month + '/' + day + '/'

      text = RestClient.get('https://www.federalregister.gov/documents/full_text/xml/' + formatted_date +  regulation.fedregister_id + '.xml').body
    rescue
      next
    else

      dom = Nokogiri::XML(text)
      regulation['action'] = dom.xpath('//ACT//P').children.text
      regulation['subagency'] = dom.xpath('//SUBAGY')
      regulation['summary'] = dom.xpath('//SUM//P').children.text
      regulation['contact'] = dom.xpath('//FURINF//P').children.text
      # regulation['reg_body'] = dom.xpath('//SUPLINF')
      regulation.save
    end

    #ideally would rather split up contact, but can't find good flags on doc to do easily.
  end
end
