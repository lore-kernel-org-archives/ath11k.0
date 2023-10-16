Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE06BCDB465
	for <ath11k@archiver.kernel.org>; Mon, 16 Oct 2023 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aec2JcbB/ozp6ibhG4X1A9aim/dr4n0/zziys3Cw8KA=; b=VjMz0JlkgdZgdG
	oporDt8u9ysDa/71/638Cwoxes3oT+Lyoe5+z8Gvci7bPAhFrd01+385doCpjbAEJswYmhKxq4lYp
	UmNNrZPdCVEpfaxzSB+Xs447H1kCZ2XMai8QDYq6RaNwnQM3WFCKvFoNw0bdviDH1u2Fn4vxocEN7
	gWFmRqT/rrAe3ejDYAlr3ykGEm/7axpH14qvzb171/xyNr2BCRXP1UIubxBCjzLMpyR3kkSp5lv/a
	L/dZHaqSGWnDxtMyYuXixZk/0ronzfG2aIAHugqG4mqS84QVeOoEhYNGKI3RYl+UvyfH4vQSByXmM
	Fi+asB6FqFda28RbpgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQQY-00A84l-2m;
	Mon, 16 Oct 2023 16:26:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQQS-00A82k-2i
	for ath11k@lists.infradead.org;
	Mon, 16 Oct 2023 16:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A4A1FB816AD
	for <ath11k@lists.infradead.org>; Mon, 16 Oct 2023 16:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5811BC433C8
	for <ath11k@lists.infradead.org>; Mon, 16 Oct 2023 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697473598;
	bh=R3wKxoGhgK1sJj2TsSqakv5NlPtcxPXApXiqEI1JvU4=;
	h=From:To:Subject:Date:From;
	b=KQeDaAS0YiXHCsD2Qu0jYk5pcEWQk4v+gBP8TFNVXVx0v634u2AeDzhJAMRpUWV1M
	 Zo613tqDPVcIUkSEkLJloxkOsL7ZiZQemVeHOdKQqsxpwGnQ5rwtTAG/C/ePEaSNhy
	 k3zanoHI1DRHTrycWi8AUiwOvYCii/NJIdjepKWRtQUe9hO1V5jgC7pOWtkAr55Olo
	 UALefA1njGZFRhFhUiQsF4unnZJaVa6LBp73QkPOw4FpqJ5PzQ6Vz35Vt7dduP0Mn/
	 Lv6LsMzm0JB08pEfmu7GWMvlDNDnGgYdME+dHOgTa7rAp+ETMVcWcziGsWuDvI56tG
	 QL3uYmh6QIZbg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Subject: ath11k: QCA6390 hw2.0: firmware crashing on ath.git master branch
Date: Mon, 16 Oct 2023 19:26:35 +0300
Message-ID: <87edhu3550.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_092641_319694_A2B90427 
X-CRM114-Status: UNSURE (   8.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

Last week I updated ath.git master branch to v6.6-rc4 (from v6.5). My
regression tests were passing without issues. But once I updated my
daily driver laptop Dell XPS 13 9310 to ath.git master branch (tag
ath-202310100725) the firmware started crashing daily:

[71990.787525] ath11k_pci 0000:72:00.0: firmware crashed: MHI_CB_EE_RDDM

This happens during resume and ath11k won't work after the crash, not
even reload ath11k kernel modules won't help and I need to reboot the
whole laptop.

The strange part is that I haven't yet seen these crashes on Linus'
official release (tag v6.6-rc4). I don't know if this is just a
coincidence or the bug causing is just in ath.git master branch. I'll
continue testing tag v6.6-rc4 to see if I see the firmware crash also
with that.

The problem here is of course that I see the crash only in average once
per day so a git bisect is difficult. Has anyone else seen anything
similar?

Kalle

Here's a log from one of the crashes:

[71987.983139] wlan0: deauthenticating from <addr1> by local choice (Reason: 3=DEAUTH_LEAVING)
[71990.787525] ath11k_pci 0000:72:00.0: firmware crashed: MHI_CB_EE_RDDM
[71990.984736] ath11k_pci 0000:72:00.0: wmi command 36865 timeout
[71990.984748] ath11k_pci 0000:72:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[71990.984755] ath11k_pci 0000:72:00.0: failed to set sta power save mode 0 for vdev 0: -11
[71990.984759] ath11k_pci 0000:72:00.0: failed to setup powersave: -11
[71990.984762] ath11k_pci 0000:72:00.0: failed to setup ps on vdev 0: -11
[71993.996762] ath11k_pci 0000:72:00.0: wmi command 45073 timeout
[71993.996773] ath11k_pci 0000:72:00.0: WMI vdev 0 failed to send FILS discovery enable/disable command
[71994.020784] ieee80211 phy0: Hardware restart was requested
[71999.116799] ath11k_pci 0000:72:00.0: failed to flush transmit queue, data pkts pending 2
[71999.116817] ath11k_pci 0000:72:00.0: failed to find the peer to stop rx aggregation
[71999.116820] wlan0: HW problem - can not stop rx aggregation for <addr1> tid 0
[71999.116824] ath11k_pci 0000:72:00.0: failed to find the peer to stop rx aggregation
[71999.116826] wlan0: HW problem - can not stop rx aggregation for <addr1> tid 6
[72004.236765] ath11k_pci 0000:72:00.0: failed to flush transmit queue, data pkts pending 2
[72004.236821] ath11k_pci 0000:72:00.0: failed to lookup peer <addr1> on vdev 0
[72007.308769] ath11k_pci 0000:72:00.0: wmi command 20488 timeout
[72007.308780] ath11k_pci 0000:72:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
[72007.308788] ath11k_pci 0000:72:00.0: Failed to set CTS prot for VDEV: 0
[72010.380809] ath11k_pci 0000:72:00.0: wmi command 20488 timeout
[72010.380822] ath11k_pci 0000:72:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
[72010.380831] ath11k_pci 0000:72:00.0: Failed to set erp slot for VDEV: 0
[72013.452794] ath11k_pci 0000:72:00.0: wmi command 20488 timeout
[72013.452809] ath11k_pci 0000:72:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
[72013.452819] ath11k_pci 0000:72:00.0: Failed to set preamble for VDEV: 0
[72015.044092] mhi mhi0: Requested to power ON
[72015.044104] mhi mhi0: Power on setup success
[72015.372819] mhi mhi0: Wait for device to enter SBL or Mission mode
[72015.484321] ath11k_pci 0000:72:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
[72015.484333] ath11k_pci 0000:72:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id 
[72015.510077] ath11k_pci 0000:72:00.0: Last interrupt received for each CE:
[72015.510089] ath11k_pci 0000:72:00.0: CE_id 0 pipe_num 0 1763828ms before
[72015.510093] ath11k_pci 0000:72:00.0: CE_id 1 pipe_num 1 646404ms before
[72015.510096] ath11k_pci 0000:72:00.0: CE_id 2 pipe_num 2 27648ms before
[72015.510099] ath11k_pci 0000:72:00.0: CE_id 3 pipe_num 3 27524ms before
[72015.510102] ath11k_pci 0000:72:00.0: CE_id 5 pipe_num 5 1467144ms before
[72015.510105] ath11k_pci 0000:72:00.0: CE_id 7 pipe_num 7 1467144ms before
[72015.510107] ath11k_pci 0000:72:00.0: CE_id 8 pipe_num 8 1467144ms before
[72015.510110] ath11k_pci 0000:72:00.0: 
[72015.510110] Last interrupt received for each group:
[72015.510113] ath11k_pci 0000:72:00.0: group_id 0 27524ms before
[72015.510116] ath11k_pci 0000:72:00.0: group_id 1 1467144ms before
[72015.510118] ath11k_pci 0000:72:00.0: group_id 2 1467144ms before
[72015.510121] ath11k_pci 0000:72:00.0: group_id 3 1467144ms before
[72015.510123] ath11k_pci 0000:72:00.0: group_id 4 1467144ms before
[72015.510126] ath11k_pci 0000:72:00.0: group_id 5 1467144ms before
[72015.510128] ath11k_pci 0000:72:00.0: group_id 6 1467144ms before
[72015.510130] ath11k_pci 0000:72:00.0: group_id 7 27764ms before
[72015.510133] ath11k_pci 0000:72:00.0: group_id 8 28976ms before
[72015.510135] ath11k_pci 0000:72:00.0: group_id 9 1467144ms before
[72015.510138] ath11k_pci 0000:72:00.0: group_id 10 1467144ms before
[72015.510141] ath11k_pci 0000:72:00.0: dst srng id 0 tp 29136, cur hp 29136, cached hp 29136 last hp 29136 napi processed before 27764ms
[72015.510146] ath11k_pci 0000:72:00.0: dst srng id 1 tp 24064, cur hp 24064, cached hp 24064 last hp 24064 napi processed before 28976ms
[72015.510150] ath11k_pci 0000:72:00.0: dst srng id 2 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1467144ms
[72015.510154] ath11k_pci 0000:72:00.0: dst srng id 3 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1467144ms
[72015.510157] ath11k_pci 0000:72:00.0: dst srng id 4 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 27524ms
[72015.510161] ath11k_pci 0000:72:00.0: src srng id 5 hp 0, reap_hp 248, cur tp 0, cached tp 0 last tp 0 napi processed before 1467144ms
[72015.510165] ath11k_pci 0000:72:00.0: src srng id 8 hp 2230, reap_hp 2230, cur tp 2060, cached tp 2060 last tp 2060 napi processed before 21480ms
[72015.510170] ath11k_pci 0000:72:00.0: dst srng id 9 tp 11180, cur hp 11180, cached hp 11180 last hp 11180 napi processed before 27524ms
[72015.510173] ath11k_pci 0000:72:00.0: src srng id 16 hp 1232, reap_hp 1232, cur tp 1232, cached tp 1216 last tp 1216 napi processed before 27528ms
[72015.510178] ath11k_pci 0000:72:00.0: src srng id 24 hp 0, reap_hp 248, cur tp 0, cached tp 0 last tp 0 napi processed before 1467144ms
[72015.510182] ath11k_pci 0000:72:00.0: dst srng id 25 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1467144ms
[72015.510186] ath11k_pci 0000:72:00.0: src srng id 32 hp 12, reap_hp 8, cur tp 12, cached tp 12 last tp 8 napi processed before 1763828ms
[72015.510190] ath11k_pci 0000:72:00.0: src srng id 35 hp 40, reap_hp 36, cur tp 40, cached tp 40 last tp 36 napi processed before 27528ms
[72015.510194] ath11k_pci 0000:72:00.0: src srng id 36 hp 168, reap_hp 164, cur tp 168, cached tp 168 last tp 156 napi processed before 649860ms
[72015.510199] ath11k_pci 0000:72:00.0: src srng id 39 hp 0, reap_hp 124, cur tp 0, cached tp 0 last tp 0 napi processed before 1467144ms
[72015.510203] ath11k_pci 0000:72:00.0: src srng id 57 hp 28, reap_hp 28, cur tp 32, cached tp 32 last tp 32 napi processed before 646404ms
[72015.510207] ath11k_pci 0000:72:00.0: src srng id 58 hp 452, reap_hp 452, cur tp 456, cached tp 456 last tp 456 napi processed before 27648ms
[72015.510210] ath11k_pci 0000:72:00.0: src srng id 61 hp 1020, reap_hp 1020, cur tp 0, cached tp 0 last tp 0 napi processed before 1763828ms
[72015.510215] ath11k_pci 0000:72:00.0: dst srng id 81 tp 64, cur hp 64, cached hp 64 last hp 64 napi processed before 646404ms
[72015.510218] ath11k_pci 0000:72:00.0: dst srng id 82 tp 912, cur hp 912, cached hp 912 last hp 912 napi processed before 27648ms
[72015.510222] ath11k_pci 0000:72:00.0: dst srng id 85 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1467144ms
[72015.510226] ath11k_pci 0000:72:00.0: src srng id 104 hp 65532, reap_hp 65532, cur tp 0, cached tp 0 last tp 0 napi processed before 1763832ms
[72015.510230] ath11k_pci 0000:72:00.0: src srng id 105 hp 0, reap_hp 504, cur tp 0, cached tp 0 last tp 0 napi processed before 1467144ms
[72015.510234] ath11k_pci 0000:72:00.0: dst srng id 106 tp 173192, cur hp 173192, cached hp 173192 last hp 173192 napi processed before 27524ms
[72015.510239] ath11k_pci 0000:72:00.0: dst srng id 109 tp 912, cur hp 912, cached hp 912 last hp 912 napi processed before 27524ms
[72015.510242] ath11k_pci 0000:72:00.0: src srng id 128 hp 2780, reap_hp 2780, cur tp 6938, cached tp 6938 last tp 6938 napi processed before 27764ms
[72015.510247] ath11k_pci 0000:72:00.0: src srng id 129 hp 0, reap_hp 2046, cur tp 0, cached tp 0 last tp 0 napi processed before 1467144ms
[72015.510251] ath11k_pci 0000:72:00.0: src srng id 132 hp 954, reap_hp 954, cur tp 956, cached tp 956 last tp 956 napi processed before 12ms
[72015.510255] ath11k_pci 0000:72:00.0: dst srng id 133 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 27524ms
[72015.510258] ath11k_pci 0000:72:00.0: src srng id 144 hp 0, reap_hp 2046, cur tp 0, cached tp 0 last tp 0 napi processed before 1467144ms
[72015.510262] ath11k_pci 0000:72:00.0: src srng id 147 hp 1030, reap_hp 1030, cur tp 1032, cached tp 1032 last tp 1032 napi processed before 12ms
[72015.510266] ath11k_pci 0000:72:00.0: dst srng id 148 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1467144ms
[72015.549777] ath11k_pci 0000:72:00.0: Already processed, so ignoring dma ring caps
[72018.545369] ath11k_pci 0000:72:00.0: firmware crashed: MHI_CB_EE_RDDM
[72018.545478] ath11k_pci 0000:72:00.0: already resetting count 2
[72018.828765] ath11k_pci 0000:72:00.0: wmi command 16414 timeout
[72018.828766] ath11k_pci 0000:72:00.0: wmi command 45073 timeout
[72018.828776] ath11k_pci 0000:72:00.0: WMI vdev 0 failed to send FILS discovery enable/disable command
[72018.828777] ath11k_pci 0000:72:00.0: failed to send WMI_PDEV_SET_HW_MODE_CMDID
[72018.828786] ath11k_pci 0000:72:00.0: failed to send dbs mode: -11
[72018.830653] ath11k_pci 0000:72:00.0: failed to start core: -11
[72018.830726] failed to send QMI message
[72018.830731] ath11k_pci 0000:72:00.0: failed to send wlan mode request (mode 4): -5
[72018.830734] ath11k_pci 0000:72:00.0: qmi failed to send wlan mode off: -5
[72018.830739] ath11k_pci 0000:72:00.0: failed to reconfigure driver on crash recovery
[72021.900756] ath11k_pci 0000:72:00.0: wmi command 20493 timeout
[72021.900769] ath11k_pci 0000:72:00.0: failed to send WMI_VDEV_SET_WMM_PARAMS_CMDID
[72021.900777] ath11k_pci 0000:72:00.0: failed to set wmm params: -11
[72022.152128] i915 0000:00:02.0: [drm] *ERROR* Unexpected DE Misc interrupt
[72024.972733] ath11k_pci 0000:72:00.0: wmi command 20493 timeout
[72024.972745] ath11k_pci 0000:72:00.0: failed to send WMI_VDEV_SET_WMM_PARAMS_CMDID
[72024.972754] ath11k_pci 0000:72:00.0: failed to set wmm params: -11
[72028.044561] ath11k_pci 0000:72:00.0: wmi command 20493 timeout
[72028.044575] ath11k_pci 0000:72:00.0: failed to send WMI_VDEV_SET_WMM_PARAMS_CMDID
[72028.044585] ath11k_pci 0000:72:00.0: failed to set wmm params: -11
[72031.116609] ath11k_pci 0000:72:00.0: wmi command 20493 timeout
[72031.116623] ath11k_pci 0000:72:00.0: failed to send WMI_VDEV_SET_WMM_PARAMS_CMDID
[72031.116631] ath11k_pci 0000:72:00.0: failed to set wmm params: -11
[72034.188613] ath11k_pci 0000:72:00.0: wmi command 20486 timeout
[72034.188629] ath11k_pci 0000:72:00.0: failed to submit WMI_VDEV_STOP cmd
[72034.188639] ath11k_pci 0000:72:00.0: failed to stop WMI vdev 0: -11
[72034.188644] ath11k_pci 0000:72:00.0: failed to stop vdev 0: -11
[72034.188651] ath11k_pci 0000:72:00.0: failed to find peer vdev_id 0 addr <addr1> in delete
[72034.188657] ath11k_pci 0000:72:00.0: failed to delete peer <addr1> for vdev 0: -22
[72037.260593] ath11k_pci 0000:72:00.0: wmi command 237570 timeout
[72037.260610] ath11k_pci 0000:72:00.0: failed to send WMI_11D_SCAN_START_CMDID: -11
[72037.260621] ath11k_pci 0000:72:00.0: failed to start 11d scan vdev 0 ret: -11
[72040.268522] ath11k_pci 0000:72:00.0: wmi command 45073 timeout
[72040.268536] ath11k_pci 0000:72:00.0: WMI vdev 0 failed to send FILS discovery enable/disable command
[72040.580621] mhi mhi0: Requested to power ON
[72040.580639] mhi mhi0: Power on setup success
[72040.912517] mhi mhi0: Wait for device to enter SBL or Mission mode
[72041.023269] ath11k_pci 0000:72:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
[72041.023280] ath11k_pci 0000:72:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id 
[72041.048229] ath11k_pci 0000:72:00.0: Last interrupt received for each CE:
[72041.048242] ath11k_pci 0000:72:00.0: CE_id 0 pipe_num 0 25496ms before
[72041.048247] ath11k_pci 0000:72:00.0: CE_id 1 pipe_num 1 671940ms before
[72041.048250] ath11k_pci 0000:72:00.0: CE_id 2 pipe_num 2 25204ms before
[72041.048253] ath11k_pci 0000:72:00.0: CE_id 3 pipe_num 3 25360ms before
[72041.048256] ath11k_pci 0000:72:00.0: CE_id 5 pipe_num 5 1492680ms before
[72041.048258] ath11k_pci 0000:72:00.0: CE_id 7 pipe_num 7 1492680ms before
[72041.048261] ath11k_pci 0000:72:00.0: CE_id 8 pipe_num 8 1492680ms before
[72041.048263] ath11k_pci 0000:72:00.0: 
[72041.048263] Last interrupt received for each group:
[72041.048266] ath11k_pci 0000:72:00.0: group_id 0 53060ms before
[72041.048269] ath11k_pci 0000:72:00.0: group_id 1 1492680ms before
[72041.048272] ath11k_pci 0000:72:00.0: group_id 2 1492680ms before
[72041.048274] ath11k_pci 0000:72:00.0: group_id 3 1492680ms before
[72041.048277] ath11k_pci 0000:72:00.0: group_id 4 1492680ms before
[72041.048279] ath11k_pci 0000:72:00.0: group_id 5 1492680ms before
[72041.048282] ath11k_pci 0000:72:00.0: group_id 6 1492680ms before
[72041.048284] ath11k_pci 0000:72:00.0: group_id 7 53300ms before
[72041.048287] ath11k_pci 0000:72:00.0: group_id 8 54512ms before
[72041.048289] ath11k_pci 0000:72:00.0: group_id 9 1492680ms before
[72041.048292] ath11k_pci 0000:72:00.0: group_id 10 1492680ms before
[72041.048295] ath11k_pci 0000:72:00.0: dst srng id 0 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492680ms
[72041.048350] ath11k_pci 0000:72:00.0: dst srng id 1 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048354] ath11k_pci 0000:72:00.0: dst srng id 2 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048357] ath11k_pci 0000:72:00.0: dst srng id 3 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048360] ath11k_pci 0000:72:00.0: dst srng id 4 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048363] ath11k_pci 0000:72:00.0: src srng id 5 hp 0, reap_hp 248, cur tp 0, cached tp 0 last tp 0 napi processed before 1492684ms
[72041.048368] ath11k_pci 0000:72:00.0: src srng id 8 hp 0, reap_hp 2550, cur tp 0, cached tp 0 last tp 0 napi processed before 1492684ms
[72041.048372] ath11k_pci 0000:72:00.0: dst srng id 9 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048376] ath11k_pci 0000:72:00.0: src srng id 16 hp 0, reap_hp 4088, cur tp 0, cached tp 0 last tp 0 napi processed before 1492684ms
[72041.048380] ath11k_pci 0000:72:00.0: src srng id 24 hp 0, reap_hp 248, cur tp 0, cached tp 0 last tp 0 napi processed before 1492684ms
[72041.048384] ath11k_pci 0000:72:00.0: dst srng id 25 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048388] ath11k_pci 0000:72:00.0: src srng id 32 hp 12, reap_hp 8, cur tp 12, cached tp 12 last tp 8 napi processed before 25500ms
[72041.048392] ath11k_pci 0000:72:00.0: src srng id 35 hp 8, reap_hp 4, cur tp 8, cached tp 8 last tp 4 napi processed before 25364ms
[72041.048396] ath11k_pci 0000:72:00.0: src srng id 36 hp 0, reap_hp 8188, cur tp 0, cached tp 0 last tp 0 napi processed before 1492684ms
[72041.048401] ath11k_pci 0000:72:00.0: src srng id 39 hp 0, reap_hp 124, cur tp 0, cached tp 0 last tp 0 napi processed before 1492684ms
[72041.048405] ath11k_pci 0000:72:00.0: src srng id 57 hp 1020, reap_hp 1020, cur tp 0, cached tp 0 last tp 0 napi processed before 25504ms
[72041.048409] ath11k_pci 0000:72:00.0: src srng id 58 hp 18, reap_hp 18, cur tp 22, cached tp 22 last tp 22 napi processed before 25364ms
[72041.048414] ath11k_pci 0000:72:00.0: src srng id 61 hp 1020, reap_hp 1020, cur tp 0, cached tp 0 last tp 0 napi processed before 25500ms
[72041.048418] ath11k_pci 0000:72:00.0: dst srng id 81 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048421] ath11k_pci 0000:72:00.0: dst srng id 82 tp 44, cur hp 44, cached hp 44 last hp 44 napi processed before 25208ms
[72041.048425] ath11k_pci 0000:72:00.0: dst srng id 85 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048429] ath11k_pci 0000:72:00.0: src srng id 104 hp 65532, reap_hp 65532, cur tp 0, cached tp 0 last tp 0 napi processed before 25504ms
[72041.048433] ath11k_pci 0000:72:00.0: src srng id 105 hp 0, reap_hp 504, cur tp 0, cached tp 0 last tp 0 napi processed before 1492684ms
[72041.048437] ath11k_pci 0000:72:00.0: dst srng id 106 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048441] ath11k_pci 0000:72:00.0: dst srng id 109 tp 0, cur hp 0, cached hp 0 last hp 0 napi processed before 1492684ms
[72041.048498] ------------[ cut here ]------------
[72041.048500] WARNING: CPU: 7 PID: 4676 at mm/slab_common.c:991 free_large_kmalloc+0x34/0x60
[72041.048513] Modules linked in: sha512_generic(E) ctr(E) ccm(E) michael_mic(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) qrtr_mhi(E) snd_ctl_led(E) snd_soc_skl_hda_dsp(E) snd_soc_intel_hda_dsp_common(E) snd_soc_hdac_hdmi(E) snd_sof_probes(E) snd_hda_codec_hdmi(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) snd_hda_codec_realtek(E) coretemp(E) snd_hda_codec_generic(E) kvm_intel(E) snd_soc_dmic(E) hid_sensor_als(E) snd_sof_pci_intel_tgl(E) hid_sensor_trigger(E) kvm(E) snd_sof_intel_hda_common(E) hid_sensor_iio_common(E) snd_soc_acpi_intel_match(E) irqbypass(E) snd_soc_acpi(E) snd_soc_hdac_hda(E) industrialio_triggered_buffer(E) crc32_pclmul(E) snd_sof_pci(E) snd_sof_xtensa_dsp(E) kfifo_buf(E) snd_sof_intel_hda_mlink(E) industrialio(E) snd_sof_intel_hda(E) ghash_clmulni_intel(E) snd_sof(E) qrtr(E) snd_sof_utils(E) snd_hda_ext_core(E) dell_laptop(E) ledtrig_audio(E) ath11k_pci(E) snd_soc_core(E) intel_rapl_msr(E) dcdbas(E) uvcvideo(E) mhi(E) snd_compress(E) videobuf2_vmalloc(E) snd_hda_intel(E) ath11k(E) videobuf2_memops(E)
[72041.048590]  snd_intel_dspcfg(E) aesni_intel(E) qmi_helpers(E) uvc(E) snd_hda_codec(E) processor_thermal_device_pci_legacy(E) libaes(E) dell_smm_hwmon(E) intel_soc_dts_iosf(E) snd_hwdep(E) crypto_simd(E) snd_hda_core(E) cryptd(E) videobuf2_v4l2(E) processor_thermal_device(E) mac80211(E) videodev(E) snd_pcm(E) dell_wmi(E) intel_cstate(E) tpm_crb(E) processor_thermal_rfim(E) libarc4(E) intel_uncore(E) snd_timer(E) processor_thermal_mbox(E) videobuf2_common(E) iTCO_wdt(E) ucsi_acpi(E) tpm_tis(E) cfg80211(E) snd(E) pcspkr(E) mei_me(E) intel_pmc_bxt(E) tpm_tis_core(E) processor_thermal_rapl(E) typec_ucsi(E) dell_smbios(E) iTCO_vendor_support(E) dell_wmi_ddv(E) dell_wmi_sysman(E) mc(E) firmware_attributes_class(E) dell_wmi_descriptor(E) watchdog(E) wmi_bmof(E) rfkill(E) mei(E) soundcore(E) hid_sensor_hub(E) intel_rapl_common(E) tpm(E) typec(E) battery(E) rng_core(E) button(E) int3403_thermal(E) int340x_thermal_zone(E) int3400_thermal(E) ac(E) acpi_tad(E) intel_hid(E) joydev(E) sparse_keymap(E) acpi_thermal_rel(E)
[72041.048667]  intel_pmc_core(E) acpi_pad(E) evdev(E) serio_raw(E) fuse(E) efi_pstore(E) efivarfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E) crc16(E) mbcache(E) jbd2(E) hid_generic(E) intel_ishtp_hid(E) hid(E) nvme(E) nvme_core(E) t10_pi(E) i915(E) rtsx_pci_sdmmc(E) i2c_algo_bit(E) drm_buddy(E) mmc_core(E) crc64_rocksoft(E) drm_display_helper(E) crc64(E) rtsx_pci(E) crc32c_intel(E) xhci_pci(E) i2c_i801(E) crc_t10dif(E) drm_kms_helper(E) i2c_smbus(E) xhci_hcd(E) crct10dif_generic(E) video(E) cec(E) intel_lpss_pci(E) ttm(E) intel_lpss(E) crct10dif_pclmul(E) usbcore(E) intel_ish_ipc(E) idma64(E) intel_ishtp(E) usb_common(E) crct10dif_common(E) drm(E) wmi(E)
[72041.048730] CPU: 7 PID: 4676 Comm: kworker/u16:0 Tainted: G            E      6.6.0-rc4-wt-ath-01193-ga2021f91b86e #88
[72041.048735] Hardware name: Dell Inc. XPS 13 9310/0MRT12, BIOS 3.17.0 07/12/2023
[72041.048738] Workqueue: ath11k_wq ath11k_core_restart [ath11k]
[72041.048773] RIP: 0010:free_large_kmalloc+0x34/0x60
[72041.048778] Code: 74 28 0f b6 6f 40 85 ed 74 20 be 00 10 00 00 89 e9 48 d3 e6 f7 de 48 89 df e8 58 f5 ff ff 89 ee 48 89 df 5b 5d e9 6c 66 03 00 <0f> 0b 80 3d fa 92 f4 00 00 74 09 be 00 f0 ff ff 31 ed eb d8 48 c7
[72041.048781] RSP: 0018:ffffac8cc6c5be10 EFLAGS: 00010246
[72041.048785] RAX: 017fffc000000000 RBX: ffffe88b040e8000 RCX: ffffe88b00ce0008
[72041.048788] RDX: ffffe88b04104008 RSI: ffff8f18c3a00000 RDI: ffffe88b040e8000
[72041.048790] RBP: ffff8f18c5981940 R08: 0000000000000000 R09: dead000000000122
[72041.048792] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
[72041.048794] R13: ffff8f18c5981890 R14: ffff8f18c6ae8605 R15: ffff8f18c6ad4ab0
[72041.048797] FS:  0000000000000000(0000) GS:ffff8f202f7c0000(0000) knlGS:0000000000000000
[72041.048799] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[72041.048802] CR2: 00007fc7dabebc28 CR3: 0000000110e2c003 CR4: 0000000000770ee0
[72041.048805] PKRU: 55555554
[72041.048807] Call Trace:
[72041.048810]  <TASK>
[72041.048812]  ? __warn+0x6b/0xd0
[72041.048821]  ? free_large_kmalloc+0x34/0x60
[72041.048825]  ? report_bug+0x147/0x190
[72041.048833]  ? handle_bug+0x41/0x70
[72041.048840]  ? exc_invalid_op+0x13/0x60
[72041.048842]  ? asm_exc_invalid_op+0x16/0x20
[72041.048851]  ? free_large_kmalloc+0x34/0x60
[72041.048855]  ath11k_dp_free+0xc3/0xf0 [ath11k]
[72041.048892]  ath11k_core_restart+0x73/0x110 [ath11k]
[72041.048919]  process_one_work+0x15b/0x270
[72041.048928]  worker_thread+0x2ec/0x410
[72041.048934]  ? __pfx_worker_thread+0x10/0x10
[72041.048940]  kthread+0xdc/0x110
[72041.048946]  ? __pfx_kthread+0x10/0x10
[72041.048951]  ret_from_fork+0x28/0x40
[72041.048959]  ? __pfx_kthread+0x10/0x10
[72041.048963]  ret_from_fork_asm+0x1b/0x30
[72041.048968]  </TASK>
[72041.048969] ---[ end trace 0000000000000000 ]---
[72041.048972] object pointer: 0x00000000b35255a6
[72042.092443] ath11k_pci 0000:72:00.0: failed to receive control response completion, polling..
[72042.688840] i915 0000:00:02.0: [drm] *ERROR* Unexpected DE Misc interrupt
[72043.116330] ath11k_pci 0000:72:00.0: Service connect timeout
[72043.116350] ath11k_pci 0000:72:00.0: failed to connect to HTT: -110
[72043.118682] ath11k_pci 0000:72:00.0: failed to start core: -110
[72043.120502] ath11k_pci 0000:72:00.0: failed to reconfigure driver on crash recovery
[72045.336451] BUG: kernel NULL pointer dereference, address: 000000000000001c
[72045.336461] #PF: supervisor read access in kernel mode
[72045.336465] #PF: error_code(0x0000) - not-present page
[72045.336468] PGD 0 P4D 0 
[72045.336472] Oops: 0000 [#1] PREEMPT SMP NOPTI
[72045.336478] CPU: 7 PID: 2884 Comm: kworker/u16:26 Tainted: G        W   E      6.6.0-rc4-wt-ath-01193-ga2021f91b86e #88
[72045.336483] Hardware name: Dell Inc. XPS 13 9310/0MRT12, BIOS 3.17.0 07/12/2023
[72045.336486] Workqueue: i915 __i915_gem_free_work [i915]
[72045.336693] RIP: 0010:dma_direct_unmap_sg+0x4f/0x1c0
[72045.336702] Code: f3 41 89 d7 45 31 e4 41 89 ce eb 1e 83 e0 fe 89 43 1c 48 89 df 41 83 c4 01 e8 bd 26 30 00 48 89 c3 45 39 e7 0f 84 e4 00 00 00 <8b> 43 1c a8 01 75 db 49 8b bd 50 02 00 00 44 8b 4b 18 48 8b 73 10
[72045.336707] RSP: 0018:ffffac8cc4f87da8 EFLAGS: 00010202
[72045.336711] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[72045.336714] RDX: 00000000554b2000 RSI: 00000002c1190000 RDI: ffff8f1936658200
[72045.336717] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000003000
[72045.336720] R10: ffffffffb24dcbc0 R11: 0000000000000000 R12: 0000000000000011
[72045.336723] R13: ffff8f18c14a60c0 R14: 0000000000000000 R15: 0000000000000013
[72045.336726] FS:  0000000000000000(0000) GS:ffff8f202f7c0000(0000) knlGS:0000000000000000
[72045.336729] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[72045.336732] CR2: 000000000000001c CR3: 000000047ea14002 CR4: 0000000000770ee0
[72045.336736] PKRU: 55555554
[72045.336738] Call Trace:
[72045.336741]  <TASK>
[72045.336744]  ? __die+0x1a/0x60
[72045.336752]  ? page_fault_oops+0x154/0x430
[72045.336762]  ? __gen8_ppgtt_clear+0x22b/0x280 [i915]
[72045.336962]  ? exc_page_fault+0x30e/0x5f0
[72045.336972]  ? asm_exc_page_fault+0x22/0x30
[72045.336984]  ? dma_direct_unmap_sg+0x4f/0x1c0
[72045.336992]  ? dma_direct_unmap_sg+0x43/0x1c0
[72045.336998]  ? __i915_gem_object_unset_pages+0x196/0x220 [i915]
[72045.337232]  i915_gem_object_put_pages_shmem+0x1d/0x80 [i915]
[72045.337455]  __i915_gem_object_put_pages+0x3c/0x50 [i915]
[72045.337554]  __i915_gem_object_pages_fini+0x143/0x1d0 [i915]
[72045.337652]  i915_gem_flush_free_objects+0x60/0x90 [i915]
[72045.337746]  process_one_work+0x15b/0x270
[72045.337762]  worker_thread+0x2ec/0x410
[72045.337766]  ? __pfx_worker_thread+0x10/0x10
[72045.337770]  kthread+0xdc/0x110
[72045.337774]  ? __pfx_kthread+0x10/0x10
[72045.337777]  ret_from_fork+0x28/0x40
[72045.337783]  ? __pfx_kthread+0x10/0x10
[72045.337787]  ret_from_fork_asm+0x1b/0x30
[72045.337792]  </TASK>
[72045.337793] Modules linked in: sha512_generic(E) ctr(E) ccm(E) michael_mic(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) qrtr_mhi(E) snd_ctl_led(E) snd_soc_skl_hda_dsp(E) snd_soc_intel_hda_dsp_common(E) snd_soc_hdac_hdmi(E) snd_sof_probes(E) snd_hda_codec_hdmi(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) snd_hda_codec_realtek(E) coretemp(E) snd_hda_codec_generic(E) kvm_intel(E) snd_soc_dmic(E) hid_sensor_als(E) snd_sof_pci_intel_tgl(E) hid_sensor_trigger(E) kvm(E) snd_sof_intel_hda_common(E) hid_sensor_iio_common(E) snd_soc_acpi_intel_match(E) irqbypass(E) snd_soc_acpi(E) snd_soc_hdac_hda(E) industrialio_triggered_buffer(E) crc32_pclmul(E) snd_sof_pci(E) snd_sof_xtensa_dsp(E) kfifo_buf(E) snd_sof_intel_hda_mlink(E) industrialio(E) snd_sof_intel_hda(E) ghash_clmulni_intel(E) snd_sof(E) qrtr(E) snd_sof_utils(E) snd_hda_ext_core(E) dell_laptop(E) ledtrig_audio(E) ath11k_pci(E) snd_soc_core(E) intel_rapl_msr(E) dcdbas(E) uvcvideo(E) mhi(E) snd_compress(E) videobuf2_vmalloc(E) snd_hda_intel(E) ath11k(E) videobuf2_memops(E)
[72045.337867]  snd_intel_dspcfg(E) aesni_intel(E) qmi_helpers(E) uvc(E) snd_hda_codec(E) processor_thermal_device_pci_legacy(E) libaes(E) dell_smm_hwmon(E) intel_soc_dts_iosf(E) snd_hwdep(E) crypto_simd(E) snd_hda_core(E) cryptd(E) videobuf2_v4l2(E) processor_thermal_device(E) mac80211(E) videodev(E) snd_pcm(E) dell_wmi(E) intel_cstate(E) tpm_crb(E) processor_thermal_rfim(E) libarc4(E) intel_uncore(E) snd_timer(E) processor_thermal_mbox(E) videobuf2_common(E) iTCO_wdt(E) ucsi_acpi(E) tpm_tis(E) cfg80211(E) snd(E) pcspkr(E) mei_me(E) intel_pmc_bxt(E) tpm_tis_core(E) processor_thermal_rapl(E) typec_ucsi(E) dell_smbios(E) iTCO_vendor_support(E) dell_wmi_ddv(E) dell_wmi_sysman(E) mc(E) firmware_attributes_class(E) dell_wmi_descriptor(E) watchdog(E) wmi_bmof(E) rfkill(E) mei(E) soundcore(E) hid_sensor_hub(E) intel_rapl_common(E) tpm(E) typec(E) battery(E) rng_core(E) button(E) int3403_thermal(E) int340x_thermal_zone(E) int3400_thermal(E) ac(E) acpi_tad(E) intel_hid(E) joydev(E) sparse_keymap(E) acpi_thermal_rel(E)
[72045.337940]  intel_pmc_core(E) acpi_pad(E) evdev(E) serio_raw(E) fuse(E) efi_pstore(E) efivarfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E) crc16(E) mbcache(E) jbd2(E) hid_generic(E) intel_ishtp_hid(E) hid(E) nvme(E) nvme_core(E) t10_pi(E) i915(E) rtsx_pci_sdmmc(E) i2c_algo_bit(E) drm_buddy(E) mmc_core(E) crc64_rocksoft(E) drm_display_helper(E) crc64(E) rtsx_pci(E) crc32c_intel(E) xhci_pci(E) i2c_i801(E) crc_t10dif(E) drm_kms_helper(E) i2c_smbus(E) xhci_hcd(E) crct10dif_generic(E) video(E) cec(E) intel_lpss_pci(E) ttm(E) intel_lpss(E) crct10dif_pclmul(E) usbcore(E) intel_ish_ipc(E) idma64(E) intel_ishtp(E) usb_common(E) crct10dif_common(E) drm(E) wmi(E)
[72045.337980] CR2: 000000000000001c
[72045.337983] ---[ end trace 0000000000000000 ]---
[72045.675586] RIP: 0010:dma_direct_unmap_sg+0x4f/0x1c0
[72045.675609] Code: f3 41 89 d7 45 31 e4 41 89 ce eb 1e 83 e0 fe 89 43 1c 48 89 df 41 83 c4 01 e8 bd 26 30 00 48 89 c3 45 39 e7 0f 84 e4 00 00 00 <8b> 43 1c a8 01 75 db 49 8b bd 50 02 00 00 44 8b 4b 18 48 8b 73 10
[72045.675613] RSP: 0018:ffffac8cc4f87da8 EFLAGS: 00010202
[72045.675617] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[72045.675619] RDX: 00000000554b2000 RSI: 00000002c1190000 RDI: ffff8f1936658200
[72045.675622] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000003000
[72045.675624] R10: ffffffffb24dcbc0 R11: 0000000000000000 R12: 0000000000000011
[72045.675626] R13: ffff8f18c14a60c0 R14: 0000000000000000 R15: 0000000000000013
[72045.675628] FS:  0000000000000000(0000) GS:ffff8f202f7c0000(0000) knlGS:0000000000000000
[72045.675631] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[72045.675633] CR2: 000000000000001c CR3: 0000000145d98003 CR4: 0000000000770ee0
[72045.675636] PKRU: 55555554
[72045.675637] note: kworker/u16:26[2884] exited with irqs disabled
[72050.316306] ath11k_pci 0000:72:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[72050.316323] ath11k_pci 0000:72:00.0: failed to enable PMF QOS: (-108
[72050.316330] ------------[ cut here ]------------
[72050.316332] Hardware became unavailable during restart.
[72050.316382] WARNING: CPU: 4 PID: 177 at net/mac80211/util.c:2582 ieee80211_reconfig+0xb9a/0xfa0 [mac80211]
[72050.316443] Modules linked in: sha512_generic(E) ctr(E) ccm(E) michael_mic(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) qrtr_mhi(E) snd_ctl_led(E) snd_soc_skl_hda_dsp(E) snd_soc_intel_hda_dsp_common(E) snd_soc_hdac_hdmi(E) snd_sof_probes(E) snd_hda_codec_hdmi(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) snd_hda_codec_realtek(E) coretemp(E) snd_hda_codec_generic(E) kvm_intel(E) snd_soc_dmic(E) hid_sensor_als(E) snd_sof_pci_intel_tgl(E) hid_sensor_trigger(E) kvm(E) snd_sof_intel_hda_common(E) hid_sensor_iio_common(E) snd_soc_acpi_intel_match(E) irqbypass(E) snd_soc_acpi(E) snd_soc_hdac_hda(E) industrialio_triggered_buffer(E) crc32_pclmul(E) snd_sof_pci(E) snd_sof_xtensa_dsp(E) kfifo_buf(E) snd_sof_intel_hda_mlink(E) industrialio(E) snd_sof_intel_hda(E) ghash_clmulni_intel(E) snd_sof(E) qrtr(E) snd_sof_utils(E) snd_hda_ext_core(E) dell_laptop(E) ledtrig_audio(E) ath11k_pci(E) snd_soc_core(E) intel_rapl_msr(E) dcdbas(E) uvcvideo(E) mhi(E) snd_compress(E) videobuf2_vmalloc(E) snd_hda_intel(E) ath11k(E) videobuf2_memops(E)
[72050.316516]  snd_intel_dspcfg(E) aesni_intel(E) qmi_helpers(E) uvc(E) snd_hda_codec(E) processor_thermal_device_pci_legacy(E) libaes(E) dell_smm_hwmon(E) intel_soc_dts_iosf(E) snd_hwdep(E) crypto_simd(E) snd_hda_core(E) cryptd(E) videobuf2_v4l2(E) processor_thermal_device(E) mac80211(E) videodev(E) snd_pcm(E) dell_wmi(E) intel_cstate(E) tpm_crb(E) processor_thermal_rfim(E) libarc4(E) intel_uncore(E) snd_timer(E) processor_thermal_mbox(E) videobuf2_common(E) iTCO_wdt(E) ucsi_acpi(E) tpm_tis(E) cfg80211(E) snd(E) pcspkr(E) mei_me(E) intel_pmc_bxt(E) tpm_tis_core(E) processor_thermal_rapl(E) typec_ucsi(E) dell_smbios(E) iTCO_vendor_support(E) dell_wmi_ddv(E) dell_wmi_sysman(E) mc(E) firmware_attributes_class(E) dell_wmi_descriptor(E) watchdog(E) wmi_bmof(E) rfkill(E) mei(E) soundcore(E) hid_sensor_hub(E) intel_rapl_common(E) tpm(E) typec(E) battery(E) rng_core(E) button(E) int3403_thermal(E) int340x_thermal_zone(E) int3400_thermal(E) ac(E) acpi_tad(E) intel_hid(E) joydev(E) sparse_keymap(E) acpi_thermal_rel(E)
[72050.316598]  intel_pmc_core(E) acpi_pad(E) evdev(E) serio_raw(E) fuse(E) efi_pstore(E) efivarfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E) crc16(E) mbcache(E) jbd2(E) hid_generic(E) intel_ishtp_hid(E) hid(E) nvme(E) nvme_core(E) t10_pi(E) i915(E) rtsx_pci_sdmmc(E) i2c_algo_bit(E) drm_buddy(E) mmc_core(E) crc64_rocksoft(E) drm_display_helper(E) crc64(E) rtsx_pci(E) crc32c_intel(E) xhci_pci(E) i2c_i801(E) crc_t10dif(E) drm_kms_helper(E) i2c_smbus(E) xhci_hcd(E) crct10dif_generic(E) video(E) cec(E) intel_lpss_pci(E) ttm(E) intel_lpss(E) crct10dif_pclmul(E) usbcore(E) intel_ish_ipc(E) idma64(E) intel_ishtp(E) usb_common(E) crct10dif_common(E) drm(E) wmi(E)
[72050.316669] CPU: 4 PID: 177 Comm: kworker/4:2 Tainted: G      D W   E      6.6.0-rc4-wt-ath-01193-ga2021f91b86e #88
[72050.316676] Hardware name: Dell Inc. XPS 13 9310/0MRT12, BIOS 3.17.0 07/12/2023
[72050.316680] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[72050.316712] RIP: 0010:ieee80211_reconfig+0xb9a/0xfa0 [mac80211]
[72050.316758] Code: fb ff ff 41 c6 86 85 05 00 00 00 4c 89 f7 e8 cd 17 fc ff 41 89 c7 85 c0 0f 84 68 01 00 00 48 c7 c7 80 ca f3 c0 e8 26 73 f7 ef <0f> 0b e9 48 f5 ff ff 49 81 cf 00 08 00 00 85 c0 0f 85 0b fe ff ff
[72050.316763] RSP: 0018:ffffac8cc05a7d68 EFLAGS: 00010282
[72050.316768] RAX: 0000000000000000 RBX: ffff8f18c4221a80 RCX: 0000000000000027
[72050.316772] RDX: ffff8f202f71c608 RSI: 0000000000000001 RDI: ffff8f202f71c600
[72050.316775] RBP: ffff8f18c4221e68 R08: 0000000000000000 R09: ffffac8cc05a7c10
[72050.316778] R10: 0000000000000003 R11: ffffffffb1ea89a8 R12: ffff8f18c4221a80
[72050.316781] R13: ffff8f18c42208e0 R14: ffff8f18c42208e0 R15: 00000000ffffff94
[72050.316784] FS:  0000000000000000(0000) GS:ffff8f202f700000(0000) knlGS:0000000000000000
[72050.316788] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[72050.316791] CR2: 000005f000716000 CR3: 000000047ea14004 CR4: 0000000000770ee0
[72050.316795] PKRU: 55555554
[72050.316797] Call Trace:
[72050.316802]  <TASK>
[72050.316806]  ? __warn+0x6b/0xd0
[72050.316818]  ? ieee80211_reconfig+0xb9a/0xfa0 [mac80211]
[72050.316862]  ? report_bug+0x147/0x190
[72050.316871]  ? handle_bug+0x41/0x70
[72050.316880]  ? exc_invalid_op+0x13/0x60
[72050.316884]  ? asm_exc_invalid_op+0x16/0x20
[72050.316895]  ? ieee80211_reconfig+0xb9a/0xfa0 [mac80211]
[72050.316936]  ? ieee80211_reconfig+0xb9a/0xfa0 [mac80211]
[72050.316977]  ? finish_wait+0x2f/0x70
[72050.316985]  ? synchronize_rcu_expedited+0x2bb/0x3b0
[72050.316992]  ? __pfx_wait_rcu_exp_gp+0x10/0x10
[72050.316997]  ? __pfx_autoremove_wake_function+0x10/0x10
[72050.317003]  ? __timer_delete_sync+0x78/0xe0
[72050.317010]  ieee80211_restart_work+0xd9/0x140 [mac80211]
[72050.317040]  process_one_work+0x15b/0x270
[72050.317049]  worker_thread+0x2ec/0x410
[72050.317057]  ? __pfx_worker_thread+0x10/0x10
[72050.317064]  kthread+0xdc/0x110
[72050.317071]  ? __pfx_kthread+0x10/0x10
[72050.317076]  ret_from_fork+0x28/0x40
[72050.317085]  ? __pfx_kthread+0x10/0x10
[72050.317090]  ret_from_fork_asm+0x1b/0x30
[72050.317095]  </TASK>
[72050.317097] ---[ end trace 0000000000000000 ]---
[72050.348308] ------------[ cut here ]------------
[72050.348323] WARNING: CPU: 4 PID: 177 at net/mac80211/driver-ops.c:41 drv_stop+0x4a/0x60 [mac80211]
[72050.348355] Modules linked in: sha512_generic(E) ctr(E) ccm(E) michael_mic(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) qrtr_mhi(E) snd_ctl_led(E) snd_soc_skl_hda_dsp(E) snd_soc_intel_hda_dsp_common(E) snd_soc_hdac_hdmi(E) snd_sof_probes(E) snd_hda_codec_hdmi(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) snd_hda_codec_realtek(E) coretemp(E) snd_hda_codec_generic(E) kvm_intel(E) snd_soc_dmic(E) hid_sensor_als(E) snd_sof_pci_intel_tgl(E) hid_sensor_trigger(E) kvm(E) snd_sof_intel_hda_common(E) hid_sensor_iio_common(E) snd_soc_acpi_intel_match(E) irqbypass(E) snd_soc_acpi(E) snd_soc_hdac_hda(E) industrialio_triggered_buffer(E) crc32_pclmul(E) snd_sof_pci(E) snd_sof_xtensa_dsp(E) kfifo_buf(E) snd_sof_intel_hda_mlink(E) industrialio(E) snd_sof_intel_hda(E) ghash_clmulni_intel(E) snd_sof(E) qrtr(E) snd_sof_utils(E) snd_hda_ext_core(E) dell_laptop(E) ledtrig_audio(E) ath11k_pci(E) snd_soc_core(E) intel_rapl_msr(E) dcdbas(E) uvcvideo(E) mhi(E) snd_compress(E) videobuf2_vmalloc(E) snd_hda_intel(E) ath11k(E) videobuf2_memops(E)
[72050.348402]  snd_intel_dspcfg(E) aesni_intel(E) qmi_helpers(E) uvc(E) snd_hda_codec(E) processor_thermal_device_pci_legacy(E) libaes(E) dell_smm_hwmon(E) intel_soc_dts_iosf(E) snd_hwdep(E) crypto_simd(E) snd_hda_core(E) cryptd(E) videobuf2_v4l2(E) processor_thermal_device(E) mac80211(E) videodev(E) snd_pcm(E) dell_wmi(E) intel_cstate(E) tpm_crb(E) processor_thermal_rfim(E) libarc4(E) intel_uncore(E) snd_timer(E) processor_thermal_mbox(E) videobuf2_common(E) iTCO_wdt(E) ucsi_acpi(E) tpm_tis(E) cfg80211(E) snd(E) pcspkr(E) mei_me(E) intel_pmc_bxt(E) tpm_tis_core(E) processor_thermal_rapl(E) typec_ucsi(E) dell_smbios(E) iTCO_vendor_support(E) dell_wmi_ddv(E) dell_wmi_sysman(E) mc(E) firmware_attributes_class(E) dell_wmi_descriptor(E) watchdog(E) wmi_bmof(E) rfkill(E) mei(E) soundcore(E) hid_sensor_hub(E) intel_rapl_common(E) tpm(E) typec(E) battery(E) rng_core(E) button(E) int3403_thermal(E) int340x_thermal_zone(E) int3400_thermal(E) ac(E) acpi_tad(E) intel_hid(E) joydev(E) sparse_keymap(E) acpi_thermal_rel(E)
[72050.348458]  intel_pmc_core(E) acpi_pad(E) evdev(E) serio_raw(E) fuse(E) efi_pstore(E) efivarfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E) crc16(E) mbcache(E) jbd2(E) hid_generic(E) intel_ishtp_hid(E) hid(E) nvme(E) nvme_core(E) t10_pi(E) i915(E) rtsx_pci_sdmmc(E) i2c_algo_bit(E) drm_buddy(E) mmc_core(E) crc64_rocksoft(E) drm_display_helper(E) crc64(E) rtsx_pci(E) crc32c_intel(E) xhci_pci(E) i2c_i801(E) crc_t10dif(E) drm_kms_helper(E) i2c_smbus(E) xhci_hcd(E) crct10dif_generic(E) video(E) cec(E) intel_lpss_pci(E) ttm(E) intel_lpss(E) crct10dif_pclmul(E) usbcore(E) intel_ish_ipc(E) idma64(E) intel_ishtp(E) usb_common(E) crct10dif_common(E) drm(E) wmi(E)
[72050.348505] CPU: 4 PID: 177 Comm: kworker/4:2 Tainted: G      D W   E      6.6.0-rc4-wt-ath-01193-ga2021f91b86e #88
[72050.348509] Hardware name: Dell Inc. XPS 13 9310/0MRT12, BIOS 3.17.0 07/12/2023
[72050.348512] Workqueue: events_freezable ieee80211_restart_work [mac80211]
[72050.348533] RIP: 0010:drv_stop+0x4a/0x60 [mac80211]
[72050.348557] Code: b0 05 00 00 f0 ff 83 c0 05 00 00 e8 70 c2 fb ef f0 83 44 24 fc 00 f0 ff 8b c0 05 00 00 c6 83 85 05 00 00 00 5b c3 cc cc cc cc <0f> 0b c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00
[72050.348560] RSP: 0018:ffffac8cc05a7cd0 EFLAGS: 00010246
[72050.348564] RAX: ffff8f18c4220398 RBX: ffff8f18c332c900 RCX: 0000000000000000
[72050.348566] RDX: 0000000000000001 RSI: 0000000000000296 RDI: ffff8f18c42208e0
[72050.348568] RBP: ffff8f18c42208e0 R08: 0000000000000400 R09: 0000000000000002
[72050.348570] R10: ffff8f18c4221048 R11: 0000000000000001 R12: ffff8f18c42211b0
[72050.348572] R13: ffff8f18c4220df0 R14: 0000000000000000 R15: ffff8f18c332db48
[72050.348574] FS:  0000000000000000(0000) GS:ffff8f202f700000(0000) knlGS:0000000000000000
[72050.348577] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[72050.348579] CR2: 0000367c09c9a000 CR3: 000000014fb68001 CR4: 0000000000770ee0
[72050.348582] PKRU: 55555554
[72050.348584] Call Trace:
[72050.348587]  <TASK>
[72050.348589]  ? __warn+0x6b/0xd0
[72050.348596]  ? drv_stop+0x4a/0x60 [mac80211]
[72050.348620]  ? report_bug+0x147/0x190
[72050.348626]  ? handle_bug+0x41/0x70
[72050.348632]  ? exc_invalid_op+0x13/0x60
[72050.348635]  ? asm_exc_invalid_op+0x16/0x20
[72050.348642]  ? drv_stop+0x4a/0x60 [mac80211]
[72050.348666]  ieee80211_do_stop+0x5dd/0x7d0 [mac80211]
[72050.348703]  ? wireless_nlevent_flush+0x4a/0x70
[72050.348708]  ieee80211_stop+0x4f/0x180 [mac80211]
[72050.348740]  __dev_close_many+0x89/0x100
[72050.348745]  dev_close_many+0x76/0x120
[72050.348747]  dev_close+0x58/0x70
[72050.348751]  cfg80211_shutdown_all_interfaces+0x44/0xe0 [cfg80211]
[72050.348772]  ieee80211_restart_work+0x113/0x140 [mac80211]
[72050.348792]  process_one_work+0x15b/0x270
[72050.348798]  worker_thread+0x2ec/0x410
[72050.348803]  ? __pfx_worker_thread+0x10/0x10
[72050.348808]  kthread+0xdc/0x110
[72050.348812]  ? __pfx_kthread+0x10/0x10
[72050.348816]  ret_from_fork+0x28/0x40
[72050.348822]  ? __pfx_kthread+0x10/0x10
[72050.348825]  ret_from_fork_asm+0x1b/0x30
[72050.348829]  </TASK>
[72050.348830] ---[ end trace 0000000000000000 ]---

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
