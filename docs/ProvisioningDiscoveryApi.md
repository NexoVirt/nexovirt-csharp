# NexoVirt.Sdk.Api.ProvisioningDiscoveryApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**GetNextVmid**](ProvisioningDiscoveryApi.md#getnextvmid) | **GET** /hosts/{hostId}/next-vmid | Get the next free VMID |
| [**ListCtTemplates**](ProvisioningDiscoveryApi.md#listcttemplates) | **GET** /hosts/{hostId}/ct-templates | List LXC container templates |
| [**ListIpZones**](ProvisioningDiscoveryApi.md#listipzones) | **GET** /hosts/{hostId}/ip-zones | List IP zones |
| [**ListOsTemplates**](ProvisioningDiscoveryApi.md#listostemplates) | **GET** /hosts/{hostId}/os-templates | List QEMU OS templates |
| [**ListPlans**](ProvisioningDiscoveryApi.md#listplans) | **GET** /hosts/{hostId}/plans | List resource plans |
| [**ListUserSshKeys**](ProvisioningDiscoveryApi.md#listusersshkeys) | **GET** /users/{userId}/ssh-keys | List a user&#39;s SSH keys |

<a id="getnextvmid"></a>
# **GetNextVmid**
> GetNextVmid200Response GetNextVmid (int hostId)

Get the next free VMID

A free VMID from the live PVE `cluster/nextid` call. Create still requires an explicit `vmid` in the body; use this to obtain one. 

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
    public class GetNextVmidExample
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
            var apiInstance = new ProvisioningDiscoveryApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).

            try
            {
                // Get the next free VMID
                GetNextVmid200Response result = apiInstance.GetNextVmid(hostId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ProvisioningDiscoveryApi.GetNextVmid: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetNextVmidWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Get the next free VMID
    ApiResponse<GetNextVmid200Response> response = apiInstance.GetNextVmidWithHttpInfo(hostId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ProvisioningDiscoveryApi.GetNextVmidWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |

### Return type

[**GetNextVmid200Response**](GetNextVmid200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Next free VMID. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listcttemplates"></a>
# **ListCtTemplates**
> ListCtTemplates200Response ListCtTemplates (int hostId, string? node = null)

List LXC container templates

LXC template options. `managed` is the panel's own CT template library (`lxc_template_id` is the create argument, staged on demand). `available` is live PVE `vztmpl` volumes on `?node` (only populated when a valid `node` is given; `volid` is the create argument). Without `?node`, `available` is an empty array and no PVE call is made. Not paginated. 

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
    public class ListCtTemplatesExample
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
            var apiInstance = new ProvisioningDiscoveryApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var node = "node_example";  // string? | Restrict results to this PVE node (plus any datacenter-wide/shared entries). (optional) 

            try
            {
                // List LXC container templates
                ListCtTemplates200Response result = apiInstance.ListCtTemplates(hostId, node);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListCtTemplates: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListCtTemplatesWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List LXC container templates
    ApiResponse<ListCtTemplates200Response> response = apiInstance.ListCtTemplatesWithHttpInfo(hostId, node);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListCtTemplatesWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **node** | **string?** | Restrict results to this PVE node (plus any datacenter-wide/shared entries). | [optional]  |

### Return type

[**ListCtTemplates200Response**](ListCtTemplates200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Managed and available LXC templates. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listipzones"></a>
# **ListIpZones**
> ListIpZones200Response ListIpZones (int hostId, int? page = null, int? perPage = null)

List IP zones

The host's IP zones (IPAM). `ref` (for example `zone:3`) is the exact `ip_source` create value; using it allocates a static IP from the zone's pool. Paginated. 

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
    public class ListIpZonesExample
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
            var apiInstance = new ProvisioningDiscoveryApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var page = 1;  // int? | Page number, 1-based. (optional)  (default to 1)
            var perPage = 50;  // int? | Items per page, clamped to 1..200. (optional)  (default to 50)

            try
            {
                // List IP zones
                ListIpZones200Response result = apiInstance.ListIpZones(hostId, page, perPage);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListIpZones: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListIpZonesWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List IP zones
    ApiResponse<ListIpZones200Response> response = apiInstance.ListIpZonesWithHttpInfo(hostId, page, perPage);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListIpZonesWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **page** | **int?** | Page number, 1-based. | [optional] [default to 1] |
| **perPage** | **int?** | Items per page, clamped to 1..200. | [optional] [default to 50] |

### Return type

[**ListIpZones200Response**](ListIpZones200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | IP zones. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listostemplates"></a>
# **ListOsTemplates**
> ListOsTemplates200Response ListOsTemplates (int hostId, int? page = null, int? perPage = null)

List QEMU OS templates

Cloud-init OS templates for QEMU. `ref` (for example `tpl:7`) is the exact `os_template` value to send at create. Never returns SSH keys or other cloud-init secrets. Paginated. 

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
    public class ListOsTemplatesExample
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
            var apiInstance = new ProvisioningDiscoveryApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var page = 1;  // int? | Page number, 1-based. (optional)  (default to 1)
            var perPage = 50;  // int? | Items per page, clamped to 1..200. (optional)  (default to 50)

            try
            {
                // List QEMU OS templates
                ListOsTemplates200Response result = apiInstance.ListOsTemplates(hostId, page, perPage);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListOsTemplates: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListOsTemplatesWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List QEMU OS templates
    ApiResponse<ListOsTemplates200Response> response = apiInstance.ListOsTemplatesWithHttpInfo(hostId, page, perPage);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListOsTemplatesWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **page** | **int?** | Page number, 1-based. | [optional] [default to 1] |
| **perPage** | **int?** | Items per page, clamped to 1..200. | [optional] [default to 50] |

### Return type

[**ListOsTemplates200Response**](ListOsTemplates200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | QEMU OS templates. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listplans"></a>
# **ListPlans**
> ListPlans200Response ListPlans (int hostId, int? page = null, int? perPage = null)

List resource plans

Active resource plans usable as `plan_id` at create time. A plan fills and locks `cores`, `memory_mb`, and `disk_gb` on the created guest. Paginated. 

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
    public class ListPlansExample
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
            var apiInstance = new ProvisioningDiscoveryApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var page = 1;  // int? | Page number, 1-based. (optional)  (default to 1)
            var perPage = 50;  // int? | Items per page, clamped to 1..200. (optional)  (default to 50)

            try
            {
                // List resource plans
                ListPlans200Response result = apiInstance.ListPlans(hostId, page, perPage);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListPlans: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListPlansWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List resource plans
    ApiResponse<ListPlans200Response> response = apiInstance.ListPlansWithHttpInfo(hostId, page, perPage);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListPlansWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **page** | **int?** | Page number, 1-based. | [optional] [default to 1] |
| **perPage** | **int?** | Items per page, clamped to 1..200. | [optional] [default to 50] |

### Return type

[**ListPlans200Response**](ListPlans200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Resource plans. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listusersshkeys"></a>
# **ListUserSshKeys**
> ListUserSshKeys200Response ListUserSshKeys (int userId)

List a user's SSH keys

A user's stored SSH keys, exposing only `id`, `name`, and `fingerprint`, never the key body. Pass the owner's id as `owner_id` at create to auto-inject all of that user's stored keys. Not paginated. 

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
    public class ListUserSshKeysExample
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
            var apiInstance = new ProvisioningDiscoveryApi(httpClient, config, httpClientHandler);
            var userId = 56;  // int | 

            try
            {
                // List a user's SSH keys
                ListUserSshKeys200Response result = apiInstance.ListUserSshKeys(userId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListUserSshKeys: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListUserSshKeysWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List a user's SSH keys
    ApiResponse<ListUserSshKeys200Response> response = apiInstance.ListUserSshKeysWithHttpInfo(userId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ProvisioningDiscoveryApi.ListUserSshKeysWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **userId** | **int** |  |  |

### Return type

[**ListUserSshKeys200Response**](ListUserSshKeys200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | SSH keys. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

