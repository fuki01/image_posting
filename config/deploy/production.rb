server "54.150.213.179", user: "fuki", roles: %w{app db web}

set :ssh_options, {
  keys: %w(~/.ssh/animalbox_app.pem),
  forward_agent: true,
  auth_methods: %w(publickey),
}