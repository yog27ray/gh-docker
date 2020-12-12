cd ~
mkdir - .config/gh
if [[ "$token" == "" || "$user" == "" ]]; then
    exit 0;
fi
if [[ "$protocol" == "" ]]; then
  protocol='https'
fi
echo "github.com:" > hosts.yml
echo "    oauth_token: $token" >> hosts.yml
echo "    git_protocol: $protocol" >> hosts.yml
echo "    user: $user" >> hosts.yml
