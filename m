Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA99DC433EF
	for <ath11k@archiver.kernel.org>; Thu, 31 Mar 2022 10:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kS0Un5oGs0UBj4VDdGq3djaSDzzwah+IB7ECe1+Au7s=; b=1zRuxDnze0em0M
	WuF8HWO0CgC8EUez/x5/GQrh8q/yv0Wa27XPakAR/HXMgTtHiT8COedPKylryJY7M/Zx4mqi29Ols
	OfCBjmxmJ0T9UhXzJz6Y1kXSO+rM3iauYJPeyu/G8g0plki6zCQTfmKUxy+wm5x720zLzhtzlYOqg
	ZwrmJHN0Xv/Y+GAv6g6tEwwuKjpLXVipl8w+ngUcWSlX2oquOPHfH783dv+GQzmIcwFQCllILI+6w
	AaTv3AxcPifSI3dh1982MyxLl17X1ttFsagr5rF56irMlc3IzJvKD4HUbYZ9y0rlQyZrbXlktw+g5
	jPS3ncFC2k1T8iQmVNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZsID-001tgm-Hu; Thu, 31 Mar 2022 10:44:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZsIA-001tfl-8G
 for ath11k@lists.infradead.org; Thu, 31 Mar 2022 10:44:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA3AE60F76;
 Thu, 31 Mar 2022 10:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A2DC340F2;
 Thu, 31 Mar 2022 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648723476;
 bh=meOVseHIYU1aGUHC8VQLsSkRUp60Na4Hk8+UBiYMIPQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=R3sEsxGrSYPRYAq/Mhuu6U7ADyzBhfNUaQ6CIqOsDs0BY6KC7nT3ehg3VPQSyv53G
 jr5fwK+63gTmO0aAoKX6fLx4QwHzIUTiU97zKVYuA00wzo1KfT+jr1fGInY7Wh/fAl
 RONe+umiD2fKMfTdrgWxD1bBwYe7f+huyhI8IodM5oWGmmo9N9GeM1OedGazwiMNQM
 XvqDdWDh9w17U3Ue8B1o+9U6SHSKHKdV9Fr224Kk7NBRVcy2o7HGwWCS6p0NtQY0k2
 8yWPM42uA4hJniJcItq0pCOvAqYpOpAN1FHRf8StOQDKrL5VWMjsI0zIm3/pFWALjl
 XEci+HReiMVIQ==
From: Kalle Valo <kvalo@kernel.org>
To: Nagarajan Maran <quic_nmaran@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
References: <20220331073110.3846-1-quic_nmaran@quicinc.com>
Date: Thu, 31 Mar 2022 13:44:30 +0300
In-Reply-To: <20220331073110.3846-1-quic_nmaran@quicinc.com> (Nagarajan
 Maran's message of "Thu, 31 Mar 2022 13:01:10 +0530")
Message-ID: <87sfqyv1td.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_034438_410707_BDE9952C 
X-CRM114-Status: GOOD (  12.97  )
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

Nagarajan Maran <quic_nmaran@quicinc.com> writes:

> In the "ath11k_wow_init", error value "EINVAL" is returned
> when the check for firmware support of WoW feature fails,
> which in turn stops the driver initialization.
>
> Warning message:
> [   31.040144] ------------[ cut here ]------------
> [   31.040185] WARNING: CPU: 1 PID: 51 at drivers/net/wireless/ath/ath11k/wow.c:813 ath11k_wow_init+0xc8/0x13a8 [ath11k]
> [   31.043846] Modules linked in: ath11k_pci ath11k qmi_helpers
> [   31.054341] CPU: 1 PID: 51 Comm: kworker/u8:1 Tainted: G        W	5.17.0-wt-ath-594817-ga7f6aa925cf8-dirty #17
> [   31.060078] Hardware name: Qualcomm Technologies, Inc. IPQ8074/AP-HK10-C2 (DT)
> [   31.070578] Workqueue: ath11k_qmi_driver_event ath11k_qmi_driver_event_work [ath11k]
> [   31.077782] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   31.085676] pc : ath11k_wow_init+0xc8/0x13a8 [ath11k]
> [   31.092359] lr : ath11k_mac_register+0x548/0xb98 [ath11k]
> [   31.097567] sp : ffff80000aa13c40
> [   31.102944] x29: ffff80000aa13c40 x28: ffff800009184390 x27: ffff000002959f20
> [   31.106251] x26: ffff000002828000 x25: ffff000002830000 x24: ffff000002830000
> [   31.113369] x23: ffff000002820000 x22: ffff00000282854c x21: 0000000000000000
> [   31.120487] x20: ffff00000295cf20 x19: ffff000002828540 x18: 0000000000000031
> [   31.127605] x17: 0000000000000004 x16: ffff0000028285fc x15: ffff00000295b040
> [   31.134723] x14: 0000000000000067 x13: ffff00000282859c x12: 000000000000000d
> [   31.141840] x11: 0000000000000018 x10: 0000000000000004 x9 : 0000000000000000
> [   31.148959] x8 : ffff00000289d680 x7 : 0000000000000000 x6 : 000000000000003f
> [   31.156077] x5 : 0000000000000040 x4 : 0000000000000000 x3 : ffff000002820968
> [   31.163196] x2 : 0000000000000080 x1 : 0080008af9981779 x0 : ffff000002959f20
> [   31.170314] Call trace:
> [   31.177421]  ath11k_wow_init+0xc8/0x13a8 [ath11k]
> [   31.179684]  ath11k_core_qmi_firmware_ready+0x430/0x5e0 [ath11k]
> [   31.184548]  ath11k_qmi_driver_event_work+0x16c/0x4f8 [ath11k]
> [   31.190623]  process_one_work+0x134/0x350
> [   31.196262]  worker_thread+0x12c/0x450
> [   31.200340]  kthread+0xf4/0x110
> [   31.203986]  ret_from_fork+0x10/0x20
> [   31.207026] ---[ end trace 0000000000000000 ]---
> [   31.210894] ath11k_pci 0000:01:00.0: failed to init wow: -22
> [   31.215467] ath11k_pci 0000:01:00.0: failed register the radio with mac80211: -22
> [   31.221117] ath11k_pci 0000:01:00.0: failed to create pdev core: -22
>
> Fix this by returning value "0" when FW doesn't support WoW
> to allow driver to proceed with initialize sequence and also
> remove the unnecessary "WARN_ON".
>
> Fixes: ba9177fcef21 ("Add basic WoW functionalities")
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>

Fixes tag is wrong, it should be:

Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")

I fixed it in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
