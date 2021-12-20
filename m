Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2AFC433F5
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Biacw0DVWVQgziHx/0r8yNVY+0GgmbTii642zwIb8Y=; b=ghHTcxYmPb/CxV
	3JPENqj22/jL6OpSrYI56APeUPBl/5Qpl3mxFXULL/uXT4hStxLxCV7CLCouEK4PiC5PO7Q1x/uK7
	ZP0ohxjGxaLJKv+19ZyIY84TI8cSaKFEh49B5Qmh9NA+/5Rd82vMDWs/bp6SJV6KiUcCzONKI63sb
	cM3ZACyJlZBsvxGHVHRMTKp9togZ3GRo3TZphboEgawelPC8miiXuRMuF6TLu3BEhSFXt17foP7ny
	OTb7ch7Ns/YEp3YqmM2k7h1RhClook0jIsDCHjjq5K2VmX87FKZPknDcKIM++nAhr2ZDydK/cyyVq
	8XDsM8kkwktOoZyqPO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNPh-003nZP-D8; Mon, 20 Dec 2021 18:29:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNPe-003nYb-PW
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 18:29:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49D0C611D6;
 Mon, 20 Dec 2021 18:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC392C36AEB;
 Mon, 20 Dec 2021 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640024969;
 bh=XzQ14ZCElx219r+i7Dfr8dEqwHhqMpHHYRUqDkwz+F0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Lf6R8KLlo3qcuwJdBweaOmhRhEk5GU1trlmgoD9yU3ZKbtyp0CQun8c2Vu99JzDYl
 XdFVcSS+pYkdRCm+rz67Q6GX9nUryKEtHWhW0uEi6JGsYT6bd5x5ma5FAt6IPomnVd
 6hp7f41wyXI0x/bFewz5N18/iKPufgy1DNu6ImH8/y4IGI5ukNx4bi7PxwP+2FJ59z
 At+zuYoA0gApTuT1gpHDn6HKx24+fEoMZ8VD2duns9FnzX7QtPLMODYZHm1ZCzxBI3
 5VKendNCcfiT6Tx7dIdHDD1K+1OhsiDW6Y8LXx/ivxaUmFyljntE3F0IQaamiRJ2ZT
 KzC4CFbwVOFaQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: add support for hardware rfkill for QCA6390
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211217102334.14907-1-quic_wgong@quicinc.com>
References: <20211217102334.14907-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164002496714.8180.10579865678538990827.kvalo@kernel.org>
Date: Mon, 20 Dec 2021 18:29:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_102930_904828_AA2CACC7 
X-CRM114-Status: GOOD (  11.21  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> When hardware rfkill is enabled in the firmware it will report the
> capability via using WMI_SYS_CAP_INFO_RFKILL bit in the WMI_SERVICE_READY
> event to the host. ath11k will check the capability, and if it is enabled then
> ath11k will set the GPIO information to firmware using WMI_PDEV_SET_PARAM. When
> the firmware detects hardware rfkill is enabled by the user, it will report it
> via WMI_RFKILL_STATE_CHANGE_EVENTID. Once ath11k receives the event it will
> send wmi command WMI_PDEV_SET_PARAM to the firmware and also notifies cfg80211.
> 
> This only enable rfkill feature for QCA6390, rfkill_pin is all initialized to 0
> for other chips in ath11k_hw_params.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ec038c6127fa ath11k: add support for hardware rfkill for QCA6390

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211217102334.14907-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
