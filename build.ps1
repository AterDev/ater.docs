Remove-Item .\_site -Recurse -Force
# generate TOC
DocFxTocGenerator -d ./zh/ater.web  -r -g
DocFxTocGenerator -d ./zh/droplet  -r -g

DocFxTocGenerator -d ./en/ater.web  -r -g
DocFxTocGenerator -d ./en/droplet  -r -g

# docfx build
docfx build .\zh\docfx-zh.json
docfx build .\en\docfx-en.json

Remove-Item .\_site\zh\styles\*.map -Force
Remove-Item .\_site\en\styles\*.map -Force

Copy-Item .\src\index.html .\_site\
