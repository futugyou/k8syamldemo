### [install](https://docs.microsoft.com/zh-cn/dotnet/core/diagnostics/dotnet-counters) 
```
dotnet tool install --global dotnet-counters
```

### System.Runtime Counter
```
dotnet-counters monitor -n websample --refresh-interval 1
```

### Microsoft.AspNetCore.Hosting Counter
```
dotnet-counters monitor -n websample --refresh-interval 1 --counters Microsoft.AspNetCore.Hosting
dotnet-counters monitor -n websample --refresh-interval 1 --counters Microsoft.AspNetCore.Hosting[total-requests,requests-per-second]
```

### Microsoft.AspNetCore.Http.Connections Counter
```
dotnet-counters monitor -n BlazorAppDemo --refresh-interval 1 --counters Microsoft.AspNetCore.Http.Connections
```

### Microsoft-AspNetCore-Server-Kestrel Counter
```
dotnet-counters monitor -n BlazorAppDemo --refresh-interval 1 --counters Microsoft-AspNetCore-Server-Kestrel
```

### System.Net.Http Counter
```
dotnet-counters monitor -n websample --counters System.Net.Http
``` 

### System.Net.NameResolution  DNS Counter
```
dotnet-counters monitor -n websample --refresh-interval 1 --counters System.Net.NameResolution
```

### System.Net.Security Counter
```
dotnet-counters monitor -n websample --refresh-interval 1 --counters System.Net.Security
```

### System.Net.Sockets Counter
```
dotnet-counters monitor -n websample --refresh-interval 1 --counters System.Net.Sockets
```
