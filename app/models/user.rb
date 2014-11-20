class User
  include Guacamole::Model

  attribute :github_uid, String
  attribute :github_token, String
  attribute :name, String
  attribute :login, String
  attribute :avatar_url, String
  attribute :repositories, Array[Repository]
  # attribute :followings, Array[User]

  validate :login, presence: true
  validate :github_uid, presence: true
  validate :github_token, presence: true

  callbacks :user_callbacks

  def github_importer
    @github_importer ||= GithubImporter.new self
  end
end
