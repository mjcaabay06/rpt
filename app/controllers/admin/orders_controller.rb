class Admin::OrdersController < Admin::ApplicationController

	def index
		@orders = Order.order("order_date desc").paginate(:per_page => 10, :page => params[:page])
	end

	def new
	end

	def create
		data = []
		status = 'failed'

		begin
			param = params[:params]
			clientName = param[:name]
			orderDate = param[:date]
			itemName = param[:itemName].to_s.split(',')
			itemQty = param[:itemQty].to_s.split(',')

			
			order = Order.new(name: clientName, order_date: orderDate, user_id: 1)

			if order.save
				orderId = order.id

				for i in 0..itemName.length - 1
					data << { order_id: orderId, item: itemName[i].to_s, quantity: itemQty[i] }
				end

				orderItem = OrderItem.create!([ data ])

				if orderItem
					status = 'success'
				end
			end

			render json: { status: status }
		rescue => error
			raise "#{$!.message}"
		end
	end

	def successful
	end

	def get_order_items
		@orderItem = OrderItem.where("order_id = ?", params[:id]).order("id")

		respond_to do |format|
			format.html { render action: "_order_items", layout: false }
		end
	end
end
