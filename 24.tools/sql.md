### SQL Server Session Count
```
SELECT DEC.session_id, DEC.protocol_type, DEC.auth_scheme,
  DES.login_name, DES.login_time
FROM sys.dm_exec_sessions AS DES
  JOIN sys.dm_exec_connections AS DEC
    ON DEC.session_id = DES.session_id;
```
