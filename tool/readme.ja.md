
# クロスコンパイル、シングルバイナリのためのcbrotli

googleによる[brotli](https://github.com/google/brotli)のファイルを[tool/update.sh](https://github.com/y9o/cbrotli/blob/main/tool/update.sh)でコピーしました。

現在オフィシャルのbrotli-v1.2.0はスタティックリンクに対応していないようです。

- https://github.com/mattn/go-sqlite3
- https://github.com/DataDog/zstd

と同じようにbrotliを使いたかった。

# 使い方

```golang
import "github.com/google/brotli/go/cbrotli"
```
を
```golang
import "github.com/y9o/cbrotli"
```
に書き換えるだけ。

