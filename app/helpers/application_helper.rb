module ApplicationHelper

  # @Ref: https://stackoverflow.com/questions/24338143/rails-4-flash-as-key-value-pair-error
  # Ref description: guide on how to create flash alert helper
  # flash alert helper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
end
