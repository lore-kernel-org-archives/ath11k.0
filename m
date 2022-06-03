Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B248DC43334
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 06:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hitAGP5MQVQZP0T7HjO4GZsUMGZMBjJYUTHDdXmK9b4=; b=fZbVlOrmXQomf5
	4+nZJo9jjpm1eOEnk+8E4vidKBgPOvtl39iRWJwNJohPB+2kvlwdBoafYfVD0vzI5E0eBdytodyJl
	jarHHjFjXmBwx3wW4JJo0fO37RWarIG9edsxmKNjm7tE9PcreQfzvnRJNJOGwXLrzO4jK1X4Pz2MN
	fTGcXJhCf0wMoALG84zps1y5xYW5LwWdN16J3WdT6YTni8wDG17Ga8KTSkszpB48QVQNJTSGIe/Zx
	8VABx4SgI6Y+kkgUg18ia7yDxXC4cPNQ0/UO2IqGKVkLU3nKxhJfBv8ycmVFD7nTiP9q8I6h/un5L
	8/jg/1rlvHGtmM8Pg27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx18r-0066xh-4b; Fri, 03 Jun 2022 06:50:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx18o-0066x0-Rk
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 06:50:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07CA0B821D8;
	Fri,  3 Jun 2022 06:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9102C385A9;
	Fri,  3 Jun 2022 06:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654239035;
	bh=2MJVEub2e7vLG6dbiPUI7bQt18Uy8hMvLml+ugbAsEc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=I/gnqd3hW/y6YonBIR/gU4FtoEHncVLtKbbva3MvEMjjQw9tbQ6AX0IJWxAYJnncq
	 quWwhPE4HvHak10k3Isq3DMXWOEw1kC+bd/TAGzcQIOegH2PQ2lnnGuVstUlRyLkXX
	 xXpSXBfFSKm0wGYRuaH2P96yByDwSMUTCIEFijyCTDiP/G49/XknpZheTd6qLg5Ru4
	 8a24jfqUx/LiRqJ2fEiqNhllhDM+NW3FF59GHKXfcJ6fGXRkh+dH32kfarzYJrOpDm
	 BmZqfJetZfj21AcVxFYW4eGa2tBy8V4R8Dc4CIuL+1Uf3/vucmYuCTMBS7xyzHFX1i
	 FqvKs4BMBQR8Q==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: move firmware stats out of debugfs
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220602051425.9265-2-quic_adisi@quicinc.com>
References: <20220602051425.9265-2-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165423896462.24941.15580147276579618500.kvalo@kernel.org>
Date: Fri,  3 Jun 2022 06:50:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_235039_081587_20F0F560 
X-CRM114-Status: UNSURE (   9.45  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Currently, firmware stats, comprising pdev, vdev and beacon stats are
> part of debugfs. In firmware pdev stats, firmware reports the final
> Tx power used to transmit each packet. If driver wants to know the
> final Tx power being used at firmware level, it can leverage from
> firmware pdev stats.
> 
> Move firmware stats out of debugfs context in order to leverage
> the final Tx power reported in it even when debugfs is disabled.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This added new warnings:

drivers/net/wireless/ath/ath11k/debugfs.c:94: Please don't use multiple blank lines
drivers/net/wireless/ath/ath11k/debugfs.c:976: Blank lines aren't necessary before a close brace '}'

I fixed them in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220602051425.9265-2-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
