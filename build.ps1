Remove-Item .\_site -Recurse -Force
DocFxTocGenerator -d ./zh/ater.web  -r
DocFxTocGenerator -d ./zh/droplet  -r

# docfx build

# 中文
docfx build .\zh\docfx-zh.json
# Move-Item .\_site\zh-tmp\zh .\_site\zh
# Remove-Item .\_site\zh-tmp\ -Recurse -Force


# 英文
docfx build .\en\docfx-en.json
# Move-Item .\_site\en-tmp\en .\_site\en
# Remove-Item .\_site\en-tmp\ -Recurse -Force


Remove-Item .\_site\zh\styles\*.map -Force

Copy-Item .\src\index.html .\_site\
# Remove-Item .\_site\en\styles\*.map -Force
docfx serve