Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5C1C61DA4
	for <ath11k@archiver.kernel.org>; Wed, 22 Feb 2023 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjGUJ3d1IdmazTB0zc6ZsIMq9WYNXr+B4nmzZ4wiFTQ=; b=b9VJNT10Rihod7
	WgU9NP2cmXayKkCw/dKB531JFlPJklppBUnTN8k7VtqMsZdBG6UTAkA4PA/tjzSZbqnF8rmDT7Qv7
	7jwQc+40WoqEBKIU71GTOt/wz+77dbk1jYb3zQbh9yc4qXqYsFAJeA4xxQSfG3wtH2WghGL518afF
	vM/aWz/WPIBLyIxxzlx7ZEZdrejjnbEOSu3qCF+cfs+zmxRU7n94jVwYZ5Yd/vdiPrpXXwuxpTXpq
	+oQ242hHYvEFOeeOVlTkN6T3MK1+3mbZi2mKUArZNMLtYCN8UKyOpGG/TUQZ5U4K3VxKXrIv24I4r
	kaywXlmE/x34wJz4SO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmNb-00BvuZ-0A; Wed, 22 Feb 2023 10:29:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUln5-00Bd9i-5P
	for ath11k@lists.infradead.org; Wed, 22 Feb 2023 09:52:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2881B81235;
	Wed, 22 Feb 2023 09:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6649CC433D2;
	Wed, 22 Feb 2023 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677059516;
	bh=PyUDgmO8GAvIrVIlTy6DR+3I37FfQ9drabu8uH/vTLU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=f+/ukOx2KzvGnXjS/bxr1wPEjhw6z37QZrpnv0SwajPPUQ1ZHAKYXHtBPSLDScMqw
	 PkxpaO60xDNd6ttMJ7M8TZpa9YSbEVCMGathT54evZ//094i4gNguukSXdBzv1xPDD
	 xcteuIeJWzI6KMgel7MWe/0VD5zesSPl6wUP7mc6aNFskGi7befFGCoYEgTVjC1j1X
	 YJ7oZVG1Bk2LexqTt6AqItVUW0m27B0mDth/9GrVa+k9Eb95zhzaB6UJ5EMo39c/KJ
	 M0XxMzjqqivo+aob78SL6f72gJGW+dtERSPQ0bMS3zVcWI72fHQxI8hqE/D3rWpyI4
	 2Qz59+Q1vZmCQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] wifi: ath11k: Use platform_get_irq() to get the
 interrupt
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To:  <20230201084131.v2.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
References:  <20230201084131.v2.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
To: Douglas Anderson <dianders@chromium.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 junyuu@chromium.org, Youghandhar Chintala <quic_youghand@quicinc.com>,
 Jiri Slaby <jirislaby@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 Marc Zyngier <maz@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167705951022.25767.9800855263902793000.kvalo@kernel.org>
Date: Wed, 22 Feb 2023 09:51:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_015159_382092_F1BE6AB1 
X-CRM114-Status: GOOD (  12.95  )
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

Douglas Anderson <dianders@chromium.org> wrote:

> As of commit a1a2b7125e10 ("of/platform: Drop static setup of IRQ
> resource from DT core"), we need to use platform_get_irq() instead of
> platform_get_resource() to get our IRQs because
> platform_get_resource() simply won't get them anymore.
> 
> This was already fixed in several other Atheros WiFi drivers,
> apparently in response to Zeal Robot reports. An example of another
> fix is commit 9503a1fc123d ("ath9k: Use platform_get_irq() to get the
> interrupt"). ath11k seems to have been missed in this effort, though.
> 
> Without this change, WiFi wasn't coming up on my Qualcomm sc7280-based
> hardware. Specifically, "platform_get_resource(pdev, IORESOURCE_IRQ,
> i)" was failing even for i=0.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")
> Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Jun Yu <junyuu@chromium.org>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

f117276638b7 wifi: ath11k: Use platform_get_irq() to get the interrupt
95c95251d054 wifi: ath5k: Use platform_get_irq() to get the interrupt

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230201084131.v2.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
