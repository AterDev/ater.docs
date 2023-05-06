if (test-path .\local) {
  Remove-Item .\local -Recurse -Force
}
DocFxTocGenerator -d ./zh/ater.web  -r -g -s
DocFxTocGenerator -d ./zh/droplet  -r -g -s
docfx build .\zh\docfx-local.json

Remove-Item .\local\styles\*.map -Force

scp -r .\local\** dev:/var/www/docs