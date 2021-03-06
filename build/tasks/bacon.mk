# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
# Copyright (C) 2019 The ion-OS Project
# Copyright (C) 2019 The Ancient-OS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ANCIENT_TARGET_PACKAGE := $(PRODUCT_OUT)/$(ANCIENT_VERSION).zip

MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(ANCIENT_TARGET_PACKAGE)
	$(hide) $(MD5) $(ANCIENT_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(ANCIENT_TARGET_PACKAGE).md5sum
	$(hide) ./vendor/ancient/tools/generate_json_build_info.sh $(ANCIENT_TARGET_PACKAGE)
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}Ancient ${txtrst}";
	@echo -e ""
	@echo -e ${CL_GRN}" ▄▄▄       ███▄    █  ▄████▄   ██▓▓█████  ███▄    █ ▄▄▄█████▓ "
	@echo -e ${CL_GRN}"▒████▄     ██ ▀█   █ ▒██▀ ▀█  ▓██▒▓█   ▀  ██ ▀█   █ ▓  ██▒ ▓▒ "
	@echo -e ${CL_GRN}"▒██  ▀█▄  ▓██  ▀█ ██▒▒▓█    ▄ ▒██▒▒███   ▓██  ▀█ ██▒▒ ▓██░ ▒░ "
	@echo -e ${CL_GRN}"░██▄▄▄▄██ ▓██▒  ▐▌██▒▒▓▓▄ ▄██▒░██░▒▓█  ▄ ▓██▒  ▐▌██▒░ ▓██▓ ░  "
	@echo -e ${CL_GRN}" ▓█   ▓██▒▒██░   ▓██░▒ ▓███▀ ░░██░░▒████▒▒██░   ▓██░  ▒██▒ ░  "
	@echo -e ${CL_GRN}" ▒▒   ▓▒█░░ ▒░   ▒ ▒ ░ ░▒ ▒  ░░▓  ░░ ▒░ ░░ ▒░   ▒ ▒   ▒ ░░    "
	@echo -e ${CL_GRN}"  ▒   ▒▒ ░░ ░░   ░ ▒░  ░  ▒    ▒ ░ ░ ░  ░░ ░░   ░ ▒░    ░     "
	@echo -e ${CL_GRN}"  ░   ▒      ░   ░ ░ ░         ▒ ░   ░      ░   ░ ░   ░       "
	@echo -e ${CL_GRN}"      ░  ░         ░ ░ ░       ░     ░  ░         ░           "
	@echo -e ${CL_GRN}"                     ░					 "
	@echo -e ""
	@echo -e "Package Complete: $(ANCIENT_TARGET_PACKAGE)" >&2
	@echo -e "md5: `cat $(ANCIENT_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"
	@echo -e "size:`ls -lah $(ANCIENT_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""
