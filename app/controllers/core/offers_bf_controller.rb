module Core
  class OffersBfController < ApplicationController

    layout 'core'

    before_action :authenticate_user!, :except => [:index, :show, :resolve]

    def index
    #   @bug = @repo = nil
    #   @timestamp = Time.now.strftime("%H:%M:%S")
    #   case
    #     when bug_id = params["bug_id"]&.to_i
    #       @bug = Bug.find(bug_id)
    #       @offer_bfs = Offer::Buy::Fixed.where(bug_id: bug_id)
    #     when stm_repo_id = params["stm_repo_id"]&.to_i
    #       @repo = Repo.find(stm_repo_id)
    #       @offer_bfs = Offer::Buy::Fixed.where(stm_repo_id: stm_repo_id)
    #     else
    #       @offer_bfs = Offer::Buy::Fixed.all
    #   end
    end

    def new
      @offer_bf = OfferCmd::CreateBuy.new(:offer_bf, new_opts(params))
    end

    def create
      opts = params["offer_cmd_create_buy"]
      @offer_bf = OfferCmd::CreateBuy.new(:offer_bf, new_opts.merge(valid_params(opts)))
      if @offer_bf.save_event.project
        flash[:notice] = "Offer created! (BF)"
        redirect_to("/core/offers/#{@offer_bf.id}")
      else
        render 'core/offers_bf/new'
      end
    end

    private

    def valid_params(params)
      fields = Offer::Buy::Fixed.attribute_names.map(&:to_sym)
      params.permit(fields)
    end

    def new_opts(params = {})
      opts = {
        price:      0.50                      ,
        poolable:   false                     ,
        aon:        false                     ,
        volume:     10                        ,
        status:     'open'                    ,
        stm_status: "closed"                  ,
        maturation: Time.now + 3.minutes      ,
        user_id: current_user.id
      }
      key = "stm_bug_id" if params["stm_bug_id"]
      key = "stm_repo_id" if params["stm_repo_id"]
      id = params["stm_bug_id"] || params["stm_repo_id"]
      opts.merge({key => id}).without_blanks
    end
  end
end