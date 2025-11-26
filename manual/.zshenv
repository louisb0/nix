# Environment variables
. "/home/louis/.nix-profile/etc/profile.d/hm-session-vars.sh"

# Only source this once
if [[ -z "$__HM_ZSH_SESS_VARS_SOURCED" ]]; then
  export __HM_ZSH_SESS_VARS_SOURCED=1
  
fi

ZSH="/nix/store/hrm88p6aaq42rmxvv2ra824x1wy1cyq8-oh-my-zsh-2025-05-24/share/oh-my-zsh";
ZSH_CACHE_DIR="/home/louis/.cache/oh-my-zsh";
