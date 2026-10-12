module Dradis::Plugins::Calculators::STRIDE
  class FieldsController < ActionController::Base
    # Returns the source text with the STRIDE fields set from the switches
    def index
      render plain: V1::Fields.values_to_source(values_params)
    end

    private

    def values_params
      params.fetch(:values, {}).permit(*V1::Fields::FIELDS.keys)
    end
  end
end
