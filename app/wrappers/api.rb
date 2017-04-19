require 'rest-client'

text = RestClient.get("https://www.federalregister.gov/documents/2016/08/19/2016-15977/workforce-innovation-and-opportunity-act-joint-rule-for-unified-and-combined-state-plans-performance").body
dom = Nokogiri::HTML(text)
render dom.css("#fulltext_content_area").to_html

# results(array) --> number --> html_url
