require './data'
require 'csv'
require 'hashie'

Plans = Hashie::Mash.new(plans)

def Plans.plans
  self.planList&.map { |p| Plan&.new(p) }
end

def Plans.to_csv
  CSV.generate do |csv|
    csv << self.plans.first.headers
    self.plans.map do |plan|
      csv << plan.to_row
    end
  end
end

class Plan < Hashie::Mash
  def name
    self.PlanLevelFullDesc
  end

  def network
    self.BenefitVO.NetworkName
  end

  def copay
    self.BenefitVO.CopayAmtDesc
  end

  def in_deductible
    self.BenefitVO.InNetDeductibleDesc
  end

  def in_coins
    self.BenefitVO.InNetCoInsPercentValueDesc
  end

  def in_moop
    self.BenefitVO.InNetMOOP
  end

  def out_deductible
    self.BenefitVO.OutNetDeductibleDesc
  end

  def out_coins
    self.BenefitVO.OutNetCoInsPercentValueDesc
  end

  def out_moop
    self.BenefitVO.OutNetMOOP
  end

  def single
    self.SingleRateForQuickQuote
  end

  def pharamacy
    self.BuyUpVO&.find { |vo| vo&.BuyupTypeDesc == "Pharmacy Rider" }&.BuyupDisplayName
  end

  def headers
    %i(single network copay in_deductible in_coins in_moop out_deductible out_coins out_moop pharamacy name)
  end

  def to_row
    [single, network, copay, in_deductible, in_coins, in_moop, out_deductible, out_coins, out_moop, pharamacy, name]
  end
end
