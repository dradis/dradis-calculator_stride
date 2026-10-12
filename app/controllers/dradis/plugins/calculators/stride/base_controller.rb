module Dradis::Plugins::Calculators::STRIDE
  class BaseController < ActionController::Base
    def index
      @stride_values = V1::Fields.values({})
      @issue_fields = V1::Fields.values_to_source(@stride_values)
    end
  end
end
