# NexoVirt.Sdk.Api.ResellerNetworkingApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**ChangeResellerGuestIp**](ResellerNetworkingApi.md#changeresellerguestip) | **POST** /guests/{hostId}/{type}/{vmid}/ip | Change or release a guest&#39;s static IP |

<a id="changeresellerguestip"></a>
# **ChangeResellerGuestIp**
> Envelope ChangeResellerGuestIp (int hostId, string type, int vmid, ChangeResellerGuestIpRequest changeResellerGuestIpRequest)

Change or release a guest's static IP

`action=change` requires `ip` (must fall inside the target zone's range) and assigns it; `action=release` frees the guest's current IP for that family. The target zone (`zone_id`, or the guest's current single-stack zone if omitted) must be one the calling reseller was granted. Reboot the guest to apply. 

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
    public class ChangeResellerGuestIpExample
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
            var apiInstance = new ResellerNetworkingApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var type = "qemu";  // string | Guest type.
            var vmid = 56;  // int | The guest's VMID.
            var changeResellerGuestIpRequest = new ChangeResellerGuestIpRequest(); // ChangeResellerGuestIpRequest | 

            try
            {
                // Change or release a guest's static IP
                Envelope result = apiInstance.ChangeResellerGuestIp(hostId, type, vmid, changeResellerGuestIpRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerNetworkingApi.ChangeResellerGuestIp: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ChangeResellerGuestIpWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Change or release a guest's static IP
    ApiResponse<Envelope> response = apiInstance.ChangeResellerGuestIpWithHttpInfo(hostId, type, vmid, changeResellerGuestIpRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerNetworkingApi.ChangeResellerGuestIpWithHttpInfo: " + e.Message);
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
| **changeResellerGuestIpRequest** | [**ChangeResellerGuestIpRequest**](ChangeResellerGuestIpRequest.md) |  |  |

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
| **200** | Applied. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

