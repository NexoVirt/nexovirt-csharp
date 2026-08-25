# NexoVirt.Sdk.Api.ResellerGuestsApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**CreateResellerGuest**](ResellerGuestsApi.md#createresellerguest) | **POST** /guests | Create a guest for one of my customers |
| [**DeleteResellerGuest**](ResellerGuestsApi.md#deleteresellerguest) | **DELETE** /guests/{hostId}/{type}/{vmid} | Delete a guest |
| [**GetResellerGuest**](ResellerGuestsApi.md#getresellerguest) | **GET** /guests/{hostId}/{type}/{vmid} | Get a guest |
| [**ListResellerGuests**](ResellerGuestsApi.md#listresellerguests) | **GET** /guests | List my guests |
| [**PowerResellerGuest**](ResellerGuestsApi.md#powerresellerguest) | **POST** /guests/{hostId}/{type}/{vmid}/power | Power action |

<a id="createresellerguest"></a>
# **CreateResellerGuest**
> Envelope CreateResellerGuest (CreateResellerGuestRequest createResellerGuestRequest)

Create a guest for one of my customers

`owner_id` must be one of the calling reseller's own customers (`404` otherwise). `host_id`/`node` must be a (host, node) pair the reseller was granted; `plan_id` and any `ipv4_zone_id`/`ipv6_zone_id` must likewise belong to the reseller. Same shape as the admin `POST /hosts/{hostId}/guests` body, plus `owner_id`, `host_id`, and `node`. 

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
    public class CreateResellerGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: resellerBearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new ResellerGuestsApi(httpClient, config, httpClientHandler);
            var createResellerGuestRequest = new CreateResellerGuestRequest(); // CreateResellerGuestRequest | 

            try
            {
                // Create a guest for one of my customers
                Envelope result = apiInstance.CreateResellerGuest(createResellerGuestRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerGuestsApi.CreateResellerGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the CreateResellerGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Create a guest for one of my customers
    ApiResponse<Envelope> response = apiInstance.CreateResellerGuestWithHttpInfo(createResellerGuestRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerGuestsApi.CreateResellerGuestWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **createResellerGuestRequest** | [**CreateResellerGuestRequest**](CreateResellerGuestRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[resellerBearerAuth](../README.md#resellerBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Create requested. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="deleteresellerguest"></a>
# **DeleteResellerGuest**
> Envelope DeleteResellerGuest (int hostId, string type, int vmid, string node)

Delete a guest

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
    public class DeleteResellerGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: resellerBearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new ResellerGuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var node = "node_example";  // string | 

            try
            {
                // Delete a guest
                Envelope result = apiInstance.DeleteResellerGuest(hostId, type, vmid, node);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerGuestsApi.DeleteResellerGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteResellerGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete a guest
    ApiResponse<Envelope> response = apiInstance.DeleteResellerGuestWithHttpInfo(hostId, type, vmid, node);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerGuestsApi.DeleteResellerGuestWithHttpInfo: " + e.Message);
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
| **node** | **string** |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[resellerBearerAuth](../README.md#resellerBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Deleted. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="getresellerguest"></a>
# **GetResellerGuest**
> Envelope GetResellerGuest (int hostId, string type, int vmid)

Get a guest

`404` unless owned by one of the calling reseller's own customers.

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
    public class GetResellerGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: resellerBearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new ResellerGuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.

            try
            {
                // Get a guest
                Envelope result = apiInstance.GetResellerGuest(hostId, type, vmid);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerGuestsApi.GetResellerGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetResellerGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Get a guest
    ApiResponse<Envelope> response = apiInstance.GetResellerGuestWithHttpInfo(hostId, type, vmid);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerGuestsApi.GetResellerGuestWithHttpInfo: " + e.Message);
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

[resellerBearerAuth](../README.md#resellerBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guest detail. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listresellerguests"></a>
# **ListResellerGuests**
> Envelope ListResellerGuests (string? node = null, string? type = null, string? status = null)

List my guests

Guests owned by the calling reseller's own customers, across every node the reseller is assigned.

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
    public class ListResellerGuestsExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: resellerBearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new ResellerGuestsApi(httpClient, config, httpClientHandler);
            var node = "node_example";  // string? | Restrict results to this PVE node (plus any datacenter-wide/shared entries). (optional) 
            var type = "qemu";  // string? |  (optional) 
            var status = "status_example";  // string? |  (optional) 

            try
            {
                // List my guests
                Envelope result = apiInstance.ListResellerGuests(node, type, status);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerGuestsApi.ListResellerGuests: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListResellerGuestsWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List my guests
    ApiResponse<Envelope> response = apiInstance.ListResellerGuestsWithHttpInfo(node, type, status);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerGuestsApi.ListResellerGuestsWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **node** | **string?** | Restrict results to this PVE node (plus any datacenter-wide/shared entries). | [optional]  |
| **type** | **string?** |  | [optional]  |
| **status** | **string?** |  | [optional]  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[resellerBearerAuth](../README.md#resellerBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guests. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="powerresellerguest"></a>
# **PowerResellerGuest**
> Envelope PowerResellerGuest (int hostId, string type, int vmid, PowerResellerGuestRequest powerResellerGuestRequest)

Power action

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
    public class PowerResellerGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: resellerBearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new ResellerGuestsApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var powerResellerGuestRequest = new PowerResellerGuestRequest(); // PowerResellerGuestRequest | 

            try
            {
                // Power action
                Envelope result = apiInstance.PowerResellerGuest(hostId, type, vmid, powerResellerGuestRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerGuestsApi.PowerResellerGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the PowerResellerGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Power action
    ApiResponse<Envelope> response = apiInstance.PowerResellerGuestWithHttpInfo(hostId, type, vmid, powerResellerGuestRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerGuestsApi.PowerResellerGuestWithHttpInfo: " + e.Message);
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
| **powerResellerGuestRequest** | [**PowerResellerGuestRequest**](PowerResellerGuestRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[resellerBearerAuth](../README.md#resellerBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Action dispatched. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

