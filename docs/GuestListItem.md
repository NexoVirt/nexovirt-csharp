# NexoVirt.Sdk.Model.GuestListItem

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**HostId** | **int** |  | [optional] 
**Host** | **string** |  | [optional] 
**Node** | **string** |  | [optional] 
**Vmid** | **int** |  | [optional] 
**Name** | **string** |  | [optional] 
**Type** | **string** |  | [optional] 
**Status** | **string** |  | [optional] 
**Os** | **string** | The PVE ostype. | [optional] 
**Ip** | **string** |  | [optional] 
**Cores** | **int** |  | [optional] 
**Mem** | **int** | Configured max memory in bytes. | [optional] 
**Storage** | **int** | Configured max disk in bytes. | [optional] 
**QemuAgent** | **bool?** | Whether the QEMU guest agent is enabled. Null for LXC or when unknown. | [optional] 
**Tags** | **string** | PVE tags, semicolon-joined (empty string when none). Searchable in the panel. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

