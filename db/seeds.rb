# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user=User.create!(:email=>'admin@test.com' ,:password=>'password', :admin=>1)
user=User.create!(:email=>'test1@test.com' ,:password=>'password')
user=User.create!(:email=>'test2@test.com' ,:password=>'password')
user=User.create!(:email=>'test3@test.com' ,:password=>'password')
user=User.create!(:email=>'test4@test.com' ,:password=>'password')
order=Order.create!()
order=Order.create!()
order=Order.create!()
order=Order.create!()
order=Order.create!()
orderItem=OrderItem.create!(:book_id=> 1, :order_id=> 1, :bookQuantity=> 1)
orderItem=OrderItem.create!(:book_id=> 2, :order_id=> 1, :bookQuantity=> 2)
orderItem=OrderItem.create!(:book_id=> 3, :order_id=> 2, :bookQuantity=> 3)
orderItem=OrderItem.create!(:book_id=> 4, :order_id=> 3, :bookQuantity=> 4)
orderItem=OrderItem.create!(:book_id=> 5, :order_id=> 4, :bookQuantity=> 5)
orderItem=OrderItem.create!(:book_id=> 6, :order_id=> 5, :bookQuantity=> 6)
invoice=Invoice.create!(:order_id=> 1, :user_id=> 1)
invoice=Invoice.create!(:order_id=> 2, :user_id=> 2)
invoice=Invoice.create!(:order_id=> 3, :user_id=> 3)
invoice=Invoice.create!(:order_id=> 4, :user_id=> 4)
invoice=Invoice.create!(:order_id=> 5, :user_id=> 5)