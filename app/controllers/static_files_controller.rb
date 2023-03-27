class StaticFilesController < ApplicationController
  def serve
    file_path = Rails.root.join('public', params[:file_name])
    extension = File.extname(params[:file_name])

    case extension
    when '.wasm'
      content_type = 'application/wasm'
    when '.data'
      content_type = 'application/octet-stream'
    when '.framework.js'
      content_type = 'application/javascript'
    when '.loader.js'
      content_type = 'application/javascript'
    else
      raise ActionController::RoutingError.new('Not Found')
    end

    send_file(file_path, filename: params[:file_name], disposition: 'inline', type: content_type)
  end
end
