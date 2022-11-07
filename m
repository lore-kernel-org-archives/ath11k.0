Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59699C43217
	for <ath11k@archiver.kernel.org>; Mon,  7 Nov 2022 18:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXZGPCyAawCDi64a6KaTl7SpLBDOubegSrWDzypmmbQ=; b=3RlSwoL8Il5jfF
	SRnuUl2sk0TZk/f6EuEFqQ5z+ACBIBmSFLQDbBkoyishepg2l/7rNcoHP4fMMZZpE19kddUHcvHX8
	DTv1Z7Kvi/0Ae6QU/cV6MVrmCyOH3BBw/FjShDJdxsXrd3kfsSy4DfGslClip7EvPbVaAXTOzXg4/
	RNuzVBn/jctZ4SphyYqY8vLx/VANNeyTGeAoEv5CiLtGzgsy5mA8tsl9ELNI+WJMv237xz38Cq6HU
	A4bCDN337s4SnNsUttgt0F6PaH51c5HRLNhrUJmznHaeEr94KUyJMHu9wieFfaVpW2uyl5JgxxVw2
	rZp/vvIov3GCbwjVAZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7K7-00HMVK-0T; Mon, 07 Nov 2022 18:58:19 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7JB-00HLjS-P2
	for ath11k@lists.infradead.org; Mon, 07 Nov 2022 18:57:24 +0000
Received: by mail-lj1-x22d.google.com with SMTP id x21so17708201ljg.10
        for <ath11k@lists.infradead.org>; Mon, 07 Nov 2022 10:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BxsRX5k9EoqN/hdfNpY8zobDT0NoPPTzyefle0lKfE=;
        b=p1QUI303QHZWIe8pyyPCklFntCUWa5FfsaXErrJLAGoYR/8+bs7P/g52tfIiBw6ziw
         N9DlG9jZs+eaZAbLJenpOezYi0QLv9uo6TjDoh1MVbh7tUVbdoqkqOw1urrFjEUbbqpG
         8BSG3J30ucDz/+RDP4/TrnJxw0uUMZRIoYql6XsvIsu5CFuVPPzq+Jb+4Fq3wlYIF96G
         Y6kau5gpqh+vf7WtSAd78Z3jfTp05Krf8HNUPccmUS0v1/SbMQz6lIpYWmTUANFAVFLF
         bp3s6ADVVQTiRrSh0EOjRtAJd3Y63QpbMn/XCMueZigOg0wsxgBg7MrTp6ptvGfT2W6H
         4zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BxsRX5k9EoqN/hdfNpY8zobDT0NoPPTzyefle0lKfE=;
        b=BZgEyggyqSwAmDqKwU+frm4G6CVYLGo+n/Cgdw8qzfkOuD3HHafn3GhFJ+6L1XHcVp
         lIRTM6M+qbWdQRVaed7iunWx9cCcg53xveTRxhEEu+nqje4l9vjd3cwqilmbszXL0B66
         yeDXOK9jMfAFXqcv16wDS5Fu+WwHuEWEGgsiLppbK8fpFMp+U5tIOXWXHaCA5RrxbyNy
         FBprMGqEz4QYZuzrI908oV75rGBkXNHxiD2pVSzFC1b1RAbxHokuSyoYk7MvXg3+Clr+
         jR+3hXyWysxGBcXyYqbdv2Mso5GkYHSi0ZdRhhRqGifd8vJ/bEQ4uPXyxDObOOmQQuG6
         DlNw==
X-Gm-Message-State: ACrzQf1xwG+jRamoKlGdYDTFsQsAa3q2tYGE9+tSeauYJpQ90y/yPUi+
	piVOnyi6j5+TY0pA0/kDqeU/vKr5wS2GRixwuU5z0wfrEpr8/vZl
X-Google-Smtp-Source: AMsMyM58K5SOeNlqhzYlNlmPTIqsIyUjSQAwv3xLodMnMaqflX2IdY6xmMcHvbvDpvvNDeTSzkGWCTgNx5tI4gGRin4=
X-Received: by 2002:a2e:58e:0:b0:277:9f5:3538 with SMTP id 136-20020a2e058e000000b0027709f53538mr17450542ljf.445.1667847434303;
 Mon, 07 Nov 2022 10:57:14 -0800 (PST)
MIME-Version: 1.0
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org> <MW2PR02MB3899226DC8F4EED0BF9A66ABED3C9@MW2PR02MB3899.namprd02.prod.outlook.com>
In-Reply-To: <MW2PR02MB3899226DC8F4EED0BF9A66ABED3C9@MW2PR02MB3899.namprd02.prod.outlook.com>
From: Mariusz <enebeo@gmail.com>
Date: Mon, 7 Nov 2022 19:57:03 +0100
Message-ID: <CAJrE-q5fjo-Q_dYpp_q+vdE62d97XqsBucFrprxW+hXpYXJB3A@mail.gmail.com>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
To: "Nagarajan Maran (QUIC)" <quic_nmaran@quicinc.com>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_105721_881144_FA851F2C 
X-CRM114-Status: GOOD (  21.65  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi!

To start I am trying to use it as SoftAP not a 6E client. I did some
research and in part this issue appears to be due to a wrong board_id.
It is set to 0xff = 255 which is not loading 6GHz firmware but a
default 255 firmware from board-2.bin blob. I extracted from
board-2.bin firmware for board 162 and renamed it to board.bin. Now
the module is loading firmware with Band 4 and 6GHz channels. But it
would be too beautiful that it works right away, so it is pretending
to be working but when set to mode master (SoftAP) in hostapd, none of
my Intel AX210 160Mhz client is able to see this ssid. I am attaching
what I have collected so far.

1.
root@s4:/usr/lib/modules/5.19.
0-23-generic/kernel/drivers/net/wireless/ath/ath11k#
rmmod ath11k_pci
root@s4:/usr/lib/modules/5.19.0-23-generic/kernel/drivers/net/wireless/ath/ath11k#
rmmod ath11k
root@s4:/usr/lib/modules/5.19.0-23-generic/kernel/drivers/net/wireless/ath/ath11k#
insmod ath11k.ko debug_mask=0x212
root@s4:/usr/lib/modules/5.19.0-23-generic/kernel/drivers/net/wireless/ath/ath11k#
insmod ath11k_pci.ko

2.
Nov  7 18:01:08 s4 systemd[1]: systemd-rfkill.service: Deactivated successfully.
Nov  7 18:01:29 s4 kernel: [ 3734.630406] ath11k_pci 0000:01:00.0: BAR
0: assigned [mem 0xf7c00000-0xf7dfffff 64bit]
Nov  7 18:01:29 s4 kernel: [ 3734.630515] ath11k_pci 0000:01:00.0: MSI
vectors: 1
Nov  7 18:01:29 s4 kernel: [ 3734.630522] ath11k_pci 0000:01:00.0: qcn9074 hw1.0
Nov  7 18:01:29 s4 kernel: [ 3734.784909] mhi mhi0: Requested to power ON
Nov  7 18:01:29 s4 kernel: [ 3734.785124] mhi mhi0: Power on setup success
Nov  7 18:01:29 s4 kernel: [ 3734.886704] mhi mhi0: Wait for device to
enter SBL or Mission mode
Nov  7 18:01:29 s4 kernel: [ 3735.257623] ath11k_pci 0000:01:00.0:
chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff
Nov  7 18:01:29 s4 kernel: [ 3735.257638] ath11k_pci 0000:01:00.0:
fw_version 0x250a04b8 fw_build_timestamp 2021-12-20 06:41 fw_build_id
Nov  7 18:01:31 s4 kernel: [ 3736.587053] ath11k_pci 0000:01:00.0:
leaving PCI ASPM disabled to avoid MHI M2 problems
Nov  7 18:01:31 s4 kernel: [ 3736.933304] ath11k_pci 0000:01:00.0
wlp1s0: renamed from wlan0
Nov  7 18:01:31 s4 systemd[1]: Starting Load/Save RF Kill Switch Status...
Nov  7 18:01:31 s4 systemd[1]: Started Load/Save RF Kill Switch Status.
Nov  7 18:01:31 s4 systemd-networkd[711]: wlan0: Interface name change
detected, renamed to wlp1s0.
Nov  7 18:01:34 s4 ModemManager[824]: <info>  [base-manager] couldn't
check support for device
'/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0': not supported by
any plugin
Nov  7 18:01:36 s4 systemd[1]: systemd-rfkill.service: Deactivated successfully.
Nov  7 18:10:08 s4 systemd-networkd[711]: wlp1s0: Link UP
Nov  7 18:10:11 s4 systemd-networkd[711]: wlp1s0: Gained carrier
Nov  7 18:10:11 s4 kernel: [ 4257.237326] IPv6:
ADDRCONF(NETDEV_CHANGE): wlp1s0: link becomes ready
Nov  7 18:10:13 s4 systemd-networkd[711]: wlp1s0: Gained IPv6LL
Nov  7 18:11:32 s4 systemd-networkd[711]: wlp1s0: Lost carrier
Nov  7 18:11:32 s4 systemd-networkd[711]: wlp1s0: Link DOWN
Nov  7 18:11:37 s4 systemd-networkd[711]: wlp1s0: Link UP
Nov  7 18:11:40 s4 systemd-networkd[711]: wlp1s0: Gained carrier
Nov  7 18:11:40 s4 kernel: [ 4346.125158] IPv6:
ADDRCONF(NETDEV_CHANGE): wlp1s0: link becomes ready
Nov  7 18:11:42 s4 systemd-networkd[711]: wlp1s0: Gained IPv6LL


3.

root@s4:/home/angel/hostapd-2.10/hostapd# iw dev
phy#2
        Interface wlp1s0
                ifindex 7
                wdev 0x200000001
                addr c4:4b:d1:d0:00:7e
                ssid test
                type AP
                channel 33 (6115 MHz), width: 80 MHz, center1: 6145 MHz
                txpower 30.00 dBm

root@s4:/usr/lib/modules/5.19.0-23-generic/kernel/drivers/net/wireless/ath/ath11k#
iw phy2 channels
Band 4:
        * 5955 MHz [1]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 5975 MHz [5]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 5995 MHz [9]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6015 MHz [13]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6035 MHz [17]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6055 MHz [21]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6075 MHz [25]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6095 MHz [29]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6115 MHz [33]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6135 MHz [37]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6155 MHz [41]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6175 MHz [45]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6195 MHz [49]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6215 MHz [53]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6235 MHz [57]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6255 MHz [61]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6275 MHz [65]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6295 MHz [69]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6315 MHz [73]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6335 MHz [77]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6355 MHz [81]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6375 MHz [85]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6395 MHz [89]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6415 MHz [93]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6435 MHz [97]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6455 MHz [101]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6475 MHz [105]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6495 MHz [109]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6515 MHz [113]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6535 MHz [117]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6555 MHz [121]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6575 MHz [125]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6595 MHz [129]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6615 MHz [133]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6635 MHz [137]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6655 MHz [141]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6675 MHz [145]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6695 MHz [149]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6715 MHz [153]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6735 MHz [157]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6755 MHz [161]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6775 MHz [165]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6795 MHz [169]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6815 MHz [173]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6835 MHz [177]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6855 MHz [181]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6875 MHz [185]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6895 MHz [189]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6915 MHz [193]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6935 MHz [197]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6955 MHz [201]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6975 MHz [205]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 6995 MHz [209]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 7015 MHz [213]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 7035 MHz [217]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 7055 MHz [221]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 7075 MHz [225]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 7095 MHz [229]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 7115 MHz [233]
          Maximum TX power: 30.0 dBm
          Channel widths: 20MHz
        * 5935 MHz [2] (disabled)

4.
Now with hostapd pretending to work, it does not error out on 6GHz
freq anymore, it starts on channel 33 but no client can see it

root@s4:/home/angel/hostapd-2.10/hostapd# ./hostapd hostapd.conf&
[1] 2008
root@s4:/home/angel/hostapd-2.10/hostapd# wlp1s0: interface state
UNINITIALIZED->COUNTRY_UPDATE
ACS: Automatic channel selection started, this may take a bit
wlp1s0: interface state COUNTRY_UPDATE->ACS
wlp1s0: ACS-STARTED
wlp1s0: ACS-COMPLETED freq=6115 channel=33
wlp1s0: interface state ACS->ENABLED
wlp1s0: AP-ENABLED

Should work, no?

5. and the config
root@s4:/home/angel/hostapd-2.10/hostapd# cat hostapd.conf | grep -v
'^#' | grep . | more
interface=wlp1s0
driver=nl80211
logger_syslog=-1
logger_syslog_level=2
logger_stdout=-1
logger_stdout_level=2
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0
ssid=test
country_code=BE
ieee80211d=1
ieee80211h=1
hw_mode=a
channel=0
op_class=133
acs_num_scans=1
beacon_int=100
dtim_period=2
max_num_sta=255
rts_threshold=-1
fragm_threshold=-1
macaddr_acl=0
ieee80211w=2
auth_algs=3
ignore_broadcast_ssid=0
wmm_enabled=1
wmm_ac_bk_cwmin=4
wmm_ac_bk_cwmax=10
wmm_ac_bk_aifs=7
wmm_ac_bk_txop_limit=0
wmm_ac_bk_acm=0
wmm_ac_be_aifs=3
wmm_ac_be_cwmin=4
wmm_ac_be_cwmax=10
wmm_ac_be_txop_limit=0
wmm_ac_be_acm=0
wmm_ac_vi_aifs=2
wmm_ac_vi_cwmin=3
wmm_ac_vi_cwmax=4
wmm_ac_vi_txop_limit=94
wmm_ac_vi_acm=0
wmm_ac_vo_aifs=2
wmm_ac_vo_cwmin=2
wmm_ac_vo_cwmax=3
wmm_ac_vo_txop_limit=47
wmm_ac_vo_acm=0
ieee80211ax=1
eapol_key_index_workaround=0
eap_server=0
own_ip_addr=127.0.0.1
wpa=2
wpa_key_mgmt=SAE
rsn_pairwise=CCMP
group_cipher=CCMP
sae_password=testtest
sae_require_mfp=1
sae_pwe=1

Client, windows 11, country BE, lower 6E bands are approved for use
per regulatory domain, Intel AX210 160MHz, latest driver:22.170.0.

Physically external 5V power is connected as well as 4x antenna
pigtails and external antennas (5dbi).

Any light on this welcome & thanks for taking the time! There's
nothing else in the logs past this point.

M

On Mon, 7 Nov 2022 at 17:07, Nagarajan Maran (QUIC)
<quic_nmaran@quicinc.com> wrote:
>
> Hi Mariusz,
>
> We are looking into this issue. It seems that this error can occur when the given frequency is not present or when the given frequency is disabled.
> To further analyze the issue, could you kindly let us know the output of the below commands during failure case.
>      1) iw dev
>      2) iw phyX channels
>
> Also, could you kindly send the WiFi driver boot up logs with "debug_mask=0x212" enabled during insmod of ath11k.ko module.
>
> Thanks,
> Nagarajan M.
>
> -----Original Message-----
>
> From: Mariusz <enebeo@gmail.com>
> To: ath11k@lists.infradead.org
> Subject: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
> Message-ID:
>         <CAJrE-q6NVEF4sNW1s4Zz7Pb2ryzCi69e+_vLQswBWm747DHYDw@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
>
> Hi,
>
> As support for QCN9074 got better I went ahead and built a 6E linux based AP. Dell R720 server x86 running Linux s4 5.19.0-23-generic #24-Ubuntu SMP PREEMPT_DYNAMIC Fri Oct 14 15:39:57 UTC 2022 x86_64
> x86_64 x86_64 GNU/Linux.
>
> My issue is that I cannot get it working on 6GHz bands but it works fine on 5GHz. I bought 6E version  and since this is a single band module it cannot be both 5G & 6G and linux driver does not agree with it being 6E version:
>
> [71914.038562] ath11k_pci 0000:03:00.0: BAR 0: assigned [mem 0xdf800000-0xdf9fffff 64bit] [71914.038840] ath11k_pci 0000:03:00.0: MSI vectors: 16 [71914.038852] ath11k_pci 0000:03:00.0: qcn9074 hw1.0 [71914.194459] mhi mhi0: Requested to power ON [71914.194712] mhi mhi0: Power on setup success [71914.297749] mhi mhi0: Wait for device to enter SBL or Mission mode [71914.647118] ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff [71914.647134] ath11k_pci 0000:03:00.0: fw_version 0x250a04b8 fw_build_timestamp 2021-12-20 06:41 fw_build_id [71916.310787] ath11k_pci 0000:03:00.0 wlp3s0: renamed from wlan0
>
> HE PHY Capabilities: (0x1c604c88ffdb839c110c00):
>                                 HE40/HE80/5GHz
>                                 HE160/5GHz
>                                 HE160/HE80+80/5GHz
>
> iw dev wlp3s0 set freq 6195 160MHz
> kernel reports: Channel is disabled
> command failed: Invalid argument (-22)
>
> I am using the latest firmware files from ath11k tree. Is there any special firmware to force this to 6GHz? I read somewhere board_id determines which one it is and 255 disables 6GHz but I miss more data on that.
>
> phy#2 (self-managed)
> country US: DFS-FCC
>         (2402 - 2472 @ 40), (6, 30), (N/A)
>         (5170 - 5250 @ 80), (N/A, 30), (N/A), AUTO-BW
>         (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
>         (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
>         (5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
>         (5945 - 7125 @ 160), (N/A, 30), (N/A), NO-OUTDOOR, AUTO-BW
>
> It works fine in 5GHz but this is not what I purchased it for, so I am puzzled if this is something in software or I was sold wrong hardware.Is there a specific board-2.bin for 6GHz? Since the 9074 chip is the same in all versions perhaps this is a software hiccup.
>
> Any clues are welcome.
>
> Regards,
> Mario
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
