import-module -Name C:\Windows\System32\WindowsPowerShell\v1.0\Modules\Microsoft.PowerShell.Management -verbose

function get-sha256 {
  param($file);[system.bitconverter]::tostring([System.Security.Cryptography.sha256]::create().computehash([system.io.file]::openread((resolve-path $file)))) -replace "-",""
}

$sha = get-sha256 my-task-caches\devtools-app\index.html
if ($sha -ne "d75c26a5bb47c4786ef15819d894e0e4e61829ee177b941e25b46f0de66d8148") {
  "Wrong hash for my-task-caches\devtools-app\index.html: ${sha}"
  exit 64
}

$sha = get-sha256 my-task-caches\mozharness\mozharness\configs\beetmover\l10n_changesets.tmpl
if ($sha -ne "29d3f3c2822c48770bc77dfd9965bec4676c9902f182796eac6fac5c986540e0") {
  "Wrong hash for my-task-caches\mozharness\mozharness\configs\beetmover\l10n_changesets.tmpl: ${sha}"
  exit 64
}

$sha = get-sha256 my-task-caches\mozharness\mozharness\configs\builds\releng_sub_linux_configs\32_debug.py
if ($sha -ne "5d6977130018253e9c655e95b4abeb4f6f7c1deac989032b22a77a6a2f5605bc") {
  "Wrong hash for my-task-caches\mozharness\mozharness\configs\builds\releng_sub_linux_configs\32_debug.py: ${sha}"
  exit 64
}

$sha = get-sha256 my-task-caches\unknown_issuer_app_1\icon-128.png
if ($sha -ne "fe9b35abf46f21c12e4128c84581d7d37344cb6c38e77efd5aecd4b71070847d") {
  "Wrong hash for my-task-caches\unknown_issuer_app_1\icon-128.png: ${sha}"
  exit 64
}

$sha = get-sha256 my-task-caches\unknown_issuer_app_1\META-INF\MANIFEST.MF
if ($sha -ne "5d69946fde205a38d48a1920f17a19eb8306d160953c22c7b7c448804c35c610") {
  "Wrong hash for my-task-caches\unknown_issuer_app_1\META-INF\MANIFEST.MF: ${sha}"
  exit 64
}

"All SHA values are correct"

[io.file]::WriteAllText("my-task-caches\devtools-app\foo.bar","dummy file")

"Add file foo.bar to devtools-app cache."
