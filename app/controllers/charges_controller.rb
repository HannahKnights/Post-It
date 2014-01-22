class ChargesController < ApplicationController

  before_action :authenticate_user!

  def new 

  end

  def create
  @post = Post.find params[:post_id]
  @amount = 500

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @post.title,
      :currency    => 'gbp'
    )

  flash[:notice] = 'Payment Succeeded'
  redirect_to '/posts'


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
