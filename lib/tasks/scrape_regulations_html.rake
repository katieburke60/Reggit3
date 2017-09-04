desc "Scrape regulations"

task :scrape_regulations => [:environment] do
  Regulation.all.each do |regulation|
    begin
      date = regulation.publication_date.gsub(/^(.{10,}?).*$/m,'\1')
      year = date[0...4]
      month = date[5...7]
      day = date[8...10]
      formatted_date = year + '/' + month + '/' + day + '/'

      html_url = 'https://www.federalregister.gov/documents/full_text/html/' + formatted_date +  regulation.fedregister_id + '.html'
      text = RestClient.get(html_url).body
    rescue
      next
    else
      dom = Nokogiri::HTML(text)
      regulation_body = dom.to_html
      RegulationBody.create(html_blob: regulation_body, regulation_id: regulation.id)
      #TODO: add url attribute
    end
  end
end
