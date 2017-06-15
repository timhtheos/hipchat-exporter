# Get user info.
tmp_user=$(wget -O - "https://api.hipchat.com/v2/user/$user?auth_token=$auth")
echo $tmp | jq '.' > $user.json
