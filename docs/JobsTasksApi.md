# NexoVirt.Sdk.Api.JobsTasksApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**GetProvisioningJob**](JobsTasksApi.md#getprovisioningjob) | **GET** /hosts/{hostId}/jobs/{jobId} | Get an async provisioning job&#39;s status |
| [**GetPveTask**](JobsTasksApi.md#getpvetask) | **GET** /hosts/{hostId}/tasks/{node}/{upid} | Get a live PVE task&#39;s status |

<a id="getprovisioningjob"></a>
# **GetProvisioningJob**
> GetProvisioningJob200Response GetProvisioningJob (int hostId, int jobId)

Get an async provisioning job's status

Poll this to track a create, reinstall, delete, or power job enqueued when `provision.async` is enabled. `status` transitions `queued` to `running` to a terminal state, either `done` or `failed`. On failure, `error` carries the reason. 

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
    public class GetProvisioningJobExample
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
            var apiInstance = new JobsTasksApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var jobId = 56;  // int | 

            try
            {
                // Get an async provisioning job's status
                GetProvisioningJob200Response result = apiInstance.GetProvisioningJob(hostId, jobId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling JobsTasksApi.GetProvisioningJob: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetProvisioningJobWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Get an async provisioning job's status
    ApiResponse<GetProvisioningJob200Response> response = apiInstance.GetProvisioningJobWithHttpInfo(hostId, jobId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling JobsTasksApi.GetProvisioningJobWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **jobId** | **int** |  |  |

### Return type

[**GetProvisioningJob200Response**](GetProvisioningJob200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Job status. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="getpvetask"></a>
# **GetPveTask**
> Envelope GetPveTask (int hostId, string node, string upid)

Get a live PVE task's status

A live PVE task status lookup by UPID, for tracking the underlying Proxmox task directly (as opposed to the panel's own provisioning job). 

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
    public class GetPveTaskExample
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
            var apiInstance = new JobsTasksApi(httpClient, config, httpClientHandler);
            var hostId = 56;  // int | The panel's internal host id (from `GET /hosts`).
            var node = "node_example";  // string | The PVE node name.
            var upid = "upid_example";  // string | The PVE task UPID, URL-encoded.

            try
            {
                // Get a live PVE task's status
                Envelope result = apiInstance.GetPveTask(hostId, node, upid);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling JobsTasksApi.GetPveTask: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetPveTaskWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Get a live PVE task's status
    ApiResponse<Envelope> response = apiInstance.GetPveTaskWithHttpInfo(hostId, node, upid);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling JobsTasksApi.GetPveTaskWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **hostId** | **int** | The panel&#39;s internal host id (from &#x60;GET /hosts&#x60;). |  |
| **node** | **string** | The PVE node name. |  |
| **upid** | **string** | The PVE task UPID, URL-encoded. |  |

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
| **200** | Task status. |  -  |
| **400** | Invalid task id. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |
| **502** | The underlying Proxmox VE call failed or the host was unreachable. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

