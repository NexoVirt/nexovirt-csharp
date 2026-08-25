# NexoVirt.Sdk.Api.GuestsApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**AssignGuestIp**](GuestsApi.md#assignguestip) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/ips | Assign an IP to the guest |
| [**CreateGuest**](GuestsApi.md#createguest) | **POST** /hosts/{hostId}/guests | Create a guest (async) |
| [**CreateSnapshot**](GuestsApi.md#createsnapshot) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/snapshots | Create a snapshot |
| [**DeleteGuest**](GuestsApi.md#deleteguest) | **DELETE** /hosts/{hostId}/guests/{type}/{vmid} | Delete a guest |
| [**DeleteSnapshot**](GuestsApi.md#deletesnapshot) | **DELETE** /hosts/{hostId}/guests/{type}/{vmid}/snapshots/{name} | Delete a snapshot |
| [**GetGuest**](GuestsApi.md#getguest) | **GET** /hosts/{hostId}/guests/{type}/{vmid} | Get guest detail |
| [**GetGuestIpFilter**](GuestsApi.md#getguestipfilter) | **GET** /hosts/{hostId}/guests/{type}/{vmid}/ipfilter | Anti-spoof IP filter status |
| [**GetGuestUsage**](GuestsApi.md#getguestusage) | **GET** /hosts/{hostId}/guests/{type}/{vmid}/usage | Guest CPU/mem/disk/net time series |
| [**ListGuestEvents**](GuestsApi.md#listguestevents) | **GET** /hosts/{hostId}/guests/{type}/{vmid}/events | Guest activity log |
| [**ListGuestIps**](GuestsApi.md#listguestips) | **GET** /hosts/{hostId}/guests/{type}/{vmid}/ips | List the guest&#39;s assigned IPs |
| [**ListGuests**](GuestsApi.md#listguests) | **GET** /hosts/{hostId}/guests | List guests |
| [**ListSnapshots**](GuestsApi.md#listsnapshots) | **GET** /hosts/{hostId}/guests/{type}/{vmid}/snapshots | List guest snapshots |
| [**PowerGuest**](GuestsApi.md#powerguest) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/power | Power action |
| [**ReinstallGuest**](GuestsApi.md#reinstallguest) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/reinstall | Reinstall a guest (async) |
| [**ResizeGuest**](GuestsApi.md#resizeguest) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/resize | Resize cores, memory, and/or a disk |
| [**RollbackSnapshot**](GuestsApi.md#rollbacksnapshot) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/snapshots/{name}/rollback | Roll back to a snapshot |
| [**SetGuestIpFilter**](GuestsApi.md#setguestipfilter) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/ipfilter | Toggle the anti-spoof IP filter |
| [**SetGuestIpconfig**](GuestsApi.md#setguestipconfig) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/ipconfig | Set the guest&#39;s network configuration |
| [**SetGuestPassword**](GuestsApi.md#setguestpassword) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/password | Reset the guest&#39;s root password |
| [**UnassignGuestIp**](GuestsApi.md#unassignguestip) | **DELETE** /hosts/{hostId}/guests/{type}/{vmid}/ips | Unassign an IP from the guest |

<a id="assignguestip"></a>
# **AssignGuestIp**
> Envelope AssignGuestIp (int hostId, string type, int vmid, AssignGuestIpRequest assignGuestIpRequest)

Assign an IP to the guest

Binds an unassigned IP address row (`ip_id`) to the guest and re-syncs the anti-spoof allow-list. The IP must belong to the same host.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class AssignGuestIpExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var assignGuestIpRequest = new AssignGuestIpRequest(); // AssignGuestIpRequest | 

            try
            {
                // Assign an IP to the guest
                Envelope result = apiInstance.AssignGuestIp(hostId, type, vmid, assignGuestIpRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.AssignGuestIp: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the AssignGuestIpWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Assign an IP to the guest
    ApiResponse<Envelope> response = apiInstance.AssignGuestIpWithHttpInfo(hostId, type, vmid, assignGuestIpRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.AssignGuestIpWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **assignGuestIpRequest** | [**AssignGuestIpRequest**](AssignGuestIpRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Assigned (reboot to apply). |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **409** | Already assigned. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="createguest"></a>
# **CreateGuest**
> CreateGuest200Response CreateGuest (int hostId, GuestCreateRequest guestCreateRequest)

Create a guest (async)

Creates a QEMU VM or an LXC container. Creation is asynchronous: this call validates the request, enqueues a provisioning job, and returns immediately with `{ queued: true, job_id, vmid }`. Poll `GET /hosts/{hostId}/jobs/{jobId}` until `data.status` is `done` or `failed`. The same executor that backs the web wizard runs the actual PVE work, so the guest's plan, template, IP source, and disks are applied exactly as they would be from the panel.  A plan (`plan_id`) fills and locks `cores`, `memory_mb`, and `disk_gb`; otherwise supply them explicitly (defaults 1 core, 512 MB, 8 GB). `password` is required unless at least one SSH key is present (via `ssh_keys[]` or an `owner_id` with stored keys). QEMU requires `os_template` as `tpl:<id>` from `GET /hosts/{hostId}/os-templates`. LXC requires exactly one template source, either `lxc_template_id` (from the `managed` list) or `os_template` as a raw volid (from the `available` list). `ip_source` is `dhcp` (default) or `zone:<id>` (from `GET /hosts/{hostId}/ip-zones`) to allocate a static IP. `extra_storage[]`, `extra_size[]`, and `extra_mount[]` are parallel arrays describing additional disks; LXC mounts must be absolute paths and default to `/mnt/disk<N>` when blank. 

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class CreateGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var guestCreateRequest = new GuestCreateRequest(); // GuestCreateRequest | 

            try
            {
                // Create a guest (async)
                CreateGuest200Response result = apiInstance.CreateGuest(hostId, guestCreateRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.CreateGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the CreateGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Create a guest (async)
    ApiResponse<CreateGuest200Response> response = apiInstance.CreateGuestWithHttpInfo(hostId, guestCreateRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.CreateGuestWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **guestCreateRequest** | [**GuestCreateRequest**](GuestCreateRequest.md) |  |  |

### Return type

[**CreateGuest200Response**](CreateGuest200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guest creation queued. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **409** | Conflict, for example the selected IP zone&#39;s pool is exhausted. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="createsnapshot"></a>
# **CreateSnapshot**
> Envelope CreateSnapshot (int hostId, string type, int vmid, CreateSnapshotRequest createSnapshotRequest)

Create a snapshot

Creates a snapshot. QEMU guests may include RAM state via `vmstate`.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class CreateSnapshotExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var createSnapshotRequest = new CreateSnapshotRequest(); // CreateSnapshotRequest | 

            try
            {
                // Create a snapshot
                Envelope result = apiInstance.CreateSnapshot(hostId, type, vmid, createSnapshotRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.CreateSnapshot: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the CreateSnapshotWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Create a snapshot
    ApiResponse<Envelope> response = apiInstance.CreateSnapshotWithHttpInfo(hostId, type, vmid, createSnapshotRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.CreateSnapshotWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **createSnapshotRequest** | [**CreateSnapshotRequest**](CreateSnapshotRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Snapshot task started (returns a PVE UPID). |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="deleteguest"></a>
# **DeleteGuest**
> Envelope DeleteGuest (int hostId, string type, int vmid, string node)

Delete a guest

Deletes the guest. `node` is required as a query parameter.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class DeleteGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var node = "node_example";  // string | The PVE node the guest currently lives on.

            try
            {
                // Delete a guest
                Envelope result = apiInstance.DeleteGuest(hostId, type, vmid, node);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.DeleteGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete a guest
    ApiResponse<Envelope> response = apiInstance.DeleteGuestWithHttpInfo(hostId, type, vmid, node);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.DeleteGuestWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **node** | **string** | The PVE node the guest currently lives on. |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guest deleted. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="deletesnapshot"></a>
# **DeleteSnapshot**
> Envelope DeleteSnapshot (int hostId, string type, int vmid, string name, string? node = null)

Delete a snapshot

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class DeleteSnapshotExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var name = "name_example";  // string | 
            var node = "node_example";  // string? | Restrict results to this PVE node (plus any datacenter-wide/shared entries). (optional) 

            try
            {
                // Delete a snapshot
                Envelope result = apiInstance.DeleteSnapshot(hostId, type, vmid, name, node);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.DeleteSnapshot: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteSnapshotWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete a snapshot
    ApiResponse<Envelope> response = apiInstance.DeleteSnapshotWithHttpInfo(hostId, type, vmid, name, node);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.DeleteSnapshotWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **name** | **string** |  |  |
| **node** | **string?** | Restrict results to this PVE node (plus any datacenter-wide/shared entries). | [optional]  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Delete task started. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="getguest"></a>
# **GetGuest**
> GetGuest200Response GetGuest (int hostId, string type, int vmid)

Get guest detail

Guest detail from the latest inventory snapshot (DB-backed, no live PVE call).

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class GetGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.

            try
            {
                // Get guest detail
                GetGuest200Response result = apiInstance.GetGuest(hostId, type, vmid);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.GetGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Get guest detail
    ApiResponse<GetGuest200Response> response = apiInstance.GetGuestWithHttpInfo(hostId, type, vmid);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.GetGuestWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |

### Return type

[**GetGuest200Response**](GetGuest200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guest detail. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="getguestipfilter"></a>
# **GetGuestIpFilter**
> Envelope GetGuestIpFilter (int hostId, string type, int vmid, string? node = null)

Anti-spoof IP filter status

Whether the per-guest anti-spoof IP filter is on, plus its allow-list and the guest's assigned CIDRs.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class GetGuestIpFilterExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var node = "node_example";  // string? | Restrict results to this PVE node (plus any datacenter-wide/shared entries). (optional) 

            try
            {
                // Anti-spoof IP filter status
                Envelope result = apiInstance.GetGuestIpFilter(hostId, type, vmid, node);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.GetGuestIpFilter: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetGuestIpFilterWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Anti-spoof IP filter status
    ApiResponse<Envelope> response = apiInstance.GetGuestIpFilterWithHttpInfo(hostId, type, vmid, node);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.GetGuestIpFilterWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **node** | **string?** | Restrict results to this PVE node (plus any datacenter-wide/shared entries). | [optional]  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Filter status and allow-list. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="getguestusage"></a>
# **GetGuestUsage**
> GetNodeUsage200Response GetGuestUsage (int hostId, string type, int vmid, string node, string? range = null, string? metrics = null)

Guest CPU/mem/disk/net time series

Chart-ready time series built from the DB-backed guest metrics table, not a live PVE call. Points are `[epoch_ms, value]` pairs. 

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class GetGuestUsageExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var node = "node_example";  // string | The PVE node the guest currently lives on.
            var range = "30m";  // string? | Time window for the series. (optional)  (default to 30m)
            var metrics = "metrics_example";  // string? | Comma-separated subset of metrics to return, for example \"cpu,mem\". Defaults to all. (optional) 

            try
            {
                // Guest CPU/mem/disk/net time series
                GetNodeUsage200Response result = apiInstance.GetGuestUsage(hostId, type, vmid, node, range, metrics);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.GetGuestUsage: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetGuestUsageWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Guest CPU/mem/disk/net time series
    ApiResponse<GetNodeUsage200Response> response = apiInstance.GetGuestUsageWithHttpInfo(hostId, type, vmid, node, range, metrics);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.GetGuestUsageWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **node** | **string** | The PVE node the guest currently lives on. |  |
| **range** | **string?** | Time window for the series. | [optional] [default to 30m] |
| **metrics** | **string?** | Comma-separated subset of metrics to return, for example \&quot;cpu,mem\&quot;. Defaults to all. | [optional]  |

### Return type

[**GetNodeUsage200Response**](GetNodeUsage200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guest usage series. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listguestevents"></a>
# **ListGuestEvents**
> Envelope ListGuestEvents (int hostId, string type, int vmid, int? page = null, int? perPage = null)

Guest activity log

The DB-backed per-guest activity log, newest first. Paginated.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class ListGuestEventsExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var page = 1;  // int? | Page number, 1-based. (optional)  (default to 1)
            var perPage = 50;  // int? | Items per page, clamped to 1..200. (optional)  (default to 50)

            try
            {
                // Guest activity log
                Envelope result = apiInstance.ListGuestEvents(hostId, type, vmid, page, perPage);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.ListGuestEvents: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListGuestEventsWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Guest activity log
    ApiResponse<Envelope> response = apiInstance.ListGuestEventsWithHttpInfo(hostId, type, vmid, page, perPage);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.ListGuestEventsWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **page** | **int?** | Page number, 1-based. | [optional] [default to 1] |
| **perPage** | **int?** | Items per page, clamped to 1..200. | [optional] [default to 50] |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Events. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listguestips"></a>
# **ListGuestIps**
> Envelope ListGuestIps (int hostId, string type, int vmid)

List the guest's assigned IPs

Every IP assigned to the guest (its primary plus any customer-pool IPs) and the resulting CIDR set.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class ListGuestIpsExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.

            try
            {
                // List the guest's assigned IPs
                Envelope result = apiInstance.ListGuestIps(hostId, type, vmid);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.ListGuestIps: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListGuestIpsWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List the guest's assigned IPs
    ApiResponse<Envelope> response = apiInstance.ListGuestIpsWithHttpInfo(hostId, type, vmid);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.ListGuestIpsWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Assigned IPs. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listguests"></a>
# **ListGuests**
> ListGuests200Response ListGuests (int hostId, string? node = null, string? type = null, string? status = null, int? page = null, int? perPage = null)

List guests

Guest list from the latest inventory snapshot (DB-backed, no live PVE call), filterable by `node`, `type`, and `status`. Paginated. 

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class ListGuestsExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var node = "node_example";  // string? | Restrict results to this PVE node (plus any datacenter-wide/shared entries). (optional) 
            var type = "qemu";  // string? | Filter by guest type. (optional) 
            var status = "status_example";  // string? | Filter by guest status, for example running or stopped. (optional) 
            var page = 1;  // int? | Page number, 1-based. (optional)  (default to 1)
            var perPage = 50;  // int? | Items per page, clamped to 1..200. (optional)  (default to 50)

            try
            {
                // List guests
                ListGuests200Response result = apiInstance.ListGuests(hostId, node, type, status, page, perPage);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.ListGuests: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListGuestsWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List guests
    ApiResponse<ListGuests200Response> response = apiInstance.ListGuestsWithHttpInfo(hostId, node, type, status, page, perPage);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.ListGuestsWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **node** | **string?** | Restrict results to this PVE node (plus any datacenter-wide/shared entries). | [optional]  |
| **type** | **string?** | Filter by guest type. | [optional]  |
| **status** | **string?** | Filter by guest status, for example running or stopped. | [optional]  |
| **page** | **int?** | Page number, 1-based. | [optional] [default to 1] |
| **perPage** | **int?** | Items per page, clamped to 1..200. | [optional] [default to 50] |

### Return type

[**ListGuests200Response**](ListGuests200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guests. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listsnapshots"></a>
# **ListSnapshots**
> Envelope ListSnapshots (int hostId, string type, int vmid, string? node = null)

List guest snapshots

Live PVE read of a guest's snapshots, newest first.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class ListSnapshotsExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var node = "node_example";  // string? | Restrict results to this PVE node (plus any datacenter-wide/shared entries). (optional) 

            try
            {
                // List guest snapshots
                Envelope result = apiInstance.ListSnapshots(hostId, type, vmid, node);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.ListSnapshots: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListSnapshotsWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List guest snapshots
    ApiResponse<Envelope> response = apiInstance.ListSnapshotsWithHttpInfo(hostId, type, vmid, node);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.ListSnapshotsWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **node** | **string?** | Restrict results to this PVE node (plus any datacenter-wide/shared entries). | [optional]  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Snapshots. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="powerguest"></a>
# **PowerGuest**
> Envelope PowerGuest (int hostId, string type, int vmid, PowerGuestRequest powerGuestRequest)

Power action

Starts, stops, shuts down, reboots, suspends, or resumes the guest.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class PowerGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var powerGuestRequest = new PowerGuestRequest(); // PowerGuestRequest | 

            try
            {
                // Power action
                Envelope result = apiInstance.PowerGuest(hostId, type, vmid, powerGuestRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.PowerGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the PowerGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Power action
    ApiResponse<Envelope> response = apiInstance.PowerGuestWithHttpInfo(hostId, type, vmid, powerGuestRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.PowerGuestWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **powerGuestRequest** | [**PowerGuestRequest**](PowerGuestRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Power action accepted. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="reinstallguest"></a>
# **ReinstallGuest**
> CreateGuest200Response ReinstallGuest (int hostId, string type, int vmid, ReinstallGuestRequest reinstallGuestRequest)

Reinstall a guest (async)

Deletes and recreates the guest, keeping its vmid and specs, with a fresh OS. For QEMU, `os_template` must be `tpl:<id>` from `GET /hosts/{hostId}/os-templates`. For LXC, `os_template` is a raw `vztmpl` volid. `password` is required unless at least one SSH key is present via `ssh_keys[]`. Asynchronous, same job/poll pattern as create. 

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class ReinstallGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var reinstallGuestRequest = new ReinstallGuestRequest(); // ReinstallGuestRequest | 

            try
            {
                // Reinstall a guest (async)
                CreateGuest200Response result = apiInstance.ReinstallGuest(hostId, type, vmid, reinstallGuestRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.ReinstallGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ReinstallGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Reinstall a guest (async)
    ApiResponse<CreateGuest200Response> response = apiInstance.ReinstallGuestWithHttpInfo(hostId, type, vmid, reinstallGuestRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.ReinstallGuestWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **reinstallGuestRequest** | [**ReinstallGuestRequest**](ReinstallGuestRequest.md) |  |  |

### Return type

[**CreateGuest200Response**](CreateGuest200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Reinstall queued. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="resizeguest"></a>
# **ResizeGuest**
> Envelope ResizeGuest (int hostId, string type, int vmid, ResizeGuestRequest resizeGuestRequest)

Resize cores, memory, and/or a disk

Change CPU cores and/or memory (MB), and/or grow a disk. Provide any of `cores`, `memory_mb`, or `disk` + `size`. Cores/memory apply on the next reboot; disk grow is immediate and grow-only (shrinking is rejected). 

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class ResizeGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var resizeGuestRequest = new ResizeGuestRequest(); // ResizeGuestRequest | 

            try
            {
                // Resize cores, memory, and/or a disk
                Envelope result = apiInstance.ResizeGuest(hostId, type, vmid, resizeGuestRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.ResizeGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ResizeGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Resize cores, memory, and/or a disk
    ApiResponse<Envelope> response = apiInstance.ResizeGuestWithHttpInfo(hostId, type, vmid, resizeGuestRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.ResizeGuestWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **resizeGuestRequest** | [**ResizeGuestRequest**](ResizeGuestRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Resized. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="rollbacksnapshot"></a>
# **RollbackSnapshot**
> Envelope RollbackSnapshot (int hostId, string type, int vmid, string name, RollbackSnapshotRequest rollbackSnapshotRequest)

Roll back to a snapshot

Reverts the guest to a snapshot. Stop the guest first unless the snapshot has a saved RAM state.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class RollbackSnapshotExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var name = "name_example";  // string | 
            var rollbackSnapshotRequest = new RollbackSnapshotRequest(); // RollbackSnapshotRequest | 

            try
            {
                // Roll back to a snapshot
                Envelope result = apiInstance.RollbackSnapshot(hostId, type, vmid, name, rollbackSnapshotRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.RollbackSnapshot: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the RollbackSnapshotWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Roll back to a snapshot
    ApiResponse<Envelope> response = apiInstance.RollbackSnapshotWithHttpInfo(hostId, type, vmid, name, rollbackSnapshotRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.RollbackSnapshotWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **name** | **string** |  |  |
| **rollbackSnapshotRequest** | [**RollbackSnapshotRequest**](RollbackSnapshotRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Rollback task started. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="setguestipfilter"></a>
# **SetGuestIpFilter**
> Envelope SetGuestIpFilter (int hostId, string type, int vmid, SetGuestIpFilterRequest setGuestIpFilterRequest)

Toggle the anti-spoof IP filter

Enabling requires the guest to already hold an assigned IP; the allow-list is the union of every IP assigned to the guest.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class SetGuestIpFilterExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var setGuestIpFilterRequest = new SetGuestIpFilterRequest(); // SetGuestIpFilterRequest | 

            try
            {
                // Toggle the anti-spoof IP filter
                Envelope result = apiInstance.SetGuestIpFilter(hostId, type, vmid, setGuestIpFilterRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.SetGuestIpFilter: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the SetGuestIpFilterWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Toggle the anti-spoof IP filter
    ApiResponse<Envelope> response = apiInstance.SetGuestIpFilterWithHttpInfo(hostId, type, vmid, setGuestIpFilterRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.SetGuestIpFilterWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **setGuestIpFilterRequest** | [**SetGuestIpFilterRequest**](SetGuestIpFilterRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Toggled. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="setguestipconfig"></a>
# **SetGuestIpconfig**
> Envelope SetGuestIpconfig (int hostId, string type, int vmid, SetGuestIpconfigRequest setGuestIpconfigRequest)

Set the guest's network configuration

Sets a static or DHCP `ipconfig` on the guest's primary NIC. Reboot the guest to apply the change. 

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class SetGuestIpconfigExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var setGuestIpconfigRequest = new SetGuestIpconfigRequest(); // SetGuestIpconfigRequest | 

            try
            {
                // Set the guest's network configuration
                Envelope result = apiInstance.SetGuestIpconfig(hostId, type, vmid, setGuestIpconfigRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.SetGuestIpconfig: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the SetGuestIpconfigWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Set the guest's network configuration
    ApiResponse<Envelope> response = apiInstance.SetGuestIpconfigWithHttpInfo(hostId, type, vmid, setGuestIpconfigRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.SetGuestIpconfigWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **setGuestIpconfigRequest** | [**SetGuestIpconfigRequest**](SetGuestIpconfigRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | IP configuration applied (pending reboot). |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="setguestpassword"></a>
# **SetGuestPassword**
> SetGuestPassword200Response SetGuestPassword (int hostId, string type, int vmid, SetGuestPasswordRequest setGuestPasswordRequest)

Reset the guest's root password

Sets a new password for the guest's login user, minimum 5 characters. By default (async provisioning enabled) the work is queued and the response is `{queued, job_id}` — poll GET /hosts/{hostId}/jobs/{jobId} for the outcome. When async provisioning is off the change runs synchronously and the response is `{changed: true}`. 

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class SetGuestPasswordExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var setGuestPasswordRequest = new SetGuestPasswordRequest(); // SetGuestPasswordRequest | 

            try
            {
                // Reset the guest's root password
                SetGuestPassword200Response result = apiInstance.SetGuestPassword(hostId, type, vmid, setGuestPasswordRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.SetGuestPassword: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the SetGuestPasswordWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Reset the guest's root password
    ApiResponse<SetGuestPassword200Response> response = apiInstance.SetGuestPasswordWithHttpInfo(hostId, type, vmid, setGuestPasswordRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.SetGuestPasswordWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **setGuestPasswordRequest** | [**SetGuestPasswordRequest**](SetGuestPasswordRequest.md) |  |  |

### Return type

[**SetGuestPassword200Response**](SetGuestPassword200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Queued (default) or, when async provisioning is disabled, changed synchronously.  |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="unassignguestip"></a>
# **UnassignGuestIp**
> Envelope UnassignGuestIp (int hostId, string type, int vmid, int ipId)

Unassign an IP from the guest

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class UnassignGuestIpExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new GuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var ipId = 56;  // int | 

            try
            {
                // Unassign an IP from the guest
                Envelope result = apiInstance.UnassignGuestIp(hostId, type, vmid, ipId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling GuestsApi.UnassignGuestIp: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UnassignGuestIpWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Unassign an IP from the guest
    ApiResponse<Envelope> response = apiInstance.UnassignGuestIpWithHttpInfo(hostId, type, vmid, ipId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling GuestsApi.UnassignGuestIpWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **type** | **string** | Guest type. |  |
| **vmid** | **int** | The guest&#39;s VMID. |  |
| **ipId** | **int** |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Unassigned. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

