class OrdersController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    # raise
    @order = Order.create!(ticket: @ticket, amount: @ticket.price,
                           state: 'pending', user: current_user)

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
    redirect_to new_order_payment_path(@order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order.ticket.update(owner: current_user)
    @order.ticket.update(for_sale: false)

    @order.ticket.code = SecureRandom.hex
    @qr_code = RQRCode::QRCode.new(@order.ticket.code)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true
    )
  end
end
