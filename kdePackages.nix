# KDE SoftWare Packages
# Created by ziyun 26.6.28


{ config, pkgs, ... }:

{


	environment.systemPackages = with pkgs; [

	kdePackages.discover
	kdePackages.marble







	];





}
