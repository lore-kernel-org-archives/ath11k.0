Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmdkE-0004iL-53
 for ath11k@lists.infradead.org; Tue, 08 Dec 2020 14:13:35 +0000
Received: by mail-oo1-xc32.google.com with SMTP id i7so4048085oot.8
 for <ath11k@lists.infradead.org>; Tue, 08 Dec 2020 06:13:33 -0800 (PST)
MIME-Version: 1.0
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 8 Dec 2020 15:13:20 +0100
Message-ID: <CA+HBbNEmeNb22Xys58wSP-jRUcCWoBxcphA7bZZw2P=PM-wGqw@mail.gmail.com>
Subject: IPQ8074 and IPQ6018 issues
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

Hi,
I am unable to get IPQ8074 as well as IPQ6018 working under kernel 5.10-rc6.

I am trying to bring up OpenWrt on Xiaomi AX3600 which is a popular
low-cost board with IPQ8071A.
ath11k will initialize, although board-id is received via QMI is
incorrect so it will default to 0xFF.
The issue is that VHT is not advertised at all and trying to use
anything higher than HS20 will result in a kernel crash.
I have tried hardcoding the correct board-id which in stock FW is
passed via DTS and using the bdwlan.bin from stock FW,
but it does not help.
Weirdly HS20 will work but with a lot of BSS survey not completed warnings.

Firmware used is: WLAN.HK.2.5.0.1.r1-00004-QCAHKSWPL_SILICONZ-1

For IPQ6018 I have a CP01-C1 reference board that reset without a
stack trace as soon as caldata is passed to the driver.
And then it will hang on SBL like in the attached log.

Firmware used is: WLAN.HK.2.5.0.1.r1-00004-QCAHKSWPL_SILICONZ-1

So, I am asking for any kind of advice as I am really stuck now.
I also have one IPQ6010 board coming next week to compare.

Regards,
Robert

IPQ8071A log:
[    8.614080] ath11k c000000.wifi: qmi ignore invalid mem req type 3
[    8.618926] ath11k c000000.wifi: chip_id 0x0 chip_family 0x0
board_id 0xff soc_id 0xffffffff
[    8.624300] ath11k c000000.wifi: fw_version 0x250a04a5
fw_build_timestamp 2020-10-20 07:23 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HK.2.5.0.1.r1-00004-QCAHKSWPL_SILICONZ-1
root@OpenWrt:/# iw phy
Wiphy phy2
        wiphy index: 2
        max # scan SSIDs: 16
        max scan IEs length: 152 bytes
        max # sched scan SSIDs: 0
        max # match sets: 0
        Retry short limit: 7
        Retry long limit: 4
        Coverage class: 0 (up to 0m)
        Device supports AP-side u-APSD.
        Available Antennas: TX 0x3 RX 0x3
        Configured Antennas: TX 0x3 RX 0x3
        Supported interface modes:
                 * managed
                 * AP
                 * monitor
                 * mesh point
        Band 1:
                Capabilities: 0x11ef
                        RX LDPC
                        HT20/HT40
                        SM Power Save disabled
                        RX HT20 SGI
                        RX HT40 SGI
                        TX STBC
                        RX STBC 1-stream
                        Max AMSDU length: 3839 bytes
                        DSSS/CCK HT40
                Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
                Minimum RX AMPDU time spacing: No restriction (0x00)
                HT TX/RX MCS rate indexes supported: 0-15
                Frequencies:
                        * 2412 MHz [1] (30.0 dBm)
                        * 2417 MHz [2] (30.0 dBm)
                        * 2422 MHz [3] (30.0 dBm)
                        * 2427 MHz [4] (30.0 dBm)
                        * 2432 MHz [5] (30.0 dBm)
                        * 2437 MHz [6] (30.0 dBm)
                        * 2442 MHz [7] (30.0 dBm)
                        * 2447 MHz [8] (30.0 dBm)
                        * 2452 MHz [9] (30.0 dBm)
                        * 2457 MHz [10] (30.0 dBm)
                        * 2462 MHz [11] (30.0 dBm)
                        * 2467 MHz [12] (disabled)
                        * 2472 MHz [13] (disabled)
                        * 2484 MHz [14] (disabled)
        valid interface combinations:
                 * #{ managed } <= 1, #{ AP, mesh point } <= 16,
                   total <= 16, #channels <= 1, STA/AP BI must match,
radar detect widths: { 20 MHz (no HT), 20 MHz, 40 MHz, 80 MHz }
        HT Capability overrides:
                 * MCS: ff ff ff ff ff ff ff ff ff ff
                 * maximum A-MSDU length
                 * supported channel width
                 * short GI for 40 MHz
                 * max A-MPDU length exponent
                 * min MPDU start spacing
        max # scan plans: 1
        max scan plan interval: -1
        max scan plan iterations: 0
        Maximum associated stations in AP mode: 512
        Supported extended features:
                * [ RRM ]: RRM
                * [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
                * [ CONTROL_PORT_OVER_NL80211 ]: control port over nl80211
                * [ STA_TX_PWR ]: TX power control per station
                * [ CONTROL_PORT_NO_PREAUTH ]: disable pre-auth over
nl80211 control port support
                * [ SCAN_FREQ_KHZ ]: scan on kHz frequency support
                * [ CONTROL_PORT_OVER_NL80211_TX_STATUS ]: tx status
for nl80211 control port support
Wiphy phy1
        wiphy index: 1
        max # scan SSIDs: 16
        max scan IEs length: 142 bytes
        max # sched scan SSIDs: 0
        max # match sets: 0
        Retry short limit: 7
        Retry long limit: 4
        Coverage class: 0 (up to 0m)
        Device supports AP-side u-APSD.
        Available Antennas: TX 0xf0 RX 0xf0
        Configured Antennas: TX 0xf0 RX 0xf0
        Supported interface modes:
                 * managed
                 * AP
                 * monitor
                 * mesh point
        Band 2:
                Capabilities: 0x19ef
                        RX LDPC
                        HT20/HT40
                        SM Power Save disabled
                        RX HT20 SGI
                        RX HT40 SGI
                        TX STBC
                        RX STBC 1-stream
                        Max AMSDU length: 7935 bytes
                        DSSS/CCK HT40
                Maximum RX AMPDU length 65535 bytes (exponent: 0x003)
                Minimum RX AMPDU time spacing: No restriction (0x00)
                HT TX/RX MCS rate indexes supported: 0-31
                VHT Capabilities (0x739bf9b2):
                        Max MPDU length: 11454
                        Supported Channel Width: neither 160 nor 80+80
                        RX LDPC
                        short GI (80 MHz)
                        TX STBC
                        SU Beamformer
                        SU Beamformee
                        MU Beamformer
                        MU Beamformee
                        RX antenna pattern consistency
                        TX antenna pattern consistency
                VHT RX MCS set:
                        1 streams: MCS 0-9
                        2 streams: MCS 0-9
                        3 streams: MCS 0-9
                        4 streams: MCS 0-9
                        5 streams: not supported
                        6 streams: not supported
                        7 streams: not supported
                        8 streams: not supported
                VHT RX highest supported: 0 Mbps
                VHT TX MCS set:
                        1 streams: MCS 0-9
                        2 streams: MCS 0-9
                        3 streams: MCS 0-9
                        4 streams: MCS 0-9
                        5 streams: not supported
                        6 streams: not supported
                        7 streams: not supported
                        8 streams: not supported
                VHT TX highest supported: 0 Mbps
                Frequencies:
                        * 5180 MHz [36] (30.0 dBm)
                        * 5200 MHz [40] (30.0 dBm)
                        * 5220 MHz [44] (30.0 dBm)
                        * 5240 MHz [48] (30.0 dBm)
                        * 5260 MHz [52] (24.0 dBm) (radar detection)
                        * 5280 MHz [56] (24.0 dBm) (radar detection)
                        * 5300 MHz [60] (24.0 dBm) (radar detection)
                        * 5320 MHz [64] (24.0 dBm) (radar detection)
                        * 5500 MHz [100] (24.0 dBm) (radar detection)
                        * 5520 MHz [104] (24.0 dBm) (radar detection)
                        * 5540 MHz [108] (24.0 dBm) (radar detection)
                        * 5560 MHz [112] (24.0 dBm) (radar detection)
                        * 5580 MHz [116] (24.0 dBm) (radar detection)
                        * 5600 MHz [120] (24.0 dBm) (radar detection)
                        * 5620 MHz [124] (24.0 dBm) (radar detection)
                        * 5640 MHz [128] (24.0 dBm) (radar detection)
                        * 5660 MHz [132] (24.0 dBm) (radar detection)
                        * 5680 MHz [136] (24.0 dBm) (radar detection)
                        * 5700 MHz [140] (24.0 dBm) (radar detection)
                        * 5720 MHz [144] (24.0 dBm) (radar detection)
                        * 5745 MHz [149] (30.0 dBm)
                        * 5765 MHz [153] (30.0 dBm)
                        * 5785 MHz [157] (30.0 dBm)
                        * 5805 MHz [161] (30.0 dBm)
                        * 5825 MHz [165] (30.0 dBm)
                        * 5845 MHz [169] (disabled)
                        * 5865 MHz [173] (disabled)
        valid interface combinations:
                 * #{ managed } <= 1, #{ AP, mesh point } <= 16,
                   total <= 16, #channels <= 1, STA/AP BI must match,
radar detect widths: { 20 MHz (no HT), 20 MHz, 40 MHz, 80 MHz }
        HT Capability overrides:
                 * MCS: ff ff ff ff ff ff ff ff ff ff
                 * maximum A-MSDU length
                 * supported channel width
                 * short GI for 40 MHz
                 * max A-MPDU length exponent
                 * min MPDU start spacing
        max # scan plans: 1
        max scan plan interval: -1
        max scan plan iterations: 0
        Maximum associated stations in AP mode: 512
        Supported extended features:
                * [ RRM ]: RRM
                * [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
                * [ CONTROL_PORT_OVER_NL80211 ]: control port over nl80211
                * [ STA_TX_PWR ]: TX power control per station
                * [ CONTROL_PORT_NO_PREAUTH ]: disable pre-auth over
nl80211 control port support
                * [ SCAN_FREQ_KHZ ]: scan on kHz frequency support
                * [ CONTROL_PORT_OVER_NL80211_TX_STATUS ]: tx status
for nl80211 control port support

IPQ6018 log:

[    6.410736] ath11k c000000.wifi: qmi ignore invalid mem req type 3
[    6.411305] ath11k c000000.wifi: chip_id 0x0 chip_family 0x4
board_id 0xff soc_id 0xffffffff
[    6.415888] ath11k c000000.wifi: fw_version 0x250a0004
fw_build_timestamp 2020-10-20 07:32 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HK.2.5.0.1.r1-00004-QCAHKSWPL_SILICONZ-1
[    6.426589] kmodloader: done loading kernel modules from /etc/modules.d/*
Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.XF.0.3-00090-IPQ60xxLZB-2
S - IMAGE_VARIANT_STRING=IPQ6018LA
S - OEM_IMAGE_VERSION_STRING=crm-ubuntu47
S - Boot Interface: SPI
S - Secure Boot: Off
S - Boot Config @ 0x000a602c = 0x000002e0
S - JTAG ID @ 0x000a607c = 0x001260e1
S - OEM ID @ 0x000a6080 = 0x00000000
S - Serial Number @ 0x000a4128 = 0x2c6f3fc1
S - OEM Config Row 0 @ 0x000a4188 = 0x0000000000000000
S - OEM Config Row 1 @ 0x000a4190 = 0x0000000000000000
S - Feature Config Row 0 @ 0x000a4130 = 0x0000000008200000
S - Feature Config Row 1 @ 0x000a4138 = 0x02c3e80383000009
S - PBL Patch Ver: 0
S - I-cache: On
S - D-cache: On
B -      3413 - PBL, Start
B -       592 - bootable_media_detect_entry, Start
B -      4335 - bootable_media_detect_success, Start
B -      4431 - elf_loader_entry, Start
B -      4603 - auth_hash_seg_entry, Start
B -     10849 - auth_hash_seg_exit, Start
B -     11343 - elf_segs_hash_verify_entry, Start
B -    357518 - elf_segs_hash_verify_exit, Start
B -    361700 - auth_xbl_sec_hash_seg_entry, Start
B -    361845 - auth_xbl_sec_hash_seg_exit, Start
B -    368388 - xbl_sec_segs_hash_verify_entry, Start
B -    368389 - xbl_sec_segs_hash_verify_exit, Start
B -    369318 - PBL, End
B -    295606 - SBL1, Start
B -    438437 - GCC [RstStat:0x2, RstDbg:0x420100] WDog Stat : 0x4
B -    440908 - clock_init, Start
D -      2592 - clock_init, Delta
B -    449387 - boot_flash_init, Start
D -      8357 - boot_flash_init, Delta
B -    461007 - sbl1_ddr_set_default_params, Start
D -       335 - sbl1_ddr_set_default_params, Delta
B -    467626 - boot_config_data_table_init, Start
D -      1952 - boot_config_data_table_init, Delta - (575 Bytes)
B -    476745 - CDT Version:2,Platform ID:8,Major ID:3,Minor ID:0,Subtype:0
B -    482296 - Image Load, Start
D -      6588 - OEM_MISC Image Loaded, Delta - (0 Bytes)
B -    491629 - Image Load, Start
D -      5063 - PMIC Image Loaded, Delta - (0 Bytes)
B -    499498 - sbl1_ddr_set_params, Start
B -    504561 - CPR configuration: 0x366
B -    507703 - Pre_DDR_clock_init, Start
D -       213 - Pre_DDR_clock_init, Delta
D -         0 - sbl1_ddr_set_params, Delta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
