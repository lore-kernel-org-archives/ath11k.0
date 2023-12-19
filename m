Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18611C41535
	for <ath11k@archiver.kernel.org>; Tue, 19 Dec 2023 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iTFV7JJq/mmtCsGfFXzITv3h5Nljdw/pT1c5FOrQNFg=; b=e7Olu7QtSUrfAZs4Yn3rp782n9
	+UlOuq+ew2CGotnSzhBxKZWcngzpDdz5IH9HGNBSmOTwMAP5oiRVMF9uzijfYdEtIEozy8k/braU3
	FQHxXVdiey5UyDqdlN+h6JGIJiyREAdOeXBIeFmH2YMKrHZ+KUFlZCwJ8bArcb93+yGF8Ut9DZPiC
	FKhnRToBliMbFX4BE/UXulMgTGvlOn7JhF0T19q1qvJJM3qq1/E59gw39RZeuUXH0csfT/folM6W5
	pBlo6SgOsz3sahkLD0UH03IGRBosKi+/icltv6zF9y4yPFkYv9X3z1dpUFZiO9ISJzMFdj67fWeip
	E3U1obUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFaVP-00EF7h-0r;
	Tue, 19 Dec 2023 13:51:31 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFaVM-00EF6g-19
	for ath11k@lists.infradead.org;
	Tue, 19 Dec 2023 13:51:29 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-42594f0ca09so27581581cf.0
        for <ath11k@lists.infradead.org>; Tue, 19 Dec 2023 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702993887; x=1703598687; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTFV7JJq/mmtCsGfFXzITv3h5Nljdw/pT1c5FOrQNFg=;
        b=MiHjTXWLq3IgwhpGMRmhe7feT+i84eV+koT6Nc/V1asktcTDm+YqQrN0F94wV68EyP
         OAagJlTIqrM4tdlWluy8mhVKfdGoSEP2Sefyp615kGwDyb++OWyJxWHO2PjuLhYcB1wn
         mb25ysLYNbdfE9qpYOiZIa2iyVz6MzRi5kwYat2hTB2jRjqJ9//361xkgCZd3r5NvRVM
         pvcvTxHkuUy6sljcOPsVIpHbk3L+bgQk1hZuQkXsGta9nEEDuCW9oIhgGZ2vookH5tUI
         yfzH6ry7gaAwz0Mv7/kh/V8057t/bFlwP2uYTO0127u9lnGwDPeGlcCIZvcD3sSP7EvQ
         15FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702993887; x=1703598687;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iTFV7JJq/mmtCsGfFXzITv3h5Nljdw/pT1c5FOrQNFg=;
        b=mdD4uRQaLW7pP0D+BlUQ3dLmZ8EkDEsKd6xY6VMjvRWqHUKtIGAeVlta8vWJhfLa3H
         w2TG2lRvBFSebGmK61OVtrjliaNBrkWakFsgtlWTNrvVQwJLhuqsPaHtK1FznmJmP0E6
         T3z4MZdXQFxglNTOQF1Ed8YdujaGHIGLJGsMlWJU8+vHHwZ5M66AzFPI5tPypYPXZVko
         CvLxrHiwCBWRZTdcCaLQRdhE2izOUsLxei4WWW/+2eUDTOahH+wrocnwwXfJUdnUO1dZ
         8wzVWI9yANv7OMXlVROpahGWiKUU0Y2+YwzoCZBLdIj0os6DNomUyAlnIDNv5ijswSos
         ZGBA==
X-Gm-Message-State: AOJu0Yy1n9M3G/+Z1YnHHCrar7kNAbaB/udOOS+5OFV5teoQzodRfr5i
	WtvIRr0ICXTrT+8QWIpv1lznksKApPM=
X-Google-Smtp-Source: AGHT+IHfqym+D9e2n1fzXmbLK767HPyHSLyQnoZ6eaos+0UkUk6xBJe6L1CyCUseCYY2rwAOMzL6BA==
X-Received: by 2002:a05:622a:190d:b0:425:4043:8d52 with SMTP id w13-20020a05622a190d00b0042540438d52mr15351675qtc.109.1702993886613;
        Tue, 19 Dec 2023 05:51:26 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id ef8-20020a05622a53c800b0042753a7ada2sm2787200qtb.85.2023.12.19.05.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 05:51:26 -0800 (PST)
Message-ID: <ab00ff77-23de-43a1-9eb9-6ac036ab80e3@gmail.com>
Date: Tue, 19 Dec 2023 05:51:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org
From: James Prestwood <prestwoj@gmail.com>
Subject: Ath11k warnings, and eventual phy going away requiring reboot
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_055128_393418_78A3BF6F 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

I noticed this after one of our devices dropped offline. The device had 
roamed 7 minutes prior so I doubt that had anything to do with it. But 
then we get this, and then tons of warnings. I'm happy to provide full 
stack traces but its quite a few, not sure which ones are relevant or 
not. After all the warnings IWD got an RTNL del link event and was 
unable to recover from that. It seems after that ath11k tried to power 
back on but failed.

This is a stock 6.2 ubuntu kernel, WCN6855:

fw_version 0x1106996e fw_build_timestamp 2023-10-13 07:30 fw_build_id 
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

I see there is a new FW as of 5 days ago, so I could try that if you 
think this is a FW problem.

Dec 19 11:53:33 kernel: ieee80211 phy0: Hardware restart was requested
Dec 19 11:53:33 kernel: mhi mhi0: Requested to power ON
Dec 19 11:53:33 kernel: mhi mhi0: Power on setup success
Dec 19 11:53:34 kernel: mhi mhi0: Wait for device to enter SBL or 
Mission mode
Dec 19 11:53:34 kernel: ath11k_pci 0000:01:00.0: already resetting count 2
Dec 19 11:53:43 kernel: ath11k_pci 0000:01:00.0: failed to send 
WMI_PDEV_SET_PARAM cmd
Dec 19 11:53:43 kernel: ath11k_pci 0000:01:00.0: failed to enable PMF 
QOS: (-108
Dec 19 11:53:43 kernel: Hardware became unavailable during restart.
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/util.c:2555 ieee80211_reconfig+0x505/0x1100 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.h:627 drv_flush+0x16f/0x180 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.h:839 drv_mgd_complete_tx+0x169/0x190 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.c:399 drv_ampdu_action+0x176/0x1a0 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.h:508 drv_sta_pre_rcu_remove+0x15f/0x180 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.c:120 drv_sta_state+0x226/0x230 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/sta_info.c:1291 __sta_info_destroy_part2+0x19b/0x1b0 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.c:462 drv_set_key+0x1d5/0x1e0 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/sta_info.c:1308 __sta_info_destroy_part2+0x15a/0x1b0 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/sta_info.c:1316 __sta_info_destroy_part2+0x17f/0x1b0 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.h:555 drv_sta_statistics+0x160/0x180 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/sta_info.c:417 sta_info_free+0xf4/0x170 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/sta_info.c:420 sta_info_free+0x162/0x170 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/main.c:235 ieee80211_bss_info_change_notify+0x2dd/0x2f0 
[mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.c:193 drv_conf_tx+0x1e5/0x250 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.c:316 drv_unassign_vif_chanctx+0x19d/0x1d0 
[mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.h:156 
ieee80211_vif_cfg_change_notify+0x19c/0x1b0 [mac80211]
Dec 19 11:53:43 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.h:888 ieee80211_del_chanctx+0x1d6/0x1e0 [mac80211]
Dec 19 11:53:48 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.c:99 drv_remove_interface+0x137/0x150 [mac80211]
Dec 19 11:53:48 kernel: WARNING: CPU: 1 PID: 1328948 at 
net/mac80211/driver-ops.c:38 drv_stop+0x10f/0x120 [mac80211]
Dec 19 11:53:48 iwd[490]: src/station.c:station_enter_state() Old State: 
autoconnect_quick, new state: autoconnect_full
Dec 19 11:53:48 iwd[490]: src/scan.c:scan_periodic_start() Starting 
periodic scan for wdev 2
Dec 19 11:53:48 iwd[490]: src/wiphy.c:wiphy_radio_work_insert() 
Inserting work item 1466
Dec 19 11:53:48 iwd[490]: src/wiphy.c:wiphy_radio_work_done() Work item 
1465 done
Dec 19 11:53:48 iwd[490]: src/wiphy.c:wiphy_radio_work_next() Starting 
work item 1466
Dec 19 11:53:48 iwd[490]: Received error during CMD_TRIGGER_SCAN: 
Network is down (100)
Dec 19 11:53:48 iwd[490]: src/netdev.c:netdev_link_notify() event 16 on 
ifindex 5
Dec 19 11:53:48 iwd[490]: src/station.c:station_free()
Dec 19 11:53:48 iwd[490]: src/netconfig.c:netconfig_destroy()
Dec 19 11:53:48 iwd[490]: src/scan.c:scan_periodic_stop() Stopping 
periodic scan for wdev 2
Dec 19 11:53:48 iwd[490]: src/scan.c:scan_cancel() Trying to cancel scan 
id 1466 for wdev 2
Dec 19 11:53:48 iwd[490]: src/scan.c:scan_cancel() Scan is already started
Dec 19 11:53:48 iwd[490]: src/wiphy.c:wiphy_radio_work_done() Work item 
1466 done
Dec 19 11:53:48 iwd[490]: src/station.c:station_roam_state_clear() 5
Dec 19 11:53:55 kernel: qcom_mhi_qrtr mhi0_IPCR: 20: Failed to receive 
START channel command completion
Dec 19 11:53:55 kernel: qcom_mhi_qrtr: probe of mhi0_IPCR failed with 
error -5
Dec 19 11:54:16 kernel: mhi mhi0: Requested to power ON
Dec 19 11:54:16 kernel: mhi mhi0: Power on setup success
Dec 19 11:54:45 kernel: mhi mhi0: Device failed to enter MHI Ready
Dec 19 11:54:45 kernel: mhi mhi0: MHI did not enter READY state
Dec 19 11:54:45 kernel: ath11k_pci 0000:01:00.0: failed to power up mhi: 
-110
Dec 19 11:54:45 kernel: ath11k_pci 0000:01:00.0: failed to start mhi: -110
Dec 19 11:54:45 kernel: ath11k_pci 0000:01:00.0: already resetting count 3
Dec 19 11:55:27 kernel: mhi mhi0: Requested to power ON
Dec 19 11:55:27 kernel: mhi mhi0: Power on setup success
Dec 19 11:55:57 kernel: mhi mhi0: Device failed to enter MHI Ready
Dec 19 11:55:57 kernel: mhi mhi0: MHI did not enter READY state
Dec 19 11:55:57 kernel: ath11k_pci 0000:01:00.0: failed to power up mhi: 
-110
Dec 19 11:55:57 kernel: ath11k_pci 0000:01:00.0: failed to start mhi: -110
Dec 19 12:15:25 kernel: usb 4-1: USB disconnect, device number 3

Thanks,

James


