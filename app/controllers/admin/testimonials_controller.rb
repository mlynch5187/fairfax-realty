class Admin::TestimonialsController < ApplicationController

  def new; end

  def edit
    @testimonial = Testimonial.find(params[:testimonial_id])
  end
end
