AccessCategory.create!([
	{ description: 'Order' }
])

Access.create!([
	{ access_category_id: 1, description: 'List', url: '/admin/orders' },
	{ access_category_id: 1, description: 'New', url: '/admin/orders/new' },
])