Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFC3C5475B
	for <ath11k@archiver.kernel.org>; Wed,  6 Mar 2024 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YYuWoCN0IcagVV+yInHVUfCTIAibJUfY1G809E120o=; b=otonQIdzCuH2ZvnOMw3uej97pc
	4AGAkM/pCvNT31QZxU4YLFNBau/HKNR0cvVxJ8HxAHbMXxNvgJnPz74S3l8fDqFI46vYCFzb2Gy68
	XyIM4YwnQsnRW5tzpTnV1MlrPKdFPm49Zqn/IR/wCP3/Ak80erv/yRmXN8zMXxRnPWq3/RSZbcaL9
	UoEYFJ2yV7GZl6X0xOtwP/2jrvOFusGP19b63nU4DrXLA9X1Jo/glZo0o1OaX9YTaqhTyRU8EFhLp
	bjE94KF9HfJSZMefGwGNGvcRU0kucF7fFQBkVevl2jf6sDWVgznXhmaG4SVlz5uYKsisgK/ErkrW9
	wd9hphUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnLp-0000000H6gr-39os;
	Wed, 06 Mar 2024 09:14:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnLm-0000000H6el-1By2
	for ath11k@lists.infradead.org;
	Wed, 06 Mar 2024 09:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67EE9CE20A4;
	Wed,  6 Mar 2024 09:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF40BC433C7;
	Wed,  6 Mar 2024 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709716446;
	bh=gYzMZ/+cPGxLTP+zBtocfjmFMnBIyF7p6unjEf2f0y8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FHJZmM/hFT9X8RegrSI675wAQbs7xeT42clmaFOuipTPm3V1AmBXcOMCixkUdLcNE
	 yCF4YPDIV6PVYIn3yTr5jS/n5TJ6mw5E04Rq9YkIaq1u6mfaI4k1ZnM/km7uu3Ml8T
	 J8qq3AqIIMsCAWtoIFcPrT84zRaWRGYn039/mIvN9/Ktm1VwngaIyCJJwFVtxktrIF
	 SP88lpHnkApEJGODAy2tFSzmZsEqGDPPL6TUXfuQsCGbGdTckZbcns1y1GPSARoBSq
	 7tD/5hklgUWtdKFFcLfER366i9SFJxLY/e/ucY7kRHo/iWT8/i3FyRtO2opmAwYbnT
	 cYaLoCVvsO0WA==
From: Kalle Valo <kvalo@kernel.org>
To: Kevin Lo <kevlo@kevlo.org>
Cc: ath11k@lists.infradead.org,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath11k: adjust a comment to reflect reality
References: <ZeWEqGVibkMg2APi@ns.kevlo.org>
Date: Wed, 06 Mar 2024 11:14:03 +0200
In-Reply-To: <ZeWEqGVibkMg2APi@ns.kevlo.org> (Kevin Lo's message of "Mon, 4
	Mar 2024 16:22:00 +0800")
Message-ID: <87le6vhgdg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_011410_520987_14D291FE 
X-CRM114-Status: UNSURE (   7.10  )
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

Kevin Lo <kevlo@kevlo.org> writes:

> On QCA6390/QCN9074/WCN6855, MHISTATUS may still have SYSERR bit set
> after SOC_GLOBAL_RESET.
>
> changes for v2:
> - update comment about resetting MHICTRL to clear SYSERR
>
> Signed-off-by: Kevin Lo <kevlo@kevlo.org>

This didn't apply and I manually edited the patch. I also removed the
changelog from the commit message, please check my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=709cd1c88a11bc1969cf573575b0a2027e720146

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

