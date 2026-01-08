# logging functions for zsh scripts
log_info() {
  echo -e "\033[34mℹ️ $1\033[0m"
}

log_warning() {
  echo -e "\033[33m⚠️ $1\033[0m"
}

log_error() {
  echo -e "\033[31m❌ $1\033[0m"
}

log_success() {
  echo -e "\033[32m✅ $1\033[0m"
}
