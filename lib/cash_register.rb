class CashRegister
  attr_accessor :total, :discount, :items, :previous_total, :previous_items
  attr_reader :add_item, :apply_discount, :void_last_transaction

  def initialize(discount = 0)
    @total = 0.0
    @previous_total = 0.0
    @discount = discount
    @items = []
    @previous_items = []
  end

  def add_item(title, price, quantity = 1)
    self.previous_total = self.total
    self.total += price * quantity
    self.previous_items = self.items[0 .. -1]
    self.items.concat([title] * quantity)
  end

  def apply_discount
    self.total -= self.total * self.discount / 100
    self.discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{self.total.to_i}."
  end

  def void_last_transaction
    self.total = self.previous_total
    self.items = self.previous_items[0 .. -1]
    self.total == 0.0 ? self.total : self.previous_total
  end

end
