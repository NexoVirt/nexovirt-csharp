# NexoVirt SDK for .NET / C#

Official .NET client for the [NexoVirt](https://nexovirt.com) REST API — a clean,
token-authenticated API over Proxmox VE for managing hosts, guests (KVM VMs + LXC
containers), plans, IPAM, firewall, snapshots and more.

- **Docs:** [NexoVirt REST API reference](https://docs.nexovirt.com/api)
- **What is NexoVirt:** a self-hosted control panel and REST API for Proxmox VE — [nexovirt.com](https://nexovirt.com)

Generated from the NexoVirt [OpenAPI specification](https://docs.nexovirt.com/api), so it
always matches the live API. Targets `net8.0`. See [Regenerating](#regenerating) below.

## Install

```bash
dotnet add package NexoVirt.Sdk
```

## Quick start

Create an API token in your panel under **Settings → API tokens**, then point the client at
your panel's `/api/v1` base URL:

```csharp
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;

var config = new Configuration
{
    BasePath    = "https://your-panel.example/api/v1",
    AccessToken = "YOUR_TOKEN", // Bearer token from Settings -> API tokens
};

var hosts  = new HostsNodesApi(config);
var guests = new GuestsApi(config);

var allHosts = hosts.ListHosts();           // every Proxmox host
var list     = guests.ListGuests(hostId: 1); // guests on host 1
Console.WriteLine(list.Data);
```

Every response uses the NexoVirt envelope `{ success, data, error }`; list endpoints add
`meta: { page, perPage, total }`.

## Authentication

All requests send `Authorization: Bearer <token>`. Tokens can be host-scoped, IP-allowlisted
and rate-limited in the panel. A scoped token gets `403` on any host it may not touch.

## Regenerating

This SDK is generated with [OpenAPI Generator](https://openapi-generator.tech):

```bash
./scripts/regenerate.sh
```

## License

MIT — see [LICENSE](./LICENSE).
