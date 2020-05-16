#configure conf.toml for database
echo ""\"DbUser\""" = "\"$(cd ../infra && terraform output db_user)\"" > conf.toml
echo ""\"DbPassword\""" = "\"$(cd ../infra && terraform output db_pass)\"" >> conf.toml
echo ""\"DbName\""" = "\"$(cd ../infra && terraform output db_name)\"" >> conf.toml
echo ""\"DbPort\""" = "\"$(cd ../infra && terraform output db_port)\"" >> conf.toml
echo ""\"DbHost\""" = "\"$(cd ../infra && terraform output db_address)\"" >> conf.toml
echo ""\"ListenHost\"""" = "\"0.0.0.0\""" >> conf.toml
echo ""\"ListenPort\"""" = "\"80\""""" >> conf.toml

