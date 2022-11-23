
## Endpoints

### Flutter

To fetch the latest Flutter: http://192.168.1.11:8088/repository/google-flutter-releases/stable/windows/flutter_windows_3.0.5-stable.zip

### k0s

Fetch k0s binary through local cache server

```
#!/usr/bin/env sh
 
version="v0.7.0"
arch="amd64"
curl -L http://192.168.1.11:8088/repository/raw-github-k0s-proxy/$version/k0s-$version-$arch --output k0s
```

