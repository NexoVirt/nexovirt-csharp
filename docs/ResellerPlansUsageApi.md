# NexoVirt.Sdk.Api.ResellerPlansUsageApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**GetResellerUsage**](ResellerPlansUsageApi.md#getresellerusage) | **GET** /usage | My usage |
| [**ListResellerPlansAvailable**](ResellerPlansUsageApi.md#listresellerplansavailable) | **GET** /plans | List plans available to me |

<a id="getresellerusage"></a>
# **GetResellerUsage**
> Envelope GetResellerUsage ()

My usage

Per-customer usage breakdown plus the reseller's total usage and quota plan. Read-only.

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
    public class GetResellerUsageExample
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
            var apiInstance = new ResellerPlansUsageApi(httpClient, config, httpClientHandler);

            try
            {
                // My usage
                Envelope result = apiInstance.GetResellerUsage();
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerPlansUsageApi.GetResellerUsage: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetResellerUsageWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // My usage
    ApiResponse<Envelope> response = apiInstance.GetResellerUsageWithHttpInfo();
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerPlansUsageApi.GetResellerUsageWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters
This endpoint does not need any parameter.
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
| **200** | Usage. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listresellerplansavailable"></a>
# **ListResellerPlansAvailable**
> Envelope ListResellerPlansAvailable (int? page = null, int? perPage = null)

List plans available to me

The reseller's own plans plus any global plans. Read-only.

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
    public class ListResellerPlansAvailableExample
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
            var apiInstance = new ResellerPlansUsageApi(httpClient, config, httpClientHandler);
            var page = 1;  // int? | Page number, 1-based. (optional)  (default to 1)
            var perPage = 50;  // int? | Items per page, clamped to 1..200. (optional)  (default to 50)

            try
            {
                // List plans available to me
                Envelope result = apiInstance.ListResellerPlansAvailable(page, perPage);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerPlansUsageApi.ListResellerPlansAvailable: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListResellerPlansAvailableWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List plans available to me
    ApiResponse<Envelope> response = apiInstance.ListResellerPlansAvailableWithHttpInfo(page, perPage);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerPlansUsageApi.ListResellerPlansAvailableWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **page** | **int?** | Page number, 1-based. | [optional] [default to 1] |
| **perPage** | **int?** | Items per page, clamped to 1..200. | [optional] [default to 50] |

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
| **200** | Plans. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

