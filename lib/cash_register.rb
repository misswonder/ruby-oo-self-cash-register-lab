class CashRegister
    attr_reader :discount, :items
    attr_accessor :total

 def initialize (discount = nil)
    @total = 0
    @discount = discount 
    @items = []
 end

 def add_item(title, price, quantity = 1)
    @total = @total + price * quantity 
    quantity.times do 
        @items.push(title)
    end 
    @last_transaction = [title, price, quantity]
 end 

 def apply_discount 
    if @discount.nil?
        "There is no discount to apply."
    else  
        @total = (@total * (1 - @discount/100.0)).to_i
        "After the discount, the total comes to $#{@total}."
    end     
 end 

 def void_last_transaction
    last_title, last_price, last_quantity = @last_transaction
    @total = @total - last_price * last_quantity
    # last_quantity.times do
    #     @items.pop
    # end
    #@items.slice!(@items.length - last_quantity, last_quantity)
 end 
end 