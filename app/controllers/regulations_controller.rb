require 'rest-client'
require 'pry'
require 'nokogiri'

class RegulationsController < ApplicationController
  @@cat_to_agency_id = {
    :education => [126],
    :health => [221, 45, 353],
    :transportation => [492, 193, 181, 408, 494],
    :jobs_and_economy => [],
    :labor => [355, 271, 288, 386],
    :national_security => [227],
    :energy_and_environment => [136, 383, 77, 145, 12, 253, 97, 361, 301],
    :veterans => [520],
    :finance => [54, 497, 192],
    :housing_and_urban_development => [228, 174, 458, 404, 397],
    :foreign_policy => [476, 397],
    :law_and_justice => [268, 268, 349],
    :technology => [161, 352],
  }
  @@cat_to_agency_name = {
    :education => ['Department of Education'],
    :health => ['DEPARTMENT OF HEALTH AND HUMAN SERVICES', 'Centers for Medicare & Medicaid Services', 'National Institutes of Health'],
    :transportation => ["DEPARTMENT OF TRANSPORTATION", "Federal Transit Administration",
                  'Federal Motor Carrier Safety Administration', 'Pipeline and Hazardous Materials Safety Administration',
                  'Transportation Security Administration'],
    :jobs_and_economy => [],
    :labor => ['National Labor Relations Board','DEPARTMENT OF LABOR', 'Mine Safety and Health Administration', 'Occupational Safety and Health Administration'],
    :national_security => ['DEPARTMENT OF HOMELAND SECURITY'],
    :energy_and_environment => ['Department of Energy', "NUCLEAR REGULATORY COMMISSION", 'COMMODITY FUTURES TRADING COMMISSION', 'ENVIRONMENTAL PROTECTION AGENCY',
           "DEPARTMENT OF AGRICULTURE", 'DEPARTMENT OF THE INTERIOR', 'Fish and Wildlife Service', 'National Oceanic and Atmospheric Administration', 'National Aeronautics and Space Administration'],
    :veterans => ["DEPARTMENT OF VETERANS AFFAIRS"],
    :finance => ["Department of Commerce", 'Department of the Treasury', 'Federal Trade Commission'],
    :housing_and_urban_development => ['Housing and Urban Development', 'The Federal Housing Finance Agency', 'Rural Housing Service', 'Pension and Welfare Benefits Administration', 'Neighborhood Reinvestment Corporation'],
    :foreign_policy => ["DEPARTMENT OF STATE", 'Overseas Private Investment Corporation'],
    :law_and_justice => ['Department of Justice', 'Federal Bureau of Investigation', 'National Institute of Corrections'],
    :technology => ['Federal Communications Commission', 'National Institute of Standards and Technology'],
    }

  def index
    fullurl= 'www.federalregister.gov/api/v1/documents.json?per_page=1000&order=relevance&conditions%5Bpublication_date%5D%5Bgte%5D=2017-01-01&conditions%5Btype%5D%5B%5D=PRORULE&conditions%5Btype%5D%5B%5D=NOTICE&conditions%5Bsignificant%5D=1'
    fedurl= 'www.federalregister.gov/api/v1/documents.json?per_page=1000&order=relevance&conditions'
    retro_date= (Date.today - 4.months).to_s
    dynamic_date_url = 'www.federalregister.gov/api/v1/documents.json?per_page=1000&order=relevance&conditions' + '%5Bpublication_date%5D%5Bgte%5D=' + ((Date.today - 4.months).to_s) + '&conditions%5Btype%5D%5B%5D=PRORULE&conditions%5Btype%5D%5B%5D=NOTICE&conditions%5Bsignificant%5D=1'

    regulations_list_data = JSON.parse(RestClient.get(dynamic_date_url),headers={})
    regulations_list_v1 = regulations_list_data['results']

    @final_regulations_list = regulations_list_v1.map do |regulation|
      @@cat_to_agency_id.each do |category, agencies|
        if agencies.include?(regulation['agencies'][0]['id'])
          @found_category = category
        end
      end

      category_id = (Category.where(["name= ?", @found_category]).first).id

      current_regulation = Regulation.find_by title: regulation['title']
      if current_regulation
        current_regulation
      else
        Regulation.create(
                          title: regulation['title'], agency: regulation['agencies'][0]['name'], reg_status: regulation['type'],
                          document_number: regulation['document_number'], url: regulation['html_url'],
                          publication_date: regulation['publication_date'], agency_id: regulation['agencies'][0]['id'],
                          summary: regulation['abstract'], major_rule: true, category_name: @found_category, category_id: category_id,
                          )
      end
  end
  render json: @final_regulations_list.to_json
end

  def show
      regulation = Regulation.find(params[:id])
      render json: regulation
  end

end
