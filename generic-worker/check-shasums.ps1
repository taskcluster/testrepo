function get-sha256 {
  param($file);[system.bitconverter]::tostring([System.Security.Cryptography.sha256]::create().computehash([system.io.file]::openread((resolve-path $file)))) -replace "-",""
}

$sha = get-sha256 my-task-caches/devtools-app/index.html
if ($sha -ne "d75c26a5bb47c4786ef15819d894e0e4e61829ee177b941e25b46f0de66d8148") {
  "Wrong hash for my-task-caches/devtools-app/index.html: ${sha}"
  exit 64
}

$sha = get-sha256 my-task-caches/mozharness/mozharness/configs/beetmover/l10n_changesets.tmpl
if ($sha -ne "29d3f3c2822c48770bc77dfd9965bec4676c9902f182796eac6fac5c986540e0") {
  "Wrong hash for my-task-caches/mozharness/mozharness/configs/beetmover/l10n_changesets.tmpl: ${sha}"
  exit 64
}

$sha = get-sha256 my-task-caches/mozharness/mozharness/configs/builds/releng_sub_linux_configs/32_debug.py
if ($sha -ne "5d6977130018253e9c655e95b4abeb4f6f7c1deac989032b22a77a6a2f5605bc") {
  "Wrong hash for my-task-caches/mozharness/mozharness/configs/builds/releng_sub_linux_configs/32_debug.py: ${sha}"
  exit 64
}

$sha = get-sha256 my-task-caches/tomatoes/mozharness/docs/gaia_integration.rst
if ($sha -ne "7cacc851d921716497bbd3d35134fa8ab34e6c5ae072954fae89b20f2977fc44") {
  "Wrong hash for my-task-caches/tomatoes/mozharness/docs/gaia_integration.rst: ${sha}"
  exit 64
}

$sha = get-sha256 my-task-caches/tomatoes/mozharness/unit.sh
if ($sha -ne "4bb5b3476d844fa4d27fcff48bc8b24990f907e68637dab5abfe1d8d72ccd6f0") {
  "Wrong hash for my-task-caches/tomatoes/mozharness/unit.sh: ${sha}"
  exit 64
}

"All SHA values are correct"
