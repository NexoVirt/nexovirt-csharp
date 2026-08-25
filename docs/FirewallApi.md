# NexoVirt.Sdk.Api.FirewallApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**CreateGuestFirewallRule**](FirewallApi.md#createguestfirewallrule) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/firewall/rules | Add a per-guest firewall rule |
| [**DeleteGuestFirewallRule**](FirewallApi.md#deleteguestfirewallrule) | **DELETE** /hosts/{hostId}/guests/{type}/{vmid}/firewall/rules/{ruleId} | Delete a per-guest firewall rule |
| [**GetGuestFirewallOptions**](FirewallApi.md#getguestfirewalloptions) | **GET** /hosts/{hostId}/guests/{type}/{vmid}/firewall/options | Get per-guest firewall options |
| [**ListGuestFirewallRules**](FirewallApi.md#listguestfirewallrules) | **GET** /hosts/{hostId}/guests/{type}/{vmid}/firewall/rules | List per-guest firewall rules |
| [**SetGuestFirewallOptions**](FirewallApi.md#setguestfirewalloptions) | **POST** /hosts/{hostId}/guests/{type}/{vmid}/firewall/options | Set per-guest firewall options |

<a id="createguestfirewallrule"></a>
# **CreateGuestFirewallRule**
> Envelope CreateGuestFirewallRule (int hostId, string type, int vmid, CreateGuestFirewallRuleRequest createGuestFirewallRuleRequest)

Add a per-guest firewall rule

Persists a rule and reconciles it to the guest's PVE firewall (best-effort).

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
    public class CreateGuestFirewallRuleExample
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
            var apiInstance = new FirewallApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var createGuestFirewallRuleRequest = new CreateGuestFirewallRuleRequest(); // CreateGuestFirewallRuleRequest | 

            try
            {
                // Add a per-guest firewall rule
                Envelope result = apiInstance.CreateGuestFirewallRule(hostId, type, vmid, createGuestFirewallRuleRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling FirewallApi.CreateGuestFirewallRule: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the CreateGuestFirewallRuleWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Add a per-guest firewall rule
    ApiResponse<Envelope> response = apiInstance.CreateGuestFirewallRuleWithHttpInfo(hostId, type, vmid, createGuestFirewallRuleRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling FirewallApi.CreateGuestFirewallRuleWithHttpInfo: " + e.Message);
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
| **createGuestFirewallRuleRequest** | [**CreateGuestFirewallRuleRequest**](CreateGuestFirewallRuleRequest.md) |  |  |

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
| **200** | Created. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="deleteguestfirewallrule"></a>
# **DeleteGuestFirewallRule**
> Envelope DeleteGuestFirewallRule (int hostId, string type, int vmid, int ruleId, string? node = null)

Delete a per-guest firewall rule

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
    public class DeleteGuestFirewallRuleExample
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
            var apiInstance = new FirewallApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var ruleId = 56;  // int | 
            var node = "node_example";  // string? | Restrict results to this PVE node (plus any datacenter-wide/shared entries). (optional) 

            try
            {
                // Delete a per-guest firewall rule
                Envelope result = apiInstance.DeleteGuestFirewallRule(hostId, type, vmid, ruleId, node);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling FirewallApi.DeleteGuestFirewallRule: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteGuestFirewallRuleWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete a per-guest firewall rule
    ApiResponse<Envelope> response = apiInstance.DeleteGuestFirewallRuleWithHttpInfo(hostId, type, vmid, ruleId, node);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling FirewallApi.DeleteGuestFirewallRuleWithHttpInfo: " + e.Message);
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
| **ruleId** | **int** |  |  |
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
| **200** | Deleted. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="getguestfirewalloptions"></a>
# **GetGuestFirewallOptions**
> Envelope GetGuestFirewallOptions (int hostId, string type, int vmid, string? node = null)

Get per-guest firewall options

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
    public class GetGuestFirewallOptionsExample
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
            var apiInstance = new FirewallApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var node = "node_example";  // string? | Restrict results to this PVE node (plus any datacenter-wide/shared entries). (optional) 

            try
            {
                // Get per-guest firewall options
                Envelope result = apiInstance.GetGuestFirewallOptions(hostId, type, vmid, node);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling FirewallApi.GetGuestFirewallOptions: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetGuestFirewallOptionsWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Get per-guest firewall options
    ApiResponse<Envelope> response = apiInstance.GetGuestFirewallOptionsWithHttpInfo(hostId, type, vmid, node);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling FirewallApi.GetGuestFirewallOptionsWithHttpInfo: " + e.Message);
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
| **200** | Options. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listguestfirewallrules"></a>
# **ListGuestFirewallRules**
> Envelope ListGuestFirewallRules (int hostId, string type, int vmid, string? node = null)

List per-guest firewall rules

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
    public class ListGuestFirewallRulesExample
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
            var apiInstance = new FirewallApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var node = "node_example";  // string? | Restrict results to this PVE node (plus any datacenter-wide/shared entries). (optional) 

            try
            {
                // List per-guest firewall rules
                Envelope result = apiInstance.ListGuestFirewallRules(hostId, type, vmid, node);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling FirewallApi.ListGuestFirewallRules: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListGuestFirewallRulesWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List per-guest firewall rules
    ApiResponse<Envelope> response = apiInstance.ListGuestFirewallRulesWithHttpInfo(hostId, type, vmid, node);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling FirewallApi.ListGuestFirewallRulesWithHttpInfo: " + e.Message);
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
| **200** | Rules. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="setguestfirewalloptions"></a>
# **SetGuestFirewallOptions**
> Envelope SetGuestFirewallOptions (int hostId, string type, int vmid, SetGuestFirewallOptionsRequest setGuestFirewallOptionsRequest)

Set per-guest firewall options

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
    public class SetGuestFirewallOptionsExample
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
            var apiInstance = new FirewallApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var setGuestFirewallOptionsRequest = new SetGuestFirewallOptionsRequest(); // SetGuestFirewallOptionsRequest | 

            try
            {
                // Set per-guest firewall options
                Envelope result = apiInstance.SetGuestFirewallOptions(hostId, type, vmid, setGuestFirewallOptionsRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling FirewallApi.SetGuestFirewallOptions: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the SetGuestFirewallOptionsWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Set per-guest firewall options
    ApiResponse<Envelope> response = apiInstance.SetGuestFirewallOptionsWithHttpInfo(hostId, type, vmid, setGuestFirewallOptionsRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling FirewallApi.SetGuestFirewallOptionsWithHttpInfo: " + e.Message);
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
| **setGuestFirewallOptionsRequest** | [**SetGuestFirewallOptionsRequest**](SetGuestFirewallOptionsRequest.md) |  |  |

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
| **200** | Saved. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

