require 'rest-client'
require 'pry'

class RegulationsController < ApplicationController

 def index
   # make logic to dynamically change date to 4 month prior to the day
   # result to be converted= Sat, 17 Dec 2016 need yyyy-mm-dd
   fullurl= 'www.federalregister.gov/api/v1/documents.json?per_page=1000&order=relevance&conditions%5Bpublication_date%5D%5Bgte%5D=2017-01-01&conditions%5Btype%5D%5B%5D=PRORULE&conditions%5Btype%5D%5B%5D=NOTICE&conditions%5Bsignificant%5D=1'
   fedurl= 'www.federalregister.gov/api/v1/documents.json?per_page=1000&order=relevance&conditions'
   retro_date= (Date.today - 4.months).to_s
   dynamic_date_url = 'www.federalregister.gov/api/v1/documents.json?per_page=1000&order=relevance&conditions' + '%5Bpublication_date%5D%5Bgte%5D=' + ((Date.today - 4.months).to_s) + '&conditions%5Btype%5D%5B%5D=PRORULE&conditions%5Btype%5D%5B%5D=NOTICE&conditions%5Bsignificant%5D=1'

   regulations_list_data = JSON.parse(RestClient.get(dynamic_date_url),headers={})
   final_regulations_list = regulations_list_data['results']

   agency_list = JSON.parse(RestClient.get("https://www.federalregister.gov/api/v1/agencies"))
  #  agency_list = agency_json.map do |agency|
  #    agency['id']
  #  end


   final_regulations_list.map do |regulation|
     Regulation.new title: regulation['title']
      end
   render json: agency_json

    end
  #   end
  #  end

  #   cat_to_agency.each do |category, agencies|
  #     if agencies.includes(regulation[agency])
  #       regulation.category = category


  #  render json: final_regulations_list



 def show
   regulation = Regulation.find(params[:id])
   @comments = regulation.comments
   #API call for specific regulation (by certain ID)
  #  render json: regulation, serializer: RegulationShowSerializer
   render json: @comments
 end

#hash to index categories to federal agencies

 { :education => [],
   :health => ['DEPARTMENT OF HEALTH AND HUMAN SERVICES', 'Centers for Medicare & Medicaid Services'],
   :transportation => ["DEPARTMENT OF TRANSPORTATION", "Federal Transit Administration",
                      'Federal Motor Carrier Safety Administration', 'Pipeline and Hazardous Materials Safety Administration',
                      'Transportation Security Administration'],
   :jobs_and_economy => [],
   :labor => ['DEPARTMENT OF LABOR', 'Mine Safety and Health Administration', 'Occupational Safety and Health Administration'],
   :national_security => ["DEPARTMENT OF STATE", 'DEPARTMENT OF HOMELAND SECURITY'],
   :energy => ["NUCLEAR REGULATORY COMMISSION", 'COMMODITY FUTURES TRADING COMMISSION', 'ENVIRONMENTAL PROTECTION AGENCY',
               "DEPARTMENT OF AGRICULTURE", 'DEPARTMENT OF THE INTERIOR', 'Fish and Wildlife Service'],
   :veterans => ["DEPARTMENT OF VETERANS AFFAIRS"],
   :finance => [],
   :technology => [],
 }
 { :education => [],
   :health => [221, 45],
   :transportation => [492, 193, 181, 408, 494],
   :jobs_and_economy => [],
   :labor => [271, 288, 386],
   :national_security => [476, 227],
   :energy_and_environment => [383, 77, 145, 12, 253, 97],
   :veterans => [520],
   :finance => [],
   :technology => [],
 }

end
