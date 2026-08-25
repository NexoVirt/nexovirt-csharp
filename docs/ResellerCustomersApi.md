# NexoVirt.Sdk.Api.ResellerCustomersApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**CreateResellerCustomer**](ResellerCustomersApi.md#createresellercustomer) | **POST** /customers | Create a customer |
| [**DeleteResellerCustomer**](ResellerCustomersApi.md#deleteresellercustomer) | **DELETE** /customers/{customerId} | Delete a customer |
| [**GetResellerCustomer**](ResellerCustomersApi.md#getresellercustomer) | **GET** /customers/{customerId} | Get a customer |
| [**ListResellerCustomers**](ResellerCustomersApi.md#listresellercustomers) | **GET** /customers | List my customers |
| [**ResellerPing**](ResellerCustomersApi.md#resellerping) | **GET** /ping | Auth probe |
| [**ResetResellerCustomerPassword**](ResellerCustomersApi.md#resetresellercustomerpassword) | **POST** /customers/{customerId}/reset-password | Reset a customer&#39;s password |
| [**UpdateResellerCustomer**](ResellerCustomersApi.md#updateresellercustomer) | **PATCH** /customers/{customerId} | Update a customer |
| [**UpdateResellerCustomerPost**](ResellerCustomersApi.md#updateresellercustomerpost) | **POST** /customers/{customerId} | Update a customer (POST alias) |

<a id="createresellercustomer"></a>
# **CreateResellerCustomer**
> CreateReseller200Response CreateResellerCustomer (CreateResellerRequest createResellerRequest)

Create a customer

Creates a customer under the calling reseller. Quota-gated (`422` past the reseller's plan cap).

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
    public class CreateResellerCustomerExample
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
            var apiInstance = new ResellerCustomersApi(httpClient, config, httpClientHandler);
            var createResellerRequest = new CreateResellerRequest(); // CreateResellerRequest | 

            try
            {
                // Create a customer
                CreateReseller200Response result = apiInstance.CreateResellerCustomer(createResellerRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerCustomersApi.CreateResellerCustomer: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the CreateResellerCustomerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Create a customer
    ApiResponse<CreateReseller200Response> response = apiInstance.CreateResellerCustomerWithHttpInfo(createResellerRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerCustomersApi.CreateResellerCustomerWithHttpInfo: " + e.Message);
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

[resellerBearerAuth](../README.md#resellerBearerAuth)

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

<a id="deleteresellercustomer"></a>
# **DeleteResellerCustomer**
> Envelope DeleteResellerCustomer (int customerId)

Delete a customer

Refuses (`422`) while the customer still owns guests.

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
    public class DeleteResellerCustomerExample
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
            var apiInstance = new ResellerCustomersApi(httpClient, config, httpClientHandler);
            var customerId = 56;  // int | The panel's internal user id of one of the calling reseller's own customers.

            try
            {
                // Delete a customer
                Envelope result = apiInstance.DeleteResellerCustomer(customerId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerCustomersApi.DeleteResellerCustomer: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteResellerCustomerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete a customer
    ApiResponse<Envelope> response = apiInstance.DeleteResellerCustomerWithHttpInfo(customerId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerCustomersApi.DeleteResellerCustomerWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **customerId** | **int** | The panel&#39;s internal user id of one of the calling reseller&#39;s own customers. |  |

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

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="getresellercustomer"></a>
# **GetResellerCustomer**
> Envelope GetResellerCustomer (int customerId)

Get a customer

`404` if this customer does not belong to the calling reseller.

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
    public class GetResellerCustomerExample
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
            var apiInstance = new ResellerCustomersApi(httpClient, config, httpClientHandler);
            var customerId = 56;  // int | The panel's internal user id of one of the calling reseller's own customers.

            try
            {
                // Get a customer
                Envelope result = apiInstance.GetResellerCustomer(customerId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerCustomersApi.GetResellerCustomer: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GetResellerCustomerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Get a customer
    ApiResponse<Envelope> response = apiInstance.GetResellerCustomerWithHttpInfo(customerId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerCustomersApi.GetResellerCustomerWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **customerId** | **int** | The panel&#39;s internal user id of one of the calling reseller&#39;s own customers. |  |

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
| **200** | Customer detail. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listresellercustomers"></a>
# **ListResellerCustomers**
> ListResellerCustomers200Response ListResellerCustomers (int? page = null, int? perPage = null)

List my customers

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
    public class ListResellerCustomersExample
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
            var apiInstance = new ResellerCustomersApi(httpClient, config, httpClientHandler);
            var page = 1;  // int? | Page number, 1-based. (optional)  (default to 1)
            var perPage = 50;  // int? | Items per page, clamped to 1..200. (optional)  (default to 50)

            try
            {
                // List my customers
                ListResellerCustomers200Response result = apiInstance.ListResellerCustomers(page, perPage);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerCustomersApi.ListResellerCustomers: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListResellerCustomersWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List my customers
    ApiResponse<ListResellerCustomers200Response> response = apiInstance.ListResellerCustomersWithHttpInfo(page, perPage);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerCustomersApi.ListResellerCustomersWithHttpInfo: " + e.Message);
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

[**ListResellerCustomers200Response**](ListResellerCustomers200Response.md)

### Authorization

[resellerBearerAuth](../README.md#resellerBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The calling reseller&#39;s customers only. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="resellerping"></a>
# **ResellerPing**
> Envelope ResellerPing ()

Auth probe

Verifies the reseller token and returns the calling reseller's id. Useful for a quick connectivity/credential check.

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
    public class ResellerPingExample
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
            var apiInstance = new ResellerCustomersApi(httpClient, config, httpClientHandler);

            try
            {
                // Auth probe
                Envelope result = apiInstance.ResellerPing();
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerCustomersApi.ResellerPing: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ResellerPingWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Auth probe
    ApiResponse<Envelope> response = apiInstance.ResellerPingWithHttpInfo();
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerCustomersApi.ResellerPingWithHttpInfo: " + e.Message);
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
| **200** | Token is valid. |  -  |
| **401** | Missing or invalid bearer token. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="resetresellercustomerpassword"></a>
# **ResetResellerCustomerPassword**
> Envelope ResetResellerCustomerPassword (int customerId)

Reset a customer's password

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
    public class ResetResellerCustomerPasswordExample
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
            var apiInstance = new ResellerCustomersApi(httpClient, config, httpClientHandler);
            var customerId = 56;  // int | The panel's internal user id of one of the calling reseller's own customers.

            try
            {
                // Reset a customer's password
                Envelope result = apiInstance.ResetResellerCustomerPassword(customerId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerCustomersApi.ResetResellerCustomerPassword: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ResetResellerCustomerPasswordWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Reset a customer's password
    ApiResponse<Envelope> response = apiInstance.ResetResellerCustomerPasswordWithHttpInfo(customerId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerCustomersApi.ResetResellerCustomerPasswordWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **customerId** | **int** | The panel&#39;s internal user id of one of the calling reseller&#39;s own customers. |  |

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
| **200** | Password reset. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="updateresellercustomer"></a>
# **UpdateResellerCustomer**
> Envelope UpdateResellerCustomer (int customerId, UpdateResellerRequest updateResellerRequest)

Update a customer

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
    public class UpdateResellerCustomerExample
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
            var apiInstance = new ResellerCustomersApi(httpClient, config, httpClientHandler);
            var customerId = 56;  // int | The panel's internal user id of one of the calling reseller's own customers.
            var updateResellerRequest = new UpdateResellerRequest(); // UpdateResellerRequest | 

            try
            {
                // Update a customer
                Envelope result = apiInstance.UpdateResellerCustomer(customerId, updateResellerRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerCustomersApi.UpdateResellerCustomer: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UpdateResellerCustomerWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Update a customer
    ApiResponse<Envelope> response = apiInstance.UpdateResellerCustomerWithHttpInfo(customerId, updateResellerRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerCustomersApi.UpdateResellerCustomerWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **customerId** | **int** | The panel&#39;s internal user id of one of the calling reseller&#39;s own customers. |  |
| **updateResellerRequest** | [**UpdateResellerRequest**](UpdateResellerRequest.md) |  |  |

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
| **200** | Updated. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="updateresellercustomerpost"></a>
# **UpdateResellerCustomerPost**
> Envelope UpdateResellerCustomerPost (int customerId, UpdateResellerRequest updateResellerRequest)

Update a customer (POST alias)

Identical to `PATCH /customers/{customerId}`, for clients that cannot send PATCH.

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
    public class UpdateResellerCustomerPostExample
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
            var apiInstance = new ResellerCustomersApi(httpClient, config, httpClientHandler);
            var customerId = 56;  // int | The panel's internal user id of one of the calling reseller's own customers.
            var updateResellerRequest = new UpdateResellerRequest(); // UpdateResellerRequest | 

            try
            {
                // Update a customer (POST alias)
                Envelope result = apiInstance.UpdateResellerCustomerPost(customerId, updateResellerRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerCustomersApi.UpdateResellerCustomerPost: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UpdateResellerCustomerPostWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Update a customer (POST alias)
    ApiResponse<Envelope> response = apiInstance.UpdateResellerCustomerPostWithHttpInfo(customerId, updateResellerRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerCustomersApi.UpdateResellerCustomerPostWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **customerId** | **int** | The panel&#39;s internal user id of one of the calling reseller&#39;s own customers. |  |
| **updateResellerRequest** | [**UpdateResellerRequest**](UpdateResellerRequest.md) |  |  |

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
| **200** | Updated. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

