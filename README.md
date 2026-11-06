# Unixirun System Report

A small, read-only Bash tool that displays a system summary on macOS and Linux.
Built as a beginner-friendly GitHub portfolio project for Unixirun.

## Features

- Operating system, CPU architecture and kernel version
- Total RAM reported by the OS (not current memory usage)
- Uptime and root filesystem capacity
- Optional plain-text report; existing files are never overwritten
- No downloads, network requests, sudo, or external packages
- Does not intentionally collect usernames, hostnames, IPs, or serial numbers

## Run

Open Terminal inside the project folder:

```bash
bash system-report.sh
```

Save a report to a new file:

```bash
bash system-report.sh --save report.txt
```

Paths containing spaces must be quoted. To save another report, choose a new filename.

## Requirements and scope

Bash 3.2 or newer, standard system utilities, and macOS or Linux. Linux requires
`/proc/meminfo`. Runs in a container describe the environment visible to that
container and may not reflect its resource limits. Disk usage describes the root
filesystem, not every physical disk. This is a summary, not a hardware diagnosis
or security audit. Review reports before sharing them.

## Validation

Validated on Linux: Bash syntax, live report, saving to a path with spaces,
overwrite protection, help, and invalid arguments. The macOS branch uses standard
macOS commands but has not been run on a real Mac during development. macOS
validation is a useful first contribution.

## Publish on GitHub

1. Extract the ZIP on your computer.
2. Create a repository named `unixirun-system-report` on GitHub.
3. Select **Add file → Upload files**.
4. Upload the files **inside** the extracted project folder, including this README
   and LICENSE. Do not upload only the ZIP.
5. Select **Commit changes**.

Suggested repository description:

`A lightweight Bash system report tool for macOS and Linux.`

## راهنمای فارسی

این پروژه اطلاعات کلی مک و لینوکس را در ترمینال نشان می‌دهد. برنامه تغییری در
تنظیمات سیستم ایجاد نمی‌کند؛ فقط با گزینهٔ `--save` یک فایل گزارش می‌نویسد.

فایل ZIP را از حالت فشرده خارج کن. در ترمینال وارد پوشهٔ پروژه شو و اجرا کن:

```bash
bash system-report.sh
```

برای ذخیرهٔ خروجی:

```bash
bash system-report.sh --save report.txt
```

اگر فایل از قبل وجود داشته باشد، برنامه آن را بازنویسی نمی‌کند. برای انتشار در
گیت‌هاب، یک ریپازیتوری جدید بساز و فایل‌های داخل پوشه را با **Upload files**
بارگذاری کن. قبل از ارائهٔ خدمات به مشتری، کد و خروجی را روی دستگاه خودت بررسی کن.

## Future improvements

- Add optional JSON output
- Add separate Linux and macOS CI checks
- Add configurable disk-space alerts

## License

MIT. See LICENSE.
