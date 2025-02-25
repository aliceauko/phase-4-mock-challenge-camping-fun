class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private
    def render_unprocessable_entity_response(invalid)
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
