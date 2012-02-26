module ApplicationHelper
  def format_fecha(fecha)
    fecha.strftime('%d/%m/%Y') unless fecha.blank?
  end
end
