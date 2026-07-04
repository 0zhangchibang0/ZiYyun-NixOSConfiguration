{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS 官方软件源，这里使用 nixos-26.05 分支
    nixpkgs.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-26.05&shallow=1";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # TODO 请将下面的 my-nixos 替换成你的 hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        # 这里导入之前我们使用的 configuration.nix，
        # 这样旧的配置文件仍然能生效
        ./configuration.nix

	./kdePackages.nix



     home-manager.nixosModules.home-manager
        {
          # Home Manager 全局设置
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # 为你的用户 'ziyun' 加载 Home Manager 配置
          home-manager.users.ziyun = import ./home.nix;   # 需要创建这个文件
        }
      ];
    };
  };
}
