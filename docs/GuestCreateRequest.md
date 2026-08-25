# NexoVirt.Sdk.Model.GuestCreateRequest
Common fields apply to both types. QEMU additionally requires `os_template`. LXC requires exactly one of `lxc_template_id` or `os_template`. `password` is required unless at least one SSH key is present, either via `ssh_keys[]` or an `owner_id` with stored keys. 

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Type** | **string** |  | 
**Node** | **string** | Target PVE node name. | 
**Vmid** | **int** | A positive, free VMID. Get one from GET /hosts/{hostId}/next-vmid. | 
**Name** | **string** | Guest name/hostname. Defaults to vm-&lt;vmid&gt; or ct-&lt;vmid&gt;. | [optional] 
**PlanId** | **int** | A plan id from GET /hosts/{hostId}/plans. Fills and locks cores/memory_mb/disk_gb. | [optional] 
**Cores** | **int** | Explicit spec when no plan_id is given. | [optional] [default to 1]
**MemoryMb** | **int** | Explicit spec when no plan_id is given. | [optional] [default to 512]
**DiskGb** | **int** | Explicit spec when no plan_id is given. | [optional] [default to 8]
**Storage** | **string** | Storage id for the root disk, from GET /hosts/{hostId}/storages. | [optional] 
**Bridge** | **string** | Network bridge, from GET /hosts/{hostId}/networks. | [optional] [default to "vmbr0"]
**OsTemplate** | **string** | Required for QEMU as tpl:&lt;id&gt; from GET /hosts/{hostId}/os-templates. For LXC, an alternative to lxc_template_id, a raw vztmpl volid from GET /hosts/{hostId}/ct-templates.  | [optional] 
**LxcTemplateId** | **int** | LXC only, a managed CT template id from GET /hosts/{hostId}/ct-templates. | [optional] 
**IpSource** | **string** | dhcp (default) or zone:&lt;id&gt; from GET /hosts/{hostId}/ip-zones to allocate a static IP. | [optional] [default to "dhcp"]
**Password** | **string** | Root password. Required unless an SSH key is present. | [optional] 
**SshKeys** | **List&lt;string&gt;** | Public key bodies, merged with the owner&#39;s stored keys. | [optional] 
**OwnerId** | **int** | Assigns ownership. The owner&#39;s stored SSH keys are auto-injected. | [optional] 
**SnapshotLimit** | **int** | Max snapshots for this guest. | [optional] 
**FirewallPresets** | **List&lt;int&gt;** | Firewall preset ids to apply. | [optional] 
**ExtraStorage** | **List&lt;string&gt;** | Parallel array with extra_size/extra_mount, additional disk storage ids. | [optional] 
**ExtraSize** | **List&lt;int&gt;** | Parallel array with extra_storage/extra_mount, additional disk sizes in GB. | [optional] 
**ExtraMount** | **List&lt;string&gt;** | Parallel array with extra_storage/extra_size, LXC-only mount paths. Must be absolute paths; blank defaults to /mnt/disk&lt;N&gt;.  | [optional] 
**Unprivileged** | **bool** | LXC only. Create an unprivileged container. Omitted keeps PVE&#39;s default (privileged). For Docker in an unprivileged container also set nesting + keyctl.  | [optional] 
**Nesting** | **bool** | LXC only. Adds nesting&#x3D;1 to the container features (run Docker / systemd / nested containers). | [optional] 
**Keyctl** | **bool** | LXC only. Adds keyctl&#x3D;1 (required for Docker inside an unprivileged container). | [optional] 
**Fuse** | **bool** | LXC only. Adds fuse&#x3D;1 (allow FUSE mounts inside the container). | [optional] 
**Mount** | **string** | LXC only. Comma/semicolon list of mount types to allow (allow-listed: nfs, cifs). Invalid types return 422. | [optional] 
**Bios** | **string** | QEMU only. Firmware. ovmf (UEFI) also allocates an EFI disk on the chosen storage. Unrecognised values are ignored. | [optional] 
**Machine** | **string** | QEMU only. Machine type. Unrecognised values are ignored. | [optional] 
**Cpu** | **string** | QEMU only. CPU type. Unrecognised values are ignored. | [optional] 
**Vga** | **string** | QEMU only. Display adapter. Unrecognised values are ignored. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

