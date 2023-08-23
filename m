Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EBFEE4993
	for <ath11k@archiver.kernel.org>; Wed, 23 Aug 2023 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYJaEVu3iDpAM7yt1JQLtxqsGKig0wx1UVQ4BkxHW48=; b=xQAP9Z2ZmeL4rt
	yVbCRVqP+ktgLOx4ruOTt99Iswoi6Gep5L5NtWLrS/zp4yojgP2cp9pf7WB6V7ENBDY1e6YyAGp2W
	qPprdAh7W7/+uIYwZ9wlnY5KsiqX3U0Ta2P9O8+IIOZJA/2xznMlzNknfsRUgYA+89IP08VY26wy/
	YOSV7z7lTDPSKfcoUlwmUVMnLszOpBdgCnamYXS1pd9Q0m1QJ2gvrySZjBezbeXfBDIa4TyNkC1MZ
	Fudpw16dhDyT083ySQR1/BWLte11n0yg3wbCSVbEqAQBM+BC5y1Wc5nXn8sRLFFOK0zto7CZgogAg
	gabhqB9DxXnRI/o/m/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoS7-000nrr-0j;
	Wed, 23 Aug 2023 14:03:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoS3-000nqu-2x
	for ath11k@lists.infradead.org;
	Wed, 23 Aug 2023 14:03:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EAF0650E5;
	Wed, 23 Aug 2023 14:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05592C433C9;
	Wed, 23 Aug 2023 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692799393;
	bh=h0orCZ3m4TEkoobEWxWZajTOV5CdUJY9mXV/Km4wZnI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GHW5AXiQ4Eb2p+GmPTvDfmvgQDiJx7bblESo6DFEBHpkw8KU3HEJP91QP6zk95GSu
	 MupalcPdnnJF2bRSgvMX1LvFgYEKt9WI0KtfORZXQg+i7CLjyqA2A7H0Wbmy755kVC
	 aKPrLIclTc6c9ySfUdDQfdHou1d5ONs6TDNL8+ToMSK5nHhD3AqQmh9JAc9YMF3p1u
	 wFdRAey8y75n4FeTC5iwhhxwhKLZq9RHlRIMpLj53pdM15CSfmDt9xkLkTC+yQveRL
	 5o86ch0l4K+H8Riip26erFt6I7fmhHaCt3GCyeOfsAtP0kjRcHcnSnhRnXpI7JmP6z
	 KVUPDGnFZOD3A==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath11k: Don't drop tx_status when peer cannot be
 found
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230802-ath11k-ack_status_leak-v2-1-c0af729d6229@narfation.org>
References: <20230802-ath11k-ack_status_leak-v2-1-c0af729d6229@narfation.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
 Kalle Valo <quic_kvalo@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169279938984.1241462.11542216603364310073.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:03:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_070316_018874_E451E2DA 
X-CRM114-Status: GOOD (  13.34  )
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

Sven Eckelmann <sven@narfation.org> wrote:

> When a station idles for a long time, hostapd will try to send a QoS Null
> frame to the station as "poll". NL80211_CMD_PROBE_CLIENT is used for this
> purpose. And the skb will be added to ack_status_frame - waiting for a
> completion via ieee80211_report_ack_skb().
> 
> But when the peer was already removed before the tx_complete arrives, the
> peer will be missing. And when using dev_kfree_skb_any (instead of going
> through mac80211), the entry will stay inside ack_status_frames. This IDR
> will therefore run full after 8K request were generated for such clients.
> At this point, the access point will then just stall and not allow any new
> clients because idr_alloc() for ack_status_frame will fail.
> 
> ieee80211_free_txskb() on the other hand will (when required) call
> ieee80211_report_ack_skb() and make sure that (when required) remove the
> entry from the ack_status_frame.
> 
> Tested-on: IPQ6018 hw1.0 WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6257c702264c ("wifi: ath11k: fix tx status reporting in encap offload mode")
> Fixes: 94739d45c388 ("ath11k: switch to using ieee80211_tx_status_ext()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

400ece6c7f34 wifi: ath11k: Don't drop tx_status when peer cannot be found
29d15589f084 wifi: ath11k: Cleanup mac80211 references on failure during tx_complete

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230802-ath11k-ack_status_leak-v2-1-c0af729d6229@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
