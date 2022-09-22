Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC07C6FA8B
	for <ath11k@archiver.kernel.org>; Thu, 22 Sep 2022 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ppzh0g01mrqQvYq9TLCBJ3qpC9EX/OQvlqPMBcelR4=; b=Tt3nBh+S/zyaXH
	sz9XS/Y3qb9ypo5FA4ah/XJxwYfFk2dUdnU+QWk7B1DQRw+o7nTGjeZ0cK1pW6ed+KkTWFsSu8jgL
	/+oKtAed1IauT6dDsFHLlOvO9zPI4VpKJ3+CcEPyffK3HO/dfwgASpPkEz6vkCfdn7wskGpAm9g9x
	qZjkGELmq69Ue7AOfj24ar5I5riKPGr1prOVATQCIUYcNHCi4z678wT+6pt1vgCJxxK6/eQMNOAm2
	u0uNU2dW+xxDfGlOSPn4ImubTwLSqJtbQzvjCKwLP7aWlW81RUfOrCo+0DRjlYqMmaRf4+Xo/hvZR
	GS/Idd5FiDc2CiR9255w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHM6-00E3b4-RP; Thu, 22 Sep 2022 08:14:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHLf-00E3L8-0M
	for ath11k@lists.infradead.org; Thu, 22 Sep 2022 08:14:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A813A63448;
	Thu, 22 Sep 2022 08:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0925CC433C1;
	Thu, 22 Sep 2022 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663834456;
	bh=MOlPCXwskFQ/i1ybWs2kBQNxkSgAaolnyrvqwJkqiPc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=vMfNQZiW3ju9qqzEjJwLl1pXNkLE2+RFj7PtzTqMI6dCP1PHYm5ZO/VvhS1+sHRgD
	 4ZLnVDEVHIkL517pqzH41s34teA4zfr4dQmind97msIUx8K97MsY0tXpmpipxvaNfs
	 +b7zhFM3w5rL6kya+X7PdsafjmE30YjcffgCjWjNrzG27g+lvv1A01YCo2Xe3VMH8V
	 V7sdLOmJIMYfbie1Qp03U9PWdeU8xX8X6UYGYkCHCOTHfdNWnAsQLOnC6Qyw7QhFXd
	 HtUNW1izNBBajwq67swfgb3kKHfIPQ4EoxDUDNa6x9BijcFxuWHY0PPFcGi5DDpysl
	 6IRy18SC26Pbw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: reduce the timeout value back for hw scan
 from
 10 seconds to 1 second
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220919024121.24820-1-quic_wgong@quicinc.com>
References: <20220919024121.24820-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166383445202.9473.8707216192194973891.kvalo@kernel.org>
Date: Thu, 22 Sep 2022 08:14:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_011419_139763_8BCCDAAC 
X-CRM114-Status: GOOD (  11.55  )
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

> For 11d scan, commit 9dcf6808b253 ("ath11k: add 11d scan offload support")
> increased the timeout from one second to max 10 seconds when 11d scan
> offload enabled and 6 GHz enabled, it is reasonable for the commit, it
> is because the first 11d scan request is sent to firmware before the
> first hw scan request after wlan load, then the hw scan started event
> will reported from firmware after the 11d scan finished, it needs about
> 6 seconds when 6 GHz enabled, so increased it from one second to 10
> seconds in the commit to avoid timed out for hw scan started. Then
> another commit 1f682dc9fb37 ("ath11k: reduce the wait time of 11d scan
> and hw scan while add interface") change the sequence of the first 11d
> scan and hw scan, then ath11k will receive the hw scan started event
> from firmware immediately for the first hw scan, thus ath11k does not
> need set the timeout value to max 10 seconds again, and this is to set
> the timeout value back from 10 seconds to 1 second.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

With this patch I started seeing new errors:

[ 1194.815104] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
[ 1196.864157] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
[ 1198.911926] ath11k_pci 0000:06:00.0: failed to start hw scan: -110

This seems to happen after my suspend tests, but didn't have time to
investigate further.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220919024121.24820-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
