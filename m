Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C54FC67861
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 11:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Td0lnu6Tvtzbxwl5tyQdfTCGzg7txgxrT0RYL9w25AU=; b=HuU49gIhR9ixDPeVONPQffLgiQ
	i8qaHU3dFhaDwRA589n4ZYNZeMaZaQYatldxhLHRuBUVJjti64+OS6vFj5+P9bMTU70fa9VYuFF0u
	dnvAzX9gL+yiksCLRRG7+PKctyuv625saG2z7oWER4T7LeqDUpWOFtj/9voSzP+QPJRxv7wVVuvQ7
	wizS0Tl1eYpDF4XCf9+x58f80hT6SPM5zuWFEG4pddJYOnRQe1EK7Cefjnkt1NF1t62lTyP1fJhnV
	I9Xa2sGsiFp0BRoBt9inRyiZROx1a0evC/nk22UBYm5YN44h7e6YbPgB4gA97VQhm0OxgaddPhC8G
	GRbi1s1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9tP-00000001lXo-2wrn;
	Tue, 09 Apr 2024 11:44:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9tK-00000001lWu-3skF
	for ath11k@lists.infradead.org;
	Tue, 09 Apr 2024 11:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 478EB61602;
	Tue,  9 Apr 2024 11:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D44DC433F1;
	Tue,  9 Apr 2024 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712663033;
	bh=nbeeO/HdiPZM8HHVLpt1fCwCNBVTR0HOgVLESsZWhOI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=d46EgBGBB+dImlGf5ySrLOyH8Ij3UrZQPzy4rRGGekUc48s6LOWgQaPOdY3zEgMrb
	 DO+ftabH7b6ZH6g39eV2l9yV0LxEDg9HCUZxy3wN+9z9gffSuupiELVlZgLW9Akbya
	 M3RLvjkJZ8ObgnMZwfjMMpd0zsNZUO92xmeIOKNA1e36B/vBLCWYDPtJObdYvr6VaS
	 Q3jTycG3C8+o8NDe3wVxTpZglXPlZNeb9zp2ceyNA9qlJ3Ci43tHFQeuZWi93DQc8q
	 pew28ArfhUw0IXj+aeUC7J4vyQ8YCqrXjhpTQex3N6zSlEl40rMQdQD50sxIuRR8rU
	 tK+FeYLqyrmUw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 2/3] net: qrtr: support suspend/hibernation
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240305021320.3367-3-quic_bqiang@quicinc.com>
References: <20240305021320.3367-3-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <manivannan.sadhasivam@linaro.org>,
 <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <mhi@lists.linux.dev>, <quic_bqiang@quicinc.com>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <netdev@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171266302937.3197288.10067259080549350573.kvalo@kernel.org>
Date: Tue,  9 Apr 2024 11:43:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044355_057182_4085F4A7 
X-CRM114-Status: UNSURE (   9.80  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> MHI devices may not be destroyed during suspend/hibernation, so need
> to unprepare/prepare MHI channels throughout the transition, this is
> done by adding suspend/resume callbacks.
> 
> The suspend callback is called in the late suspend stage, this means
> MHI channels are still alive at suspend stage, and that makes it
> possible for an MHI controller driver to communicate with others over
> those channels at suspend stage. While the resume callback is called
> in the early resume stage, for a similar reason.
> 
> Also note that we won't do unprepare/prepare when MHI device is in
> suspend state because it's pointless if MHI is only meant to go through
> a suspend/resume transition, instead of a complete power cycle.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

e0cd1185900e net: qrtr: support suspend/hibernation
166a490f59ac wifi: ath11k: support hibernation

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240305021320.3367-3-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


