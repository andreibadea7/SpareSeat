class OrdersController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @ticket.for_sale = false
    # raise
    @order = Order.create!(ticket: @ticket, amount: @ticket.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        quantity: 1,
        price_data: {
          unit_amount: @ticket.price.fractional,
          currency: 'gbp',
          product_data: {
            name: @ticket.event[:name]
          }
        }
      ],
      mode: "payment",
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    @order.update(checkout_session_id: session.id)
    @ticket.update(for_sale: false)
    redirect_to new_order_payment_path(@order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
