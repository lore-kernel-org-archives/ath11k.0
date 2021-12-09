Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E56C433EF
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEOz0o9Vh5B1OftMjEMlILoUHMrdBzIBld7mx2V9uik=; b=y5PzxwX80ML4sX
	bX5s4TRzKnJDKuZ7l//HsP+/EdV+/JlkAUw427Ha5N9y302YHI3GZA1zhNaGc3mFEycW/1zaSh2du
	kbHjBB2RMrKmgo+ZQp2smNim7WOFe0sSQHtIqgbKSeGNzyKg3zpAydoyez7O+7XXzvPodOu67Q6/9
	sNs6KHcoH6l+xYeWOyrTESmZD7D22PkGBVHyvxyKYpjlNGVY04aWrjYkA9sL0fSi/f5LtQ4xti3xe
	xlFZTpZvuIjzRUHagY/67bklzzOV2o7e9bgW2YMdympVZLY47MkZpyMuelCF0jhvkBi+PtZzX1aUf
	mSYD+1tC/rlNQn9bW1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvHFm-00Fj4C-M1; Thu, 09 Dec 2021 11:06:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvHFj-00Fj3b-Fm
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 11:06:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0CAA5CE25AD;
 Thu,  9 Dec 2021 11:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6FDC341C3;
 Thu,  9 Dec 2021 11:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639047973;
 bh=MtbrJuyMH2PmWEP5GeqbESrHoEZ5mauR6hgeJ2PPU84=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=i/hb1Ux3dN/E3dn3+Ysr4wRLuWA/E11ePd4T+2hEoCdGjG5OzDP9ZWx9pafta1faK
 eXSlKWmlh9m48yCplOaX7zZQ2mOHTnKLEjpisR++dZuO/zjgGDoe7hq/reRR91DLcu
 tkcBB4SOfZu6FPN5ct9A75Ma2wEdmRsmyCAkNfD3heRVQdYdm0S9GRnEGthHb1R83T
 g0YiKuTwKzcJuMNS62LlpY3cRRtlGQChy0SUDJ949drUN7MfuxssD4iqFvKIeb7h/u
 kMpYL2q/e9kG3BFUKOAgzeKKa5sVfQn5mL7c74Weiic7000/JTKS84FngUV6+JQaj0
 W9kP/MnzZctDw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add support of firmware logging for WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211206094834.2060080-1-quic_chengwan@quicinc.com>
References: <20211206094834.2060080-1-quic_chengwan@quicinc.com>
To: Cheng Wang <quic_chengwan@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_chengwan@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163904796954.31611.17209414120082546553.kvalo@kernel.org>
Date: Thu,  9 Dec 2021 11:06:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_030619_740291_E48CEFE6 
X-CRM114-Status: UNSURE (   6.90  )
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

Cheng Wang <quic_chengwan@quicinc.com> wrote:

> Host enables WMI firmware logging feature via QMI message.
> Host receives firmware logging messages on WMI_DIAG_EVENTID, then
> sends logging messages to user space via event tracing infrastructure.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Cheng Wang <quic_chengwan@quicinc.com>

Fails to apply, please rebase. And remember to use ath.git master branch
as the baseline and --base switch.

error: patch failed: drivers/net/wireless/ath/ath11k/core.c:71
error: drivers/net/wireless/ath/ath11k/core.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/hw.h:163
error: drivers/net/wireless/ath/ath11k/hw.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/qmi.c:1545
error: drivers/net/wireless/ath/ath11k/qmi.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/trace.h:105
error: drivers/net/wireless/ath/ath11k/trace.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/wmi.c:7077
error: drivers/net/wireless/ath/ath11k/wmi.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211206094834.2060080-1-quic_chengwan@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
