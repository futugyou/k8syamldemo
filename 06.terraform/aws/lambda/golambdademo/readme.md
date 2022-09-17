```
go.exe install github.com/aws/aws-lambda-go/cmd/build-lambda-zip@latest
set GOOS=linux
set GOARCH=amd64
set CGO_ENABLED=0
go build -o main main.go
%USERPROFILE%\Go\bin\build-lambda-zip.exe -o main.zip main
```