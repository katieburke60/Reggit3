desc "Scrape actions"

task :scrape_actions => [:environment] do
  Action.all.each do |action|
    begin
      date = action.publication_date.gsub(/^(.{10,}?).*$/m,'\1')
      year = date[0...4]
      month = date[5...7]
      day = date[8...10]
      formatted_date = year + '/' + month + '/' + day + '/'

      html_url = 'https://www.federalregister.gov/documents/full_text/html/' + formatted_date +  action.fedregister_id + '.html'
      text = RestClient.get(html_url).body
    rescue
      next
    else
      dom = Nokogiri::HTML(text)
      action_body = dom.to_html
      ActionBody.create(html_blob: action_body, action_id: action.id)
      #TODO: add url attribute
    end
  end
end
