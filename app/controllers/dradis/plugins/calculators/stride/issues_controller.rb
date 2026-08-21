module Dradis::Plugins::Calculators::STRIDE
  class IssuesController < ::IssuesController
    before_action only: :edit

    skip_before_action :remove_unused_state_param

    def edit
      @issue_fields = Dradis::Plugins::Calculators::STRIDE::V1::FIELDS.map do |field|
        value = @issue.fields[field]
        value = 'No' unless value == 'Yes'
        "#[#{field}]#\n#{value}"
      end.join("\n\n")
    end

    def update
      raw = params[:stride_fields].to_s
      stride_fields = Hash[*raw.scan(FieldParser::FIELDS_REGEX).flatten.map(&:strip)]

      stride_fields.each do |name, value|
        @issue.set_field(name, value)
      end

      if @issue.save
        redirect_to main_app.project_issue_path(current_project, @issue), notice: 'STRIDE fields updated.'
      else
        render :edit
      end
    end
  end
end
