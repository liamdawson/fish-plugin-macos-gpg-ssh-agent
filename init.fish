set -x GPG_TTY (tty)

if set -q SSH_AUTH_SOCK
  if set -q XDG_RUNTIME_DIR
    set gpg_ssh_auth_sock "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
  else
    set gpg_ssh_auth_sock "$HOME/.gnupg/S.gpg-agent.ssh"
  end

  if string match -qir -- "com.apple.launchd" $SSH_AUTH_SOCK
    set -gx SSH_AUTH_SOCK $gpg_ssh_auth_sock
  end
end
