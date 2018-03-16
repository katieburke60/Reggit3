require 'rest-client'
require 'pry'
require 'nokogiri'

class ActionsController < ApplicationController
  # @@cat_to_agency_id = {
  #   :education => [126],
  #   :health => [221, 45, 353],
  #   :transportation => [492, 193, 181, 408, 494],
  #   :labor => [355, 271, 288, 386],
  #   :security => [227],
  #   :energy => [136, 383, 77, 145, 12, 253, 97, 361, 301],
  #   :veterans => [520],
  #   :finance => [54, 497, 192],
  #   :housing => [228, 174, 458, 404, 397],
  #   :foreign_policy => [476, 397],
  #   :law_and_justice => [268, 268, 349],
  # }
  # @@cat_to_agency_name = {
  #   :education => ['ED'],
  #   :health => ['HHS', 'CMS', 'NIH', 'FNS', 'FDA', 'FSIS'],
  #   :transportation => ["DOT", "FTA",
  #     'Federal Motor Carrier Safety Administration', 'PHMSA',
  #     'TSA', 'FAA'],
  #   :labor => ['NLRB','DOL', 'MSHA', 'OSHA', 'ETA', 'WHD'],
  #   :security => ['DHS', 'DOD', 'USCG'],
  #   :energy => ['DOE', 'NRC', 'CFTC', 'EPA',
  #     "USDA", 'DOI', 'FWS', 'NOAA', 'NASA', 'EERE', 'USGC', 'FERC', 'FEMA', 'BLM', 'ONRR', 'APHIS', 'FCA'],
  #   :veterans => ["VA"],
  #   :finance => ["DOC", 'Department of the Treasury', 'FTC', 'IRS', 'SEC', 'SSA', 'FRS', 'PBGC', 'CFPB', 'FISCAL'],
  #   :housing => ['HUD', 'FHFA', 'RHS', 'Pension and Welfare Benefits Administration', 'Neighborhood Reinvestment Corporation'],
  #   :technology => ['FCC'],
  #   :foreign_policy => ['DOS', 'OPIC', 'ITA', 'AID'],
  #   :law_and_justice => ['DOJ', 'FBI', 'National Institute of Corrections', 'BOP', 'CIA'],
  #   :other => ['GEO', 'USPS', 'CNCS', 'OPM']
  #     }
  #
  #     def days_left(comment_end_date)
  #       (comment_end_date - Date.today).to_i
  #     end
  #
  #     def get_actions
  #       fullurl = 'https://api.data.gov/regulations/v3/documents.json?api_key=' + Rails.application.secrets.data_gov_key + '&dct=PR+FR&crd=07/01/16-07/10/16&rpp=500'
  #       # dockets='PR+FR+N'
  #       # ${retro_date}-${Date.today}
  #
  #       retro_date= (Date.today - 12.months).to_s
  #       # dynamic_date_url = 'www.federalregister.gov/api/v1/documents.json?per_page=1000&order=relevance&conditions' + '%5Bpublication_date%5D%5Bgte%5D=' + ((Date.today - 4.months).to_s) + '&conditions%5Btype%5D%5B%5D=PRORULE&conditions%5Btype%5D%5B%5D=NOTICE&conditions%5Bsignificant%5D=1'
  #
  #       actions_list_data = JSON.parse(RestClient.get(fullurl),headers={})
  #       actions_list_v1 = actions_list_data['documents']
  #       @initial_reg_list = actions_list_v1.map do |action|
  #         @@cat_to_agency_name.each do |category, agencies|
  #           if agencies.include?(action['agencyAcronym'])
  #             @found_category = category
  #           end
  #         end
  #
  #         category = (Category.where(["name= ?", @found_category]).first)
  #         if !category
  #           category = Category.where(["name= ?", 'other']).first
  #         end
  #         yield(action, category)
  #       end
  #     end
  #     def index
  #       initial_action_list = get_actions do |action, category|
  #         if category
  #           Action.where(title: action['title']).first_or_create(
  #           title: action['title'], agency_acronym: action['agencyAcronym'], status: action['documentType'],
  #           document_number: action['documentId'],
  #           publication_date: action['postedDate'], fedregister_id: action['frNumber'], docket_id: action['docketId'], open_for_comment: action['openForComment'], comments_received: action['numberOfCommentsReceived'], comment_end_date: action['commentDueDate'], comment_start_date: action['commentStartDate'], attachment_number: action['attachmentCount'], category_name: category.name, category_id: category.id)
  #         else
  #           Action.where(title: action['title']).first_or_create(
  #           title: action['title'], agency_acronym: action['agencyAcronym'],
  #           document_number: action['documentId'],
  #           publication_date: action['postedDate'], fedregister_id: action['frNumber'], docket_id: action['docketId'], open_for_comment: action['openForComment'], comments_received: action['numberOfCommentsReceived'], comment_end_date: action['commentDueDate'], comment_start_date: action['commentStartDate'], attachment_number: action['attachmentCount'])
  #         end
  #       end
  #
  #       initial_action_list.map do |action|
  #         if action.comment_end_date
  #           action.update_attribute(:days_left, (action.comment_end_date - Date.today))
  #         end
  #
  #         if !action.agency_full
  #           begin
  #             id = action.fedregister_id
  #             url = 'https://www.federalregister.gov/api/v1/documents/' + id + '.json'
  #           rescue
  #             next
  #           else
  #             json = JSON.parse(RestClient.get(url).body)
  #
  #             action['agency_full'] = json['agencies'][0]['name']
  #             action['html_url'] = json['body_html_url']
  #             action['corrections'] = json['corrections']
  #             action['date_desc'] = json['dates']
  #             action['significant'] = json['significant']
  #             action['tags'] = json['topics']
  #             # action['priority_category'] = json['regulation_id_number_info'].values[0]['priority_category']
  #             action['reg_id'] = json['regulation_id_numbers'][0]
  #
  #             action.save
  #           end
  #         end
  #       end
            #TODO: account for possibility of multiple regulatory id numbers(the return value is an array)
        # sorted_reg_list = initial_reg_list.sort_by {|action| action.agency}
      def index
        render json: Action.all
        # render json: initial_action_list.uniq.to_json
      end

      def show
        action = Action.find(params[:id])

        render json: action
      end

      def create_action_follow
        account = (authenticate_or_request_with_http_token do |token, options|
          Account.from_token(token)
        end)
        action = Action.find(params['action_id'])
        if account && action
          action_follow = ActionFollow.find_or_create_by(citizen_id: account.citizen.id, action_id: action.id)
          action_follow.following = true
          action_follow.save
          render json: action_follow
        else
          render json: {error: "Unable to follow action"}, status: 401
        end
      end

      def destroy_action_follow
        account = (authenticate_or_request_with_http_token do |token, options|
          Account.from_token(token)
        end)
        action = Action.find(params['action_id'])
        action_follow = ActionFollow.find_by(action_id: action.id, citizen_id: account.citizen.id)
        action_follow.destroy
        render json: action_follow
      end

    end
