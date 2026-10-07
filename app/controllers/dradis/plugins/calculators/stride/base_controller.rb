module Dradis::Plugins::Calculators::STRIDE
  class BaseController < ActionController::Base
    def index
      @stride_values = V1.values({})
      @issue_fields = V1.values_to_source(@stride_values)
    end

    # Returns the source text with the STRIDE fields set from the switches
    def source
      render plain: V1.values_to_source(params.fetch(:values, {}).permit(*V1::FIELDS))
    end
  end
end
