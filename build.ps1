Remove-Item .\_site -Recurse -Force
DocFxTocGenerator -d ./en
DocFxTocGenerator -d ./zh
docfx build
docfx serve