
# cbrotli for Cross-Compilation and Single Binary Builds

This repository provides a customized setup of [Brotli](https://github.com/google/brotli) for cross-compilation and single binary builds.

The Brotli source files from Google's official repository have been copied using the [tool/update.sh](https://github.com/y9o/cbrotli/blob/main/tool/update.sh) script.

As of now, the official Brotli v1.2.0 release does not appear to fully support static linking.

The goal of this project is to enable the use of Brotli in a manner similar to the following Go packages:

* [mattn/go-sqlite3](https://github.com/mattn/go-sqlite3)
* [DataDog/zstd](https://github.com/DataDog/zstd)

---

## Usage

To use `cbrotli` in your Go project, replace the original Brotli import path:

```go
import "github.com/google/brotli/go/cbrotli"
```

with:

```go
import "github.com/y9o/cbrotli"
```

No other code changes are required. Your existing Brotli-based compression and decompression code should work as-is, with the added benefit of static linking support.

---

## License

This project includes source files from [Google’s Brotli](https://github.com/google/brotli), which is licensed under the MIT License.
See the original repository for details.

---
