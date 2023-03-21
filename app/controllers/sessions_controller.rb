class SessionsController < Clearance::SessionsController
  def destroy
    sign_out
    render json: {signed_out: "yes"}
  end
end
