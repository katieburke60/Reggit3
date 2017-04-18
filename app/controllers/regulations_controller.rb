require "rest-client"

class RegulationsController < ApplicationController

 def index
   # regulations = Regulation.all
   # external API call (documents summary)

   fullurl="www.federalregister.gov/api/v1/documents.json?per_page=1000&order=relevance&conditions%5Bpublication_date%5D%5Bgte%5D=2017-01-01&conditions%5Btype%5D%5B%5D=PRORULE&conditions%5Btype%5D%5B%5D=NOTICE&conditions%5Bsignificant%5D=1"
   fedurl="www.federalregister.gov/api/v1/documents.json?per_page=1000&order=relevance&conditions"
   retro_date= (Date.today - 4.months).to_s
   dynamic_date_url = fedurl+"%5Bpublication_date%5D%5Bgte%5D="+retro_date+"&conditions%5Btype%5D%5B%5D=PRORULE&conditions%5Btype%5D%5B%5D=NOTICE&conditions%5Bsignificant%5D=1"

   # make logic to dynamically change date to 4 month prior to the day
   # result to be converted= Sat, 17 Dec 2016 need yyyy-mm-dd
   @api_data = JSON.parse(RestClient.get(dynamic_date_url),headers={})


   @api_data_json=@api_data.to_json
   render "api/data"
 end

 def show
   regulation = Regulation.find(params[:id])
   @comments = regulation.comments
   #API call for specific regulation (by certain ID)
  #  render json: regulation, serializer: RegulationShowSerializer
   render json: @comments
 end

end
