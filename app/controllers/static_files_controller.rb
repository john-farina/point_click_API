class StaticFilesController < ApplicationController
  def serve
    file_path = File.join(Rails.public_path, params[:file_name])

    if File.exist?(file_path) && !File.directory?(file_path)
      send_file file_path, disposition: 'inline'
    else
      render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    end
  end
end
