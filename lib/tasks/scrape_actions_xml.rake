require 'pry'
# require_relative '../assets/javascript/xmlToJson.js'

desc "Scrape actions"

task :scrape_actions_xml => [:environment] do
  Action.all.each do |action|

    begin
      date = action.publication_date.gsub(/^(.{10,}?).*$/m,'\1')
      year = date[0...4]
      month = date[5...7]
      day = date[8...10]
      formatted_date = year + '/' + month + '/' + day + '/'

      text = RestClient.get('https://www.federalregister.gov/documents/full_text/xml/' + formatted_date +  action.fedregister_id + '.xml').body
    rescue
      next
    else

      dom = Nokogiri::XML(text)
      action['action'] = dom.xpath('//ACT//P').children.text
      action['subagency'] = dom.xpath('//SUBAGY')
      action['summary'] = dom.xpath('//SUM//P').children.text
      action['contact'] = dom.xpath('//FURINF//P').children.text
      # action['reg_body'] = dom.xpath('//SUPLINF')
      action.save
    end

    #ideally would rather split up contact, but can't find good flags on doc to do easily.
  end
end
