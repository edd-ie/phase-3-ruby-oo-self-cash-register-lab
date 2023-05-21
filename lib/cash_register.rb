class CashRegister
    attr_accessor :discount, :total,  :title
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @title = []
        @price = []
    end
    def total=(val)
        @total = val
    end

    def add_item(title, price, quantity=1)
        self.total += (price * quantity)
        
        quantity.times{@title.push(title)}
        @price.push(price)
    end

    def apply_discount
        if (@discount == 0)
            return "There is no discount to apply."
        end
        self.total -= (@total * (@discount.to_f/100))
        return "After the discount, the total comes to $#{@total.to_i}."
    end
    
    def items
        @title
    end

    def void_last_transaction        
        return (@price.length == 1) ? (@price.pop; self.total = 0.0) : 
            (@total -= @price.pop)
    end
end