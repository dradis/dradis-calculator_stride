module Dradis::Plugins::Calculators::STRIDE
  class BaseController < ActionController::Base
    def index
      @issue_fields = Dradis::Plugins::Calculators::STRIDE::V1::FIELDS.map do |field|
        "#[#{field}]#\nN/A"
      end.join("\n\n")
    end
  end
end
