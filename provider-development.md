- 1. 在 home 目录下创建`.terraformrc`文件，必须在执行 terraform 命令所使用的用户的 home 目录下，内容如下：

  ```
  provider_installation {
      dev_overrides {
          "huaweicloud/huaweicloud" = "/home/huawei/terraform-provider"
          "huaweicloud/hcs" = "/home/huawei/terraform-provider"
      }
      direct {}
  }
  ```

  + `"huaweicloud/huaweicloud" = "/home/huawei/terraform-provider"` 说明：
  
    * 等号左边的 `"huaweicloud/huaweicloud"` 是在terraform脚本中的source的内容
    
       ![image](https://github.com/user-attachments/assets/486312e4-82ad-4e26-9323-8d898b395860)
      
    * 等号右边的 `"/home/huawei/terraform-provider"` 是实际 provider 插件的目录。


  + 参考我的配置：我执行 terraform 的用户是 huawei，配置文件内容如下：
  
    ![image](https://github.com/user-attachments/assets/501b6d2e-3354-402f-bbaa-0f288ad6653d)
  
    因为我需要根据代码编译 provider，因此我的配置的目录的二进制目录是gopath目录。

- 2. 从 git 仓库中下载对应版本的 provider，将二进制文件解压到 `/home/huawei/terraform-provider` 目录，如下所示：

  ![image](https://github.com/user-attachments/assets/dc0924e1-cc30-461b-88a9-1545616b7546)

  只需要二进制文件即可，其他的文件可以忽略。

- 3. 在脚本中配置terraform provider时，与正常写法一致，如下：

  ```
  terraform {
    required_providers {
      huaweicloud = {
        source  = "huaweicloud/huaweicloud"
        version = ">= 1.36.0" # 版本号可以省略，因为会强行使用本地的，从而忽略版本号。
      }
    }
  }
  ```
- 4. 运行脚本：开发模式不需要执行 terraform init，可以执行 terraform plan、apply 等命令，如出现如下提示，则证明优先使用本地的二进制文件：
     
  ![image](https://github.com/user-attachments/assets/865537d6-6d2a-4d11-894c-9d36cc7130d3)


