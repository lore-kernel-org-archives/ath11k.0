Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5637C433F5
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:56:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF4961B54
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADF4961B54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSSOqKPOC09GmhcwAiEg/VmgoSGpMNi8DjsCm7U/vqM=; b=oqPoe6EBhT5Gi3
	RWoAo09dD9bHhmSGia/TGTnZJnGxeFa4e7D5xWJLAfiwEcSH1eIROeyKTkeLrjq05YRdYiZk0Chj0
	vw2eIG6kzO35h3p54/y9CyvKd56W7GlYrpapeIZ13lmZlbaELYOU2GWQtBq1Q7wopDa8lqDbdALO0
	bA8cQV71w4Nt8WOtu7JcTmtaE3lplL2y7NWDyKN5NlzOA7Sdl92LrGPFmXS6tw8KWG+6lIzz7vzbb
	13m7NWU+KVQ4jCVNypmPU0hixth/aw6CnxTL1ag/sbLSZ+LGgLvw7FHdTwgrLEawv0RkpDy2Jupu7
	F4I9kzZy+cli4Dz551/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGk8-0041me-QH; Wed, 17 Nov 2021 08:56:36 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGk6-0041Zz-5b
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 08:56:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637139394; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Yf5qxhfCd3KnTbByiXlNJjpBDBIGBtWq45dVk6Q4nqI=;
 b=Y1yAeTduYwZnKTx4lzLXxSsHUatqNbMrIbHw4QQrc2RiFZhOUZUm7AxnuvFjiGvj4+v1kqQF
 vdDASefvF8LrPA33DS/lASGZissm/FtdSU40OWflE5eZV9P1s/lQxh2x3hWCL1RwCZqQpljF
 2kwkWph5Ci7kL4lrHgu0Os1XmkM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6194c3c111cd6d4077b3d9e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 08:56:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2F250C43616; Wed, 17 Nov 2021 08:56:33 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B6A48C4338F;
 Wed, 17 Nov 2021 08:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B6A48C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix read fail for htt_stats and htt_peer_stats for
 single pdev
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211028024749.15039-1-quic_wgong@quicinc.com>
References: <20211028024749.15039-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713939005.10263.8670565853421065012.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 08:56:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_005634_310853_3B22E986 
X-CRM114-Status: UNSURE (   9.98  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> The pdev id is set to 0 for single pdev configured hardware, the real
> pdev id is not 0 in firmware, for example, its pdev id is 1 for 5G/6G
> phy and 2 for 2G band phy. For HTT_H2T_MSG_TYPE_EXT_STATS_CFG message,
> firmware parse the pdev_mask to its pdev id, ath11k set it to 0 for
> single pdev, it is not correct, need set it with the real pdev id of
> firmware.
> 
> Save the real pdev id report by firmware and set it correctly.
> 
> Below commands run success with this patch:
> cat /sys/kernel/debug/ieee80211/phy0/ath11k/htt_stats
> cat /sys/kernel/debug/ieee80211/phy0/netdev\:wls1/stations/00\:03\:7f\:75\:59\:85/htt_peer_stats
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Fails to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/mac.h:150
error: drivers/net/wireless/ath/ath11k/mac.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/wmi.h:115
error: drivers/net/wireless/ath/ath11k/wmi.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211028024749.15039-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
