class TestimonialsController < ApplicationController

  def index
    @testimonials = Testimonial.all
  end

  def create
    testimonial = Testimonial.create(testimonial_params)
    if testimonial.save
      redirect_to "/admin/dashboard"
    else
      redirect_to "/admin/testimonials/new"
      flash[:error] = testimonial.errors.full_messages.to_sentence
    end
  end

  def update
    testimonial = Testimonial.find(params[:testimonial_id])
    testimonial.update(testimonial_params)
    if testimonial.save
      redirect_to "/admin/dashboard"
    else
      redirect_to "/admin/testimonials/#{testimonial.id}/edit"
      flash[:error] = testimonial.errors.full_messages.to_sentence
    end
  end

  private

  def testimonial_params
    params.permit(:description, :author)
  end
end
