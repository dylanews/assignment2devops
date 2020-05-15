#configure conf.toml for database
echo ""dbuser: "\"$(cd ../infra && terraform output db_user)\"" >> conf.toml
echo ""dbpassword: "\"$(cd ../infra && terraform output db_pass)\"" >> conf.toml
echo ""dbendpoint: "\"$(cd ../infra && terraform output db_endpoint)\"" >> conf.toml
