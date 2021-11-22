Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2934C4332F
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NktnQA8AehZKvHCrSW8Z+6+Lkrkld+jYAEVbygdDyso=; b=BDFfF+tIpjSq+C
	BcOxdQoKRcgcydlynaJCOEffnkXVAwSfOsbyQmdHIZsSKOGo42pPawmv+Ut+3d+eJ91HIjo6wabRi
	XnYcBADVtABIEjrRmHFpVWou+EVnpDD+DXb9F98yN/wR1dujSEhTeBdw4BoYYrh3pgeL1MBUNcvHj
	qu8WnUHG4Yb/jiN0oHWQhfhk4scPMf0U9ihE40NUQuQcLtHqjo/VAI1Izood1XjEnz7JNbgw49jlu
	bojBekayCuZxIL3iLuqww6dpTiAOLG+N4pMl+poErtbAn0sW3Qd2i69aPPyTI/872vGvVqqGiThEd
	iLEzsA6ZqTBiwSJ8k+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpAOa-00GsT7-Qo; Mon, 22 Nov 2021 14:34:12 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpAOT-00Gs2t-Jd
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 14:34:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637591650; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=OjrTvaa4H5Vb77OrB7p/bDCGP1Zzm2JWWr31uxP5SKk=;
 b=SxA5v0LRFZivgSgwpjdOjy7DrvS7T8jGX7pOFLr8RwgnAN6ef02eMAbtyK+lv0J6/YjSFgdc
 8dPJVXDv/Ie0BQ8+gPnW65nC7MgZX+cVbOhgxqbJ8GsuEuM7O7RNdw+WfXskb8bSZwvBinHD
 JwuHX881OwhMyR8L2e+FTbkmVUI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 619baa56db3ac5552ac171ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 14:33:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BF662C4360D; Mon, 22 Nov 2021 14:33:58 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3EDD1C4338F;
 Mon, 22 Nov 2021 14:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3EDD1C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: fix read fail for htt_stats and htt_peer_stats
 for single pdev
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211118095700.8149-1-quic_wgong@quicinc.com>
References: <20211118095700.8149-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163759163508.17469.1762707859387568333.kvalo@codeaurora.org>
Date: Mon, 22 Nov 2021 14:33:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_063411_058417_5915550C 
X-CRM114-Status: UNSURE (   9.55  )
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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1370634054d4 ath11k: fix read fail for htt_stats and htt_peer_stats for single pdev

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211118095700.8149-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
