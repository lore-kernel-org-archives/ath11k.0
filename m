Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CFEC433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:58:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9781061130
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9781061130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjS9VMO5FpEJwb+lSg9Sv90YkcXuEfwk+QQcGmQ0BYs=; b=cV9SyQ37OnkfoH
	uCI3ofsxJsqpd2+tUeFoimnQAWszGs/alKXmFLhr+NLfXxH/B9ta/6+6WrO12tnqUjJ7Ce2PQgzgW
	KmCPIwpxrVH6ByKtX5N0qRioYXvyi16YTJsMe4fTa7IF1DR0zVrHneopo1MJcD2mnho4dEonTl3V1
	gIyiU5q8AGHznU8jdnZ1h3OAB9KVlJ+wwpsBCoT2lwwlAs6QmXYgHTh3mFg/fNgJG4Vq48ptJ2xiw
	Y1+vdaQ3dfu+uYv3BGWmsUI2+08AFHpzNNhtUK0QD3cS+NocrRUJAN1tE9HHglzGjEYD214VBJMgI
	38FTcSj6qj/4WQl+uHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVAoa-006t8B-In; Tue, 28 Sep 2021 10:58:24 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVAoV-006t7t-KC
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 10:58:24 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632826702; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=m8CTrL7XG7v1AOE4JfUqqcNOP2MpWjihu+TTfoSDjfA=;
 b=ss7EOb/PXIU1W1BjZkgZM5n9KDj//V1J4WnYpEm5+5jRILumzG/sz6c6l6dpHhmngCUVBeN4
 Phmhm6PtpB6bMR45dk/LITxHq7jVuClHJnAZKfmG5nHpC0raNzC8PDazkk991tBqy4QjvwBc
 pVjHOQWRSictiHyh0Cai0qcOiR0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6152f53e1abbf21d3464b9e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 10:58:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B954BC4360D; Tue, 28 Sep 2021 10:58:05 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E6F41C4338F;
 Tue, 28 Sep 2021 10:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E6F41C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 01/12] ath11k: Fix pktlog lite rx events
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210721212029.142388-1-jouni@codeaurora.org>
References: <20210721212029.142388-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928105805.B954BC4360D@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 10:58:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_035822_772987_EB86B740 
X-CRM114-Status: UNSURE (   9.94  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Fix sending rx_buf_sz to ath11k_dp_tx_htt_rx_filter_setup()
> to enable pktlog full or lite mode. Depending on mode update the
> trace buffer with log type full/lite.
> 
> Pktlog lite is a lighter version of pktlog. This can be used to capture
> PPDU stats. These are useful for firmware performance debugging.
> 
> pktlog lite dumps are enabled using,
>   echo "0x0 1" > ath11k/IPQ8074 hw2.0/mac0/pktlog_filter
> 
> Tested On: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01233-QCAHKSWPL_SILICONZ-1 v2
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

9 patches applied to ath-next branch of ath.git, thanks.

ab18e3bc1c13 ath11k: Fix pktlog lite rx events
f394e4eae8e2 ath11k: Update pdev tx and rx firmware stats
69a0fcf8a9f2 ath11k: Avoid reg rules update during firmware recovery
1db2b0d0a391 ath11k: Avoid race during regd updates
8717db7ee802 ath11k: Add vdev start flag to disable hardware encryption
3c79cb4d63c0 ath11k: Assign free_vdev_map value before ieee80211_register_hw
8ee8d38ca472 ath11k: Fix crash during firmware recovery on reo cmd ring access
79feedfea779 ath11k: Avoid "No VIF found" warning message
94a6df31dcf0 ath11k: Add wmi peer create conf event in wmi_tlv_event_id

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210721212029.142388-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
