if (test-path .\_site) {
  Remove-Item .\_site -Recurse -Force
}
# generate TOC
DocFxTocGenerator -d ./zh/dry  -r -g -s
DocFxTocGenerator -d ./en/dry  -r -g -s

# docfx build
docfx build .\zh\docfx-zh.json
docfx build .\en\docfx-en.json

Remove-Item .\_site\zh\public\*.map -Force
Remove-Item .\_site\en\public\*.map -Force

Copy-Item .\src\index.html .\_site\


docfx serve .\_site