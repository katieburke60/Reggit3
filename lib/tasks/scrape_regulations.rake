desc "Scrape regulations"

task :scrape_regulations => [:environment] do
  Regulation.all.each do |regulation|
    if regulation.url
      text = RestClient.get(regulation.url).body
      dom = Nokogiri::HTML(text)
      regulation_body = dom.css("#fulltext_content_area").to_html
      RegulationBody.create(html_blob: regulation_body, regulation_id: regulation.id)
    end
  end
end
