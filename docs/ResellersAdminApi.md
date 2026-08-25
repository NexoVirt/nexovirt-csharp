# NexoVirt.Sdk.Api.ResellersAdminApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**AssignResellerCustomer**](ResellersAdminApi.md#assignresellercustomer) | **POST** /resellers/{resellerId}/customers | Link a customer to a reseller |
| [**AssignResellerNode**](ResellersAdminApi.md#assignresellernode) | **POST** /resellers/{resellerId}/nodes | Grant node access |
| [**AssignResellerPlan**](ResellersAdminApi.md#assignresellerplan) | **POST** /resellers/{resellerId}/plan | Assign a reseller quota plan |
| [**AssignResellerZone**](ResellersAdminApi.md#assignresellerzone) | **POST** /resellers/{resellerId}/zones | Grant IP-zone access |
| [**CreateReseller**](ResellersAdminApi.md#createreseller) | **POST** /resellers | Create a reseller |
| [**CreateResellerPlan**](ResellersAdminApi.md#createresellerplan) | **POST** /reseller-plans | Create a reseller quota plan |
| [**DeleteReseller**](ResellersAdminApi.md#deletereseller) | **DELETE** /resellers/{resellerId} | Delete a reseller |
| [**DeleteResellerPlan**](ResellersAdminApi.md#deleteresellerplan) | **DELETE** /reseller-plans/{planId} | Delete a reseller quota plan |
| [**GetReseller**](ResellersAdminApi.md#getreseller) | **GET** /resellers/{resellerId} | Get a reseller |
| [**ListResellerPlans**](ResellersAdminApi.md#listresellerplans) | **GET** /reseller-plans | List reseller quota plans |
| [**ListResellers**](ResellersAdminApi.md#listresellers) | **GET** /resellers | List resellers |
| [**ResetResellerPassword**](ResellersAdminApi.md#resetresellerpassword) | **POST** /resellers/{resellerId}/reset-password | Reset a reseller&#39;s password |
| [**UnassignResellerCustomer**](ResellersAdminApi.md#unassignresellercustomer) | **DELETE** /resellers/{resellerId}/customers | Unlink a customer from a reseller |
| [**UnassignResellerNode**](ResellersAdminApi.md#unassignresellernode) | **DELETE** /resellers/{resellerId}/nodes | Revoke node access |
| [**UnassignResellerPlan**](ResellersAdminApi.md#unassignresellerplan) | **DELETE** /resellers/{resellerId}/plan | Clear a reseller&#39;s quota plan |
| [**UnassignResellerZone**](ResellersAdminApi.md#unassignresellerzone) | **DELETE** /resellers/{resellerId}/zones | Revoke IP-zone access |
| [**UpdateReseller**](ResellersAdminApi.md#updatereseller) | **POST** /resellers/{resellerId} | Update a reseller |
| [**UpdateResellerPlan**](ResellersAdminApi.md#updateresellerplan) | **POST** /reseller-plans/{planId} | Update a reseller quota plan |

<a id="assignresellercustomer"></a>
# **AssignResellerCustomer**
> Envelope AssignResellerCustomer (int resellerId, AssignResellerCustomerRequest assignResellerCustomerRequest)

Link a customer to a reseller

Quota-gated (`422` past the reseller's plan cap). Enterprise-only.

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
    public class AssignResellerCustomerExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.
            var assignResellerCustomerRequest = new AssignResellerCustomerRequest(); // AssignResellerCustomerRequest | 

            try
            {
                // Link a customer to a reseller
                Envelope result = apiInstance.AssignResellerCustomer(resellerId, assignResellerCustomerRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.AssignResellerCustomer: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the AssignResellerCustomerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Link a customer to a reseller
    ApiResponse<Envelope> response = apiInstance.AssignResellerCustomerWithHttpInfo(resellerId, assignResellerCustomerRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.AssignResellerCustomerWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |
| **assignResellerCustomerRequest** | [**AssignResellerCustomerRequest**](AssignResellerCustomerRequest.md) |  |  |

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
| **200** | Linked. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="assignresellernode"></a>
# **AssignResellerNode**
> Envelope AssignResellerNode (int resellerId, AssignResellerNodeRequest assignResellerNodeRequest)

Grant node access

Grants the reseller access to a (host, node) pair for placement and API guest creation.

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
    public class AssignResellerNodeExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.
            var assignResellerNodeRequest = new AssignResellerNodeRequest(); // AssignResellerNodeRequest | 

            try
            {
                // Grant node access
                Envelope result = apiInstance.AssignResellerNode(resellerId, assignResellerNodeRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.AssignResellerNode: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the AssignResellerNodeWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Grant node access
    ApiResponse<Envelope> response = apiInstance.AssignResellerNodeWithHttpInfo(resellerId, assignResellerNodeRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.AssignResellerNodeWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |
| **assignResellerNodeRequest** | [**AssignResellerNodeRequest**](AssignResellerNodeRequest.md) |  |  |

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
| **200** | Granted. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="assignresellerplan"></a>
# **AssignResellerPlan**
> Envelope AssignResellerPlan (int resellerId, AssignResellerPlanRequest assignResellerPlanRequest)

Assign a reseller quota plan

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
    public class AssignResellerPlanExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.
            var assignResellerPlanRequest = new AssignResellerPlanRequest(); // AssignResellerPlanRequest | 

            try
            {
                // Assign a reseller quota plan
                Envelope result = apiInstance.AssignResellerPlan(resellerId, assignResellerPlanRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.AssignResellerPlan: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the AssignResellerPlanWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Assign a reseller quota plan
    ApiResponse<Envelope> response = apiInstance.AssignResellerPlanWithHttpInfo(resellerId, assignResellerPlanRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.AssignResellerPlanWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |
| **assignResellerPlanRequest** | [**AssignResellerPlanRequest**](AssignResellerPlanRequest.md) |  |  |

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
| **200** | Assigned. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="assignresellerzone"></a>
# **AssignResellerZone**
> Envelope AssignResellerZone (int resellerId, AssignResellerZoneRequest assignResellerZoneRequest)

Grant IP-zone access

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
    public class AssignResellerZoneExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.
            var assignResellerZoneRequest = new AssignResellerZoneRequest(); // AssignResellerZoneRequest | 

            try
            {
                // Grant IP-zone access
                Envelope result = apiInstance.AssignResellerZone(resellerId, assignResellerZoneRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.AssignResellerZone: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the AssignResellerZoneWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Grant IP-zone access
    ApiResponse<Envelope> response = apiInstance.AssignResellerZoneWithHttpInfo(resellerId, assignResellerZoneRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.AssignResellerZoneWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |
| **assignResellerZoneRequest** | [**AssignResellerZoneRequest**](AssignResellerZoneRequest.md) |  |  |

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
| **200** | Granted. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="createreseller"></a>
# **CreateReseller**
> CreateReseller200Response CreateReseller (CreateResellerRequest createResellerRequest)

Create a reseller

Creates a `role=reseller` account with a generated password, returned once. Enterprise-only.

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
    public class CreateResellerExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var createResellerRequest = new CreateResellerRequest(); // CreateResellerRequest | 

            try
            {
                // Create a reseller
                CreateReseller200Response result = apiInstance.CreateReseller(createResellerRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.CreateReseller: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the CreateResellerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Create a reseller
    ApiResponse<CreateReseller200Response> response = apiInstance.CreateResellerWithHttpInfo(createResellerRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.CreateResellerWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **createResellerRequest** | [**CreateResellerRequest**](CreateResellerRequest.md) |  |  |

### Return type

[**CreateReseller200Response**](CreateReseller200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Reseller created. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="createresellerplan"></a>
# **CreateResellerPlan**
> CreateResellerPlan200Response CreateResellerPlan (ResellerPlanInput resellerPlanInput)

Create a reseller quota plan

`0` for any `max_*` cap means unlimited.

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
    public class CreateResellerPlanExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerPlanInput = new ResellerPlanInput(); // ResellerPlanInput | 

            try
            {
                // Create a reseller quota plan
                CreateResellerPlan200Response result = apiInstance.CreateResellerPlan(resellerPlanInput);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.CreateResellerPlan: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the CreateResellerPlanWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Create a reseller quota plan
    ApiResponse<CreateResellerPlan200Response> response = apiInstance.CreateResellerPlanWithHttpInfo(resellerPlanInput);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.CreateResellerPlanWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerPlanInput** | [**ResellerPlanInput**](ResellerPlanInput.md) |  |  |

### Return type

[**CreateResellerPlan200Response**](CreateResellerPlan200Response.md)

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
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="deletereseller"></a>
# **DeleteReseller**
> Envelope DeleteReseller (int resellerId)

Delete a reseller

Refuses (`422`) while the reseller still has customers assigned. Enterprise-only.

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
    public class DeleteResellerExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.

            try
            {
                // Delete a reseller
                Envelope result = apiInstance.DeleteReseller(resellerId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.DeleteReseller: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteResellerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete a reseller
    ApiResponse<Envelope> response = apiInstance.DeleteResellerWithHttpInfo(resellerId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.DeleteResellerWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |

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
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="deleteresellerplan"></a>
# **DeleteResellerPlan**
> Envelope DeleteResellerPlan (int planId)

Delete a reseller quota plan

Refuses (`422`) while a reseller still references the plan.

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
    public class DeleteResellerPlanExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var planId = 56;  // int | A reseller quota-plan id.

            try
            {
                // Delete a reseller quota plan
                Envelope result = apiInstance.DeleteResellerPlan(planId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.DeleteResellerPlan: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteResellerPlanWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete a reseller quota plan
    ApiResponse<Envelope> response = apiInstance.DeleteResellerPlanWithHttpInfo(planId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.DeleteResellerPlanWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **planId** | **int** | A reseller quota-plan id. |  |

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
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="getreseller"></a>
# **GetReseller**
> Envelope GetReseller (int resellerId)

Get a reseller

Detail plus assigned nodes, assigned IP zones, quota plan id, and current usage. Enterprise-only.

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
    public class GetResellerExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.

            try
            {
                // Get a reseller
                Envelope result = apiInstance.GetReseller(resellerId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.GetReseller: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetResellerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Get a reseller
    ApiResponse<Envelope> response = apiInstance.GetResellerWithHttpInfo(resellerId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.GetResellerWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |

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
| **200** | Reseller detail. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listresellerplans"></a>
# **ListResellerPlans**
> ListResellerPlans200Response ListResellerPlans (int? page = null, int? perPage = null)

List reseller quota plans

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
    public class ListResellerPlansExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var page = 1;  // int? | Page number, 1-based. (optional)  (default to 1)
            var perPage = 50;  // int? | Items per page, clamped to 1..200. (optional)  (default to 50)

            try
            {
                // List reseller quota plans
                ListResellerPlans200Response result = apiInstance.ListResellerPlans(page, perPage);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.ListResellerPlans: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListResellerPlansWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List reseller quota plans
    ApiResponse<ListResellerPlans200Response> response = apiInstance.ListResellerPlansWithHttpInfo(page, perPage);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.ListResellerPlansWithHttpInfo: " + e.Message);
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

[**ListResellerPlans200Response**](ListResellerPlans200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Reseller plans. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listresellers"></a>
# **ListResellers**
> ListResellers200Response ListResellers (int? page = null, int? perPage = null)

List resellers

Paginated list of `role=reseller` accounts. Never includes secrets. Enterprise-only.

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
    public class ListResellersExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var page = 1;  // int? | Page number, 1-based. (optional)  (default to 1)
            var perPage = 50;  // int? | Items per page, clamped to 1..200. (optional)  (default to 50)

            try
            {
                // List resellers
                ListResellers200Response result = apiInstance.ListResellers(page, perPage);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.ListResellers: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListResellersWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List resellers
    ApiResponse<ListResellers200Response> response = apiInstance.ListResellersWithHttpInfo(page, perPage);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.ListResellersWithHttpInfo: " + e.Message);
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

[**ListResellers200Response**](ListResellers200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Resellers. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="resetresellerpassword"></a>
# **ResetResellerPassword**
> Envelope ResetResellerPassword (int resellerId)

Reset a reseller's password

Generates a new password, returned once. Enterprise-only.

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
    public class ResetResellerPasswordExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.

            try
            {
                // Reset a reseller's password
                Envelope result = apiInstance.ResetResellerPassword(resellerId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.ResetResellerPassword: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ResetResellerPasswordWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Reset a reseller's password
    ApiResponse<Envelope> response = apiInstance.ResetResellerPasswordWithHttpInfo(resellerId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.ResetResellerPasswordWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |

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
| **200** | Password reset. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="unassignresellercustomer"></a>
# **UnassignResellerCustomer**
> Envelope UnassignResellerCustomer (int resellerId, AssignResellerCustomerRequest assignResellerCustomerRequest)

Unlink a customer from a reseller

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
    public class UnassignResellerCustomerExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.
            var assignResellerCustomerRequest = new AssignResellerCustomerRequest(); // AssignResellerCustomerRequest | 

            try
            {
                // Unlink a customer from a reseller
                Envelope result = apiInstance.UnassignResellerCustomer(resellerId, assignResellerCustomerRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.UnassignResellerCustomer: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UnassignResellerCustomerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Unlink a customer from a reseller
    ApiResponse<Envelope> response = apiInstance.UnassignResellerCustomerWithHttpInfo(resellerId, assignResellerCustomerRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.UnassignResellerCustomerWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |
| **assignResellerCustomerRequest** | [**AssignResellerCustomerRequest**](AssignResellerCustomerRequest.md) |  |  |

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
| **200** | Unlinked. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="unassignresellernode"></a>
# **UnassignResellerNode**
> Envelope UnassignResellerNode (int resellerId, AssignResellerNodeRequest assignResellerNodeRequest)

Revoke node access

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
    public class UnassignResellerNodeExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.
            var assignResellerNodeRequest = new AssignResellerNodeRequest(); // AssignResellerNodeRequest | 

            try
            {
                // Revoke node access
                Envelope result = apiInstance.UnassignResellerNode(resellerId, assignResellerNodeRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.UnassignResellerNode: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UnassignResellerNodeWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Revoke node access
    ApiResponse<Envelope> response = apiInstance.UnassignResellerNodeWithHttpInfo(resellerId, assignResellerNodeRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.UnassignResellerNodeWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |
| **assignResellerNodeRequest** | [**AssignResellerNodeRequest**](AssignResellerNodeRequest.md) |  |  |

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
| **200** | Revoked. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="unassignresellerplan"></a>
# **UnassignResellerPlan**
> Envelope UnassignResellerPlan (int resellerId)

Clear a reseller's quota plan

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
    public class UnassignResellerPlanExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.

            try
            {
                // Clear a reseller's quota plan
                Envelope result = apiInstance.UnassignResellerPlan(resellerId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.UnassignResellerPlan: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UnassignResellerPlanWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Clear a reseller's quota plan
    ApiResponse<Envelope> response = apiInstance.UnassignResellerPlanWithHttpInfo(resellerId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.UnassignResellerPlanWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |

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
| **200** | Cleared. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="unassignresellerzone"></a>
# **UnassignResellerZone**
> Envelope UnassignResellerZone (int resellerId, AssignResellerZoneRequest assignResellerZoneRequest)

Revoke IP-zone access

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
    public class UnassignResellerZoneExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.
            var assignResellerZoneRequest = new AssignResellerZoneRequest(); // AssignResellerZoneRequest | 

            try
            {
                // Revoke IP-zone access
                Envelope result = apiInstance.UnassignResellerZone(resellerId, assignResellerZoneRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.UnassignResellerZone: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UnassignResellerZoneWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Revoke IP-zone access
    ApiResponse<Envelope> response = apiInstance.UnassignResellerZoneWithHttpInfo(resellerId, assignResellerZoneRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.UnassignResellerZoneWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |
| **assignResellerZoneRequest** | [**AssignResellerZoneRequest**](AssignResellerZoneRequest.md) |  |  |

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
| **200** | Revoked. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="updatereseller"></a>
# **UpdateReseller**
> Envelope UpdateReseller (int resellerId, UpdateResellerRequest updateResellerRequest)

Update a reseller

Updates username, email, and active status. Enterprise-only.

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
    public class UpdateResellerExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var resellerId = 56;  // int | The panel's internal user id of a `role=reseller` account.
            var updateResellerRequest = new UpdateResellerRequest(); // UpdateResellerRequest | 

            try
            {
                // Update a reseller
                Envelope result = apiInstance.UpdateReseller(resellerId, updateResellerRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.UpdateReseller: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UpdateResellerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Update a reseller
    ApiResponse<Envelope> response = apiInstance.UpdateResellerWithHttpInfo(resellerId, updateResellerRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.UpdateResellerWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **resellerId** | **int** | The panel&#39;s internal user id of a &#x60;role&#x3D;reseller&#x60; account. |  |
| **updateResellerRequest** | [**UpdateResellerRequest**](UpdateResellerRequest.md) |  |  |

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
| **200** | Updated. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="updateresellerplan"></a>
# **UpdateResellerPlan**
> CreateResellerPlan200Response UpdateResellerPlan (int planId, ResellerPlanInput resellerPlanInput)

Update a reseller quota plan

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
    public class UpdateResellerPlanExample
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
            var apiInstance = new ResellersAdminApi(httpClient, config, httpClientHandler);
            var planId = 56;  // int | A reseller quota-plan id.
            var resellerPlanInput = new ResellerPlanInput(); // ResellerPlanInput | 

            try
            {
                // Update a reseller quota plan
                CreateResellerPlan200Response result = apiInstance.UpdateResellerPlan(planId, resellerPlanInput);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellersAdminApi.UpdateResellerPlan: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UpdateResellerPlanWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Update a reseller quota plan
    ApiResponse<CreateResellerPlan200Response> response = apiInstance.UpdateResellerPlanWithHttpInfo(planId, resellerPlanInput);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellersAdminApi.UpdateResellerPlanWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **planId** | **int** | A reseller quota-plan id. |  |
| **resellerPlanInput** | [**ResellerPlanInput**](ResellerPlanInput.md) |  |  |

### Return type

[**CreateResellerPlan200Response**](CreateResellerPlan200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Updated. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

