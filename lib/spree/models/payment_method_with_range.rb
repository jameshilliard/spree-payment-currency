module Spree::Models::PaymentMethodWithCurrency
  def self.included(target)
    target.preference :allowable_currency, :string, :default => "ALL"
  end
  
  def available?(order)
    begin
      return true if self.allowable_currency == "ALL"
    
      (self.allowable_currency != "ALL" ? order.currency == self.allowable_currency : true)
    rescue NoMethodError => error
      true
    end  
  end
end