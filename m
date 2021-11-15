Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1C3C433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D8CD61BFA
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D8CD61BFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKRQKmdY2yT5+OPliqDBrzF9af6rmOyW2u/beB9oCM0=; b=z8lfVrTIBHkAqW
	XEe139x/wR0bpUkf62wLEyGhxyKtfFg8JfE82DOUIV8R3iQzteQVlblz/FOKK4RBGabmyX02kSz7z
	eNoIV7msNqig/JLIy3gPIL8AeIYj44oDryTfX5th2kWXHVE5uTVpo0uZK4L6b1taeu9aK8VMeSGjk
	kqr1YEKibpuhctk84SsiJIV3XToafZxfJg82pritUc0RdiYVtoRKsfTni1qz/sdcgd7dKSf8RD9la
	Wugacz0YoVCRu6obXAglAfiJfIOk4hhaXUwbBbVd0WSEX/tGB3h2QrimOGVqD7rL0Pq6TlOfmZBbT
	K9ufPV36SZNn3swOH3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZ93-00FAWF-VX; Mon, 15 Nov 2021 10:23:26 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmZ7T-00FA5B-I3
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 10:21:49 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636971705; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=c7g98jhJOJwoW5CEHJwOtHOjiWD9jMWwgmgSb4PibHI=;
 b=Ni6aGMbXRB86sMK+u+gBuD2C0UjIm4SC5fCBYaA7Jj7Y/XccMKlXiRoZAQAF4w5eURJSQdnb
 /Gj7CsY2+oJB74/+RlvLQh0gQOXnIH11l8sFHEpsvkkchMtRu6AnHSE2bXrNEMijrv4WhzHP
 D95pxoJ5oXuZEjUKYF09ONpyqZw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 619234b6e10f164c250ea1ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 10:21:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9DDCCC43617; Mon, 15 Nov 2021 10:21:41 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F514C43460;
 Mon, 15 Nov 2021 10:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3F514C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: add hw_param for wakeup_mhi
References: <1636702019-26142-1-git-send-email-quic_seevalam@quicinc.com>
Date: Mon, 15 Nov 2021 12:21:36 +0200
In-Reply-To: <1636702019-26142-1-git-send-email-quic_seevalam@quicinc.com>
 (Seevalamuthu Mariappan's message of "Fri, 12 Nov 2021 12:56:59
 +0530")
Message-ID: <87czn1iurz.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_022147_722512_65C3B1ED 
X-CRM114-Status: GOOD (  11.72  )
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

Seevalamuthu Mariappan <quic_seevalam@quicinc.com> writes:

> Wakeup mhi is needed before pci_read/write only for QCA6390
> and WCN6855. Since wakeup & release mhi is enabled for all
> hardwares, below mhi assert is seen in QCN9074.
>
> 	Kernel panic - not syncing: dev_wake != 0
> 	CPU: 2 PID: 13535 Comm: procd Not tainted 4.4.60 #1
> 	Hardware name: Generic DT based system
> 	[<80316dac>] (unwind_backtrace) from [<80313700>] (show_stack+0x10/0x14)
> 	[<80313700>] (show_stack) from [<805135dc>] (dump_stack+0x7c/0x9c)
> 	[<805135dc>] (dump_stack) from [<8032136c>] (panic+0x84/0x1f8)
> 	[<8032136c>] (panic) from [<80549b24>] (mhi_pm_disable_transition+0x3b8/0x5b8)
> 	[<80549b24>] (mhi_pm_disable_transition) from [<80549ddc>] (mhi_power_down+0xb8/0x100)
> 	[<80549ddc>] (mhi_power_down) from [<7f5242b0>] (ath11k_mhi_op_status_cb+0x284/0x3ac [ath11k_pci])
> 	[E][__mhi_device_get_sync] Did not enter M0 state, cur_state:RESET pm_state:SHUTDOWN Process
> 	[E][__mhi_device_get_sync] Did not enter M0 state, cur_state:RESET pm_state:SHUTDOWN Process
> 	[E][__mhi_device_get_sync] Did not enter M0 state, cur_state:RESET pm_state:SHUTDOWN Process
> 	[<7f5242b0>] (ath11k_mhi_op_status_cb [ath11k_pci]) from [<7f524878>] (ath11k_mhi_stop+0x10/0x20 [ath11k_pci])
> 	[<7f524878>] (ath11k_mhi_stop [ath11k_pci]) from [<7f525b94>] (ath11k_pci_power_down+0x54/0x90 [ath11k_pci])
> 	[<7f525b94>] (ath11k_pci_power_down [ath11k_pci]) from [<8056b2a8>] (pci_device_shutdown+0x30/0x44)
> 	[<8056b2a8>] (pci_device_shutdown) from [<805cfa0c>] (device_shutdown+0x124/0x174)
> 	[<805cfa0c>] (device_shutdown) from [<8033aaa4>] (kernel_restart+0xc/0x50)
> 	[<8033aaa4>] (kernel_restart) from [<8033ada8>] (SyS_reboot+0x178/0x1ec)
> 	[<8033ada8>] (SyS_reboot) from [<80301b80>] (ret_fast_syscall+0x0/0x34)
>
> Hence, disable wakeup/release mhi using hw_param for other hardwares.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01060-QCAHKSWPL_SILICONZ-1
>
> Fixes: a05bd85133 ("ath11k: read and write registers below unwindowed address")
> Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>

The commit log is not quite clear, are you saying that commit a05bd85133
broke QCN9074 support altogether? Or it was failing only in some cases?
I can update the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
