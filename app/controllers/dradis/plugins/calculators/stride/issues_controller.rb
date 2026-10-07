module Dradis::Plugins::Calculators::STRIDE
  class IssuesController < ::IssuesController
    skip_before_action :remove_unused_state_param

    def edit
      @stride_values = V1.values(@issue.fields)
      @issue_fields = V1.values_to_source(@stride_values)
    end

    def update
      V1.source_to_values(params[:stride_fields]).each do |name, value|
        @issue.set_field(name, value)
      end

      if @issue.save
        redirect_to main_app.project_issue_path(current_project, @issue), notice: 'STRIDE fields updated.'
      else
        @stride_values = V1.values(@issue.fields)
        @issue_fields = V1.values_to_source(@stride_values)
        render :edit
      end
    end
  end
end
