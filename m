Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A007DECAAD3
	for <ath11k@archiver.kernel.org>; Mon, 19 Sep 2022 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZweewHr8GBqV8XREPhnijgM/SXpCYvzVX04C/XpVHg=; b=mSd5nQveJiHzvS
	x4SCrhgQqn3iUNfpaCAdkHHVfCJGjQ8KmTdMS5NxFphAwPmaX9YXvFwngRGrWla3IzVX1AwYvBxo5
	5vf5W1R/OpGfcOx4ohfx0FRhd7nTK8Va7auuCo9Q9I8GwuS1poMBmnD7MkLJVSkQUloIsn5B3UdAd
	SVKNVHRAKMxt42RZ9r7EaV9snLsGZnNXKG213mI9OPOJxvA9NQPTnWSwzmHaKdnmubiSXzQb+vWdc
	B8/3HF5KRqvUuQQFW+kt2Zq0KI5QQOxljJ3guX3oHU0qv7csmKT1Gas1i5sFOvDNs/ieuvIF53U9v
	5ANW9Q/IRfgLdS5zPMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaG7i-00Bj53-HD; Mon, 19 Sep 2022 12:43:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaG7e-00Bj4f-Nl
	for ath11k@lists.infradead.org; Mon, 19 Sep 2022 12:43:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4E481B808CF;
	Mon, 19 Sep 2022 12:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44568C433D7;
	Mon, 19 Sep 2022 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663591416;
	bh=6nFVlHwJDwxB0EofWEOgiD+e6k7WCTuiWYz6W7BrpIk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Jxo1Ja34HiGIMf3ZkkZHbn7muatDQdJ0v7TO+clpinpOHzT+PbeJJpjBCrxikdl4g
	 YrIch4AoCaNck5otx7I9QiV4WRN8NbFWbUDFzGOH/Udh50MWtznwhUi7lS/QYj4GEw
	 dE690ZPvLeRSRknXY8XvHn6Zopki0XWJZZM0E3hKpniLoFncmhcEroazDfLgAJaNuJ
	 g1Uw3fbMXH89PDuF+9KpxNF1oXRxMthErfzvOHA2x6tGJG0SBtusfNW8Akh6bJRNW0
	 JMAxZFmZfsOeboeKYJJaaU+15D4NRBQoc5Mhk9hyafgF9SoF3++22yEgxpy8t6Vdwp
	 HhchvZSxeQrpg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Include STA_KEEPALIVE_ARP_RESPONSE TLV
 header
 by default
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220913044358.2037-1-quic_bqiang@quicinc.com>
References: <20220913044358.2037-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166359141336.17652.14533007479146714072.kvalo@kernel.org>
Date: Mon, 19 Sep 2022 12:43:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_054338_949839_EEB2A367 
X-CRM114-Status: UNSURE (   9.84  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> In current code STA_KEEPALIVE_ARP_RESPONSE TLV header is included only
> when ARP method is used, this causes firmware always to crash when wowlan
> is enabled because firmware needs it to be present no matter ARP method
> is used or not.
> 
> Fix this issue by including STA_KEEPALIVE_ARP_RESPONSE TLV header by
> default.
> 
> Also fix below typo:
>   s/WMI_TAG_STA_KEEPALVE_ARP_RESPONSE/WMI_TAG_STA_KEEPALIVE_ARP_RESPONSE/
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: 0f84a156aa3b ("ath11k: Handle keepalive during WoWLAN suspend and resume")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b7b6f86149a7 wifi: ath11k: Include STA_KEEPALIVE_ARP_RESPONSE TLV header by default

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220913044358.2037-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
