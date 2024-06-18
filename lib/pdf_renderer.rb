require "prawn"

ActionController::Renderers.add :pdf do |filename, options|
  pdf = Prawn::Document.new
  pdf.text render_to_string(options)
  puts "Rendered #{filename}.pdf"
  send_data(pdf.render, filename: "#{filename}.pdf", disposition: "attachment")
end
