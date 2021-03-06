class UserCallbacks
  include Guacamole::Callbacks

  after_save :import_followings

  def import_followings
    if object.first_signup? || object.needs_reimport?
      object.current_import_job = GithubImportWorker.perform_async :followings, object.key
    end
  end
end
