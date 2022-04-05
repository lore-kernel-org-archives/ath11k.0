Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEFBC433F5
	for <ath11k@archiver.kernel.org>; Tue,  5 Apr 2022 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZbI890Gi5KhzNKlwpxTB0EqyNyQ/KRe6j3HNMGjIdg=; b=h0MyHEh2+BAQ0n
	Sk3hHok5XYXp0EaK8MN2WVkylZHs6S+E83hNN7BzOXzw3cpGfqISrx3CKEm58FgMe0imdrQZ7tBe9
	5Cvm1D6oAh8Nmzd9AX143fKO7iJGvaJ4njYQNTn8jtQtzqP8J7UZ5aUE2JJy0udUweS/o/se0IR7w
	mQ+1Fwq04g6GqQ4NWraHMMdf4pdUZIIUFMtTmNGHT88S0oHWPEDDUkziJMWR0DqZ0t7kf5KAP0TZ1
	Hje8sM0nhUdRIOTWg6BQYaEtaCvwVknHi17TmimxHqxQ60Q9a/4N9rNqnRJdsOF10FeVSJ70Re12/
	oPCAS3QcxIlBYDxO3MGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbeJF-0009dN-2w; Tue, 05 Apr 2022 08:13:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbeJC-0009d0-22
 for ath11k@lists.infradead.org; Tue, 05 Apr 2022 08:13:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5AD660B0F;
 Tue,  5 Apr 2022 08:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FD7C385A4;
 Tue,  5 Apr 2022 08:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649146381;
 bh=F35LVzPSMbl4xme/Ng2had37NNAHTTd7FY9WMlQHFtM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=jsEyLsCImzcRLjkdVtpydrf80wj2Ze6D9BbfcDrP8ZP7bT18gaRr2zdneOL+U0+Pl
 uzy4/HAJCFQ1iUkWlc6Th+gRZqvV5PCohmQ7edeL0WL4d9J5IIUu0trLx9/aqcL3w5
 buihP1vd3V3+1oA9PgfcgmiFPvRKHH64WhVeNqO1BPELd4QmhUR0obdErbRrBOLMwv
 DFSIHv01xiVuqRS+H3ahTdfbJMLOF3ZQVUJZQxeu15s6/0ziH+ZAd03u4qXMZIWRv2
 6BXkc3IxKS3/QViqadnWWyopaQhQZtrEiRqRgxxB27hQd01eAiBeone56SCnIa/+UI
 xRTKgaAH5ZOIQ==
MIME-Version: 1.0
Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220331073110.3846-1-quic_nmaran@quicinc.com>
References: <20220331073110.3846-1-quic_nmaran@quicinc.com>
To: Nagarajan Maran <quic_nmaran@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Nagarajan Maran <quic_nmaran@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164914637845.12306.2600780385963104595.kvalo@kernel.org>
Date: Tue,  5 Apr 2022 08:12:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_011302_222368_DC67ED0F 
X-CRM114-Status: GOOD (  11.18  )
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

Nagarajan Maran <quic_nmaran@quicinc.com> wrote:

> In the "ath11k_wow_init", error value "EINVAL" is returned
> when the check for firmware support of WoW feature fails,
> which in turn stops the driver initialization.
> 
> Warning message:
> [   31.040144] ------------[ cut here ]------------
> [   31.040185] WARNING: CPU: 1 PID: 51 at drivers/net/wireless/ath/ath11k/wow.c:813 ath11k_wow_init+0xc8/0x13a8 [ath11k]
> [   31.043846] Modules linked in: ath11k_pci ath11k qmi_helpers
> [   31.054341] CPU: 1 PID: 51 Comm: kworker/u8:1 Tainted: G        W    5.17.0-wt-ath-594817-ga7f6aa925cf8-dirty #17
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
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
> Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

633469e3bac1 ath11k: fix driver initialization failure with WoW unsupported hw

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220331073110.3846-1-quic_nmaran@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
