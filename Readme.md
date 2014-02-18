Packer scripts for setting up VMs I use for personal development.

Packer and a Digital Ocean account are required. Set the `DO_CLIENT_ID` and
`DO_API_KEY` env vars as well as the `NEW_RELIC_LICENSE` env var before
building.

Then:

```
./build.sh
```

It will spin up a DO machine and then snapshot it as an image available in the
SF region.
