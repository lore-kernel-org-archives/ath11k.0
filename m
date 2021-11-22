Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4758C433F5
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bchsjfVxWXwqGvkVeq8QO/hrDSgMfMog2HLTyTU9NaA=; b=zid/ikXLclK/5a
	FXSxnlTasjWyfJ7tYzXswv4koNKxpYGHrZ66QK01o+ySZM6dC+KpC5b3CWHTAdLsk1sEuOgCp0OG1
	QZSa9ldo4V9shjm8DG7J6bgBgUVVR4SpLdpmZDuk8RB0BB1Nx9DA7cp8QM5YlmS8jyQolZ28jkGNa
	jkPLSW+e+KtwTi66ZM4ZYwftXibJ1Dst7wvh0JSjMZDoxf4iCH2Cs30DNtnf4ohvlKwnHn+2SHikK
	NADIYd3TGUajZ8/rh9M70ONOi8E8NoGBiCres++GzCzoJ8SUvX7E9C92bLTZOOB2rQn17pMCEHGGG
	uhDTpHCOcgVwtJoitU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp8SP-00GMSr-0l; Mon, 22 Nov 2021 12:30:01 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp8IJ-00GJQF-4X
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 12:19:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637583574; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=badTdAeiK7xcG9Sp7wYhaDwLAIKhT+cXxa3sjIgTA8Y=;
 b=slXW7RghjbyOGrsMIDi7N5Ot4hSu+VQFiKLTqFBmxA6wYIDh2b7/vv2IHbBraIVNNP4P7x5t
 mzpjv5Wch1ZRPBCOfRLGhflsdHWFg4J1rv85B0YInT8iNprAivYbZ3snb82e1+owwNQ3WGyM
 BPURc3LhNpp3zPHHaPpgzggzNuQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 619b8ad5db3ac5552a467f22 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 12:19:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 71DADC4360D; Mon, 22 Nov 2021 12:19:33 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F004AC4338F;
 Mon, 22 Nov 2021 12:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F004AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] ath11k: add wait operation for tx management packets
 for flush from mac80211
References: <20211118095254.7916-1-quic_wgong@quicinc.com>
Date: Mon, 22 Nov 2021 14:19:29 +0200
In-Reply-To: <20211118095254.7916-1-quic_wgong@quicinc.com> (Wen Gong's
 message of "Thu, 18 Nov 2021 04:52:54 -0500")
Message-ID: <871r389ycu.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_041935_292318_78B7D912 
X-CRM114-Status: GOOD (  13.50  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> In ath11k, tx of management packet is doing in a work queue. Sometimes
> the workqueue does not finish tx immediately, then it lead after the next
> step of vdev delete finished, it start to send the management packet to
> firmware and lead firmware crash.
>
> ieee80211_set_disassoc have logic of ieee80211_flush_queues after it
> send_deauth_disassoc to ath11k, its purpose is make sure the deauth
> was actually sent, so it need to change ath11k to match the purpose
> of mac80211.
>
> To address these issue wait for tx mgmt and tx data packets.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01230-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

I sometimes see new warnings with this patch:

[  142.346474] ath11k_pci 0000:06:00.0: failed to flush mgmt transmit queue 0
[  147.466367] ath11k_pci 0000:06:00.0: failed to flush mgmt transmit queue 0

And more importantly this breaks suspend on my NUC testbox:

[  175.141820] PM: suspend entry (deep)
[  175.150512] Filesystems sync: 0.008 seconds
[  175.229703] Freezing user space processes ... (elapsed 0.003 seconds) done.
[  175.233506] OOM killer disabled.
[  175.233588] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  175.242457] printk: Suspending console(s) (use no_console_suspend to debug)
[  175.245269] wlan0: deauthenticating from 00:03:7f:48:81:59 by local choice (Reason: 3=DEAUTH_LEAVING)
[  175.285881] e1000e: EEE TX LPI TIMER: 00000011
[  180.745259] ath11k_pci 0000:06:00.0: failed to flush mgmt transmit queue 0
[  185.864977] ath11k_pci 0000:06:00.0: failed to flush mgmt transmit queue 0
[  185.970601] PM: Some devices failed to suspend, or early wake event detected
[  185.974081] usb usb3: root hub lost power or was reset
[  185.974135] usb usb4: root hub lost power or was reset
[  186.098870] nvme nvme0: 8/0/0 default/read/poll queues
[  186.297077] OOM killer enabled.
[  186.297361] Restarting tasks ... done.
[  186.343733] PM: suspend exit

My setup:

Tag:	ath-202111221111

[  151.123732] ath11k_pci 0000:06:00.0: MSI vectors: 32
[  151.123851] ath11k_pci 0000:06:00.0: qca6390 hw2.0
[  151.720618] ath11k_pci 0000:06:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
[  151.720912] ath11k_pci 0000:06:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id 

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
