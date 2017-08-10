module UsersHelper
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def experimenter?(experiment)
    return true if current_user.id == experiment.lab_staff.id
    false
  end

  def pi?(experiment)
    return true if current_user.id == experiment.proposal.pi.id
    false
  end
end
