class Admin::OrdersController < Admin::ApplicationController
	before_action :check_access!, only: [:index], except: [:successful]
	skip_before_action :verify_authenticity_token

	def index
		@orders = Order.order("order_date desc").paginate(:per_page => 10, :page => params[:page])
	end

	def new
	end

	def create
		data = []
		status = 'failed'

		param = params[:params]
		clientName = param[:name]
		orderDate = param[:date]
		itemName = param[:itemName].to_s.split(',')
		itemQty = param[:itemQty].to_s.split(',')

		
		order = Order.new(name: clientName, order_date: orderDate, user_id: 1, order_status_id: 1)

		if order.save
			orderId = order.id

			for i in 0..itemName.length - 1
				data << { order_id: orderId, item: itemName[i].to_s, quantity: itemQty[i], status: 2 }
			end

			orderItem = OrderItem.create!([ data ])

			if orderItem
				status = 'success'
			end
		end

		render json: { status: status }
	end

	def successful
	end

	def get_order_items
		@orderItem = OrderItem.where("order_id = ?", params[:id]).order("id")

		respond_to do |format|
			format.html { render action: "_order_items", layout: false }
		end
	end

	def print_submit
		status = 'failed'
		err_count = 0

		param = params[:params]

		order_id = param[:order_id]
		ids = param[:ids].to_s.split(',')
		prices = param[:prices].to_s.split(',')
		item_totals = param[:item_totals].to_s.split(',')
		status = param[:statuses].to_s.split(',')
		discount = param[:discount].to_f
		discounted_amount = param[:discounted_amount].delete(' ').to_f.abs
		grand_total = param[:grand_total].to_f

		for i in 0..ids.length - 1
			@orderItem = OrderItem.find(ids[i])
			unless @orderItem.update_attributes(amount: item_totals[i].to_f, item_amount: prices[i].to_f, status_id: status[i].to_i)
				err_count += 1
			end
		end

		unless err_count > 0
			@order = Order.find(order_id)
			if @order.update_attributes(discount: discount, discounted_amount: discounted_amount, grand_total: grand_total, order_status_id: 2)
				status = 'success'
			end
		end
		
		render json: { status: status }
	end

	def print
	end
end
