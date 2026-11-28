# Calendar integration

## Setup

```bash
secret-tool store \
  --label="My synced calendar" \
  service mycalendarimport \
  username next
vdirsyncer discover
vdirsyncer sync
```
