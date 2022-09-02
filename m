Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A18ECAAD5
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYG/GphedFqqA6FpHBt9BCrS7mGaF9pmz8HDWmbLXms=; b=jCofWXB9vJcynr
	acbHv1tedoDa4GeiuygftDqZ1mwNI4BRLI1QaWKvegi6JnDfb3jvGW4njBH7r3SXBhLlFK5BH/5L3
	pFuRnqi0YoWAddMhFMkBvKl3ypbJCe2pM0dwyMHDkgWOupe5pdbk2LCk1pPdxto2NckSdsIPYxgNE
	P7Q8EeJKyKmifjEio+vdBKu3gMlCigFXbLiCjUXHiuPRT099vyC6x6Ylwrc2I2+5yZNLNfmoQKln3
	oZBsij8jW+gzD6sznGMrK8xWC+VpdyUlpoWflv23XbCydzmDjv3rRL8tigso8LfdIC8IwI80Kozp+
	by883NjO4fFY010GD76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6Eh-004ryP-Q2; Fri, 02 Sep 2022 12:57:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU66y-004kjS-LF
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 12:49:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 124A0618D7;
	Fri,  2 Sep 2022 12:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5B1C433D7;
	Fri,  2 Sep 2022 12:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662122967;
	bh=AZvZJ0jjzWJfltJK4ejkskk2BjBVpGVq9U3dhyhrP5o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TZRfdlq79lFLOc38iSKpu6WCPb/sdeTDTuz8vjp6wkTYLvO3dVYDnJqpXbfP31Wqy
	 cUXe2CqYB2sf7XpnIjK0TDhBF21CYsuX8NBaSZiioAO9F1mOtNSQ007KKOJ2x9Sypx
	 ArblIQosACIxEA5ZiK3myJutrer707e5V1hwNoMUt4ISn6vdfr155ZSab0C+n/+QwY
	 TijMnFh3dMHwnbALiWEvARCgioc7d2BaSvus8crpevVtGlrDA5dT7dXwF9kaGklbxo
	 czPqN3o4KKzxazRCe1fJjA9Xy6uFMvaFhcgEKhBFe1hZXhIx4icVIapNyI9xWYs/rq
	 HSCK3y2UTaqKg==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] ath11k: Add multi TX ring support for WCN6750
References: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
	<20220720135113.15755-3-quic_mpubbise@quicinc.com>
Date: Fri, 02 Sep 2022 15:49:24 +0300
In-Reply-To: <20220720135113.15755-3-quic_mpubbise@quicinc.com> (Manikanta
	Pubbisetty's message of "Wed, 20 Jul 2022 19:21:12 +0530")
Message-ID: <878rn2aqln.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_054928_820016_22201DC2 
X-CRM114-Status: GOOD (  14.95  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> Currently in the case of WCN6750, only one TCL ring is used for TX,
> this is limiting the TX throughput in 160 MHz case, enabling multiple
> TCL rings on WCN6750 has shown an improvement of nearly 300 Mbps in
> the case of TCP TX, therefore add the support of multi TX ring for
> WCN6750.
>
> Currently TCL ring is selected based on CPU ID, this logic cannot be
> applied for WCN6750 as there is chance of out of order TX of packets
> and to avoid this, choose TCL ring based on flow hash so that packets
> of the same flow will end up on same TCL ring. For the same reason,
> TCL ring retry logic is also not applicable for WCN6750.
>
> Also the mapping of TCL, WBM & RBM IDs for WCN6750 is different from
> existing devices. Create a new TCM/WBM/RBM mapping for WCN6750.
>
> Change does not impact existing ath11k devices.

It would also nice to document _why_ it doesn't impact existing (or do
you mean "other"?) devices.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
