# NexoVirt.Sdk.Model.GetNode200Response

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Success** | **bool** |  | 
**Data** | **Dictionary&lt;string, Object&gt;** | A live PVE node status object, passed through from Proxmox (CPU info, memory, root filesystem, load average, PVE version, and more). Field set varies by Proxmox VE version.  | 
**Error** | **string** | A human-readable error message, null on success. | 
**Meta** | [**PaginationMeta**](PaginationMeta.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

