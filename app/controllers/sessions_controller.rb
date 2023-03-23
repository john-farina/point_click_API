class SessionsController < Clearance::SessionsController
  def destroy
    sign_out
    redirect_to root_path
  end
end
