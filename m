Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D57C43334
	for <ath11k@archiver.kernel.org>; Mon,  6 Jun 2022 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzyfiJe1Yx5OyLItrdxphsgfUN7AuZnOs9o3gVSIAdw=; b=sIhEv8whi8Lg+m
	DlAuU51FEZ8DHIWiawmAP3VYDy2bBJan9husnQ9lBiiLYVkK6TyB9Zxuqi16bq0TX3mf13uSVf3Gy
	QX700aueffaWuvD6kTtmQjxpCH2W5UFKehbnGIW3wdDbJwUZMMYmkCFMuu3pDp2G7z90CbsGIgf/k
	6+HN6Jy+BQVZFI48MZj4dWq7nHNsgxvIdm0ncjI3LCns8yCpLMi40OTqpYrNHylgtXauP6KQxW+dK
	E/Mue+iRTVBAAEylD8cwKoxuxqTBUE5mPSxjqoFOI5qbpkgnJtUVykcKC6+7oS4UShlGlZazJAuiF
	oLFYrq41/g+NWfhagOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDRW-001SJI-AB; Mon, 06 Jun 2022 14:10:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDRT-001SIV-E6
	for ath11k@lists.infradead.org; Mon, 06 Jun 2022 14:10:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0609B61373;
	Mon,  6 Jun 2022 14:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DF1C385A9;
	Mon,  6 Jun 2022 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654524649;
	bh=8VhyjTxv1+dQL+DkFd0bU0FBPuJ2fWCYDX8POlXeams=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=l7GPPyhCik3JLk3asyZHqAKEqcHy5v3TC4CqaZTmsQOOKblTrfNkDHJ93LyLcVAJX
	 XPAeIh2QuHYPkK5bNPNLF6NnGz4CnV/F2JVPd6kJeQGKL3khnzZ7y2V00m7sSRiDN8
	 5iECrRS3Gmx7Xpje+xb94CTQqLLYhYuzRaF5DdwsCfOHkfoUkmuY9Ym81MzTs0XOWZ
	 +FruGqansw6stu2sR9spHReUk0EmbklGvcaPmuvGMHCMwdkOCMp0udH6IN1wU3J4rP
	 /Fp6ZfiQDTkBnRlHBu3p3HqIasql6Dm5fTeH06CMxZR3vuvtUuMaKkZGtQMN0P+qOj
	 wOhIJ37zvXVww==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix LDPC config in set_bitrate_mask hook
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220602124142.29909-1-quic_mpubbise@quicinc.com>
References: <20220602124142.29909-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165452464285.15301.12888477923740045977.kvalo@kernel.org>
Date: Mon,  6 Jun 2022 14:10:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_071051_560496_C59F5A51 
X-CRM114-Status: GOOD (  13.01  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Currently ar->ht_cap_info is not set anywhere in the code, this could
> result in LDPC config computed wrongly in the set_bitrate_mask() hook
> and eventually sending wrong config to the target. Fix this by checking
> the LDPC support from the band HT capabilities of the radio instead.
> 
> Furthermore, it looks like firmwares running on the ath11k hardware
> do not set WMI_HT_CAP_LDPC for advertising the TX LDPC capability,
> WMI_HT_CAP_TX_LDPC is set instead and this should be checked for
> getting hardware's TX LDPC support. This is true for QCA6390, WCN6855
> & WCN6750 hardware.
> 
> Also, remove unused variables ht_cap_info & vht_cap_info from
> struct ath11k{}.
> 
> Found this during code review.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4c1fc4f60a53 ath11k: Fix LDPC config in set_bitrate_mask hook

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220602124142.29909-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
