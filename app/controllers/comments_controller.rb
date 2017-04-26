class CommentsController < ApplicationController



    def create
       Comment.create(description: params['description'], regulation_id: params['regulation_id'])
    end



  end
