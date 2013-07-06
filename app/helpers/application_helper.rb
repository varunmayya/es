module ApplicationHelper
  def yield_for(content_sym, default)
      pre_output = content_for(content_sym)
      output = content_for(content_sym).to_s + ' - EventScene India'
      output = default if pre_output.blank?
      output 
    end
end
