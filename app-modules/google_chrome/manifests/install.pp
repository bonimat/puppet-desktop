class google_chrome::install() inherits google_chrome::params {
  package { "google-chrome-stable":,
    ensure => $google_chrome::params::ensure,
  }
}
