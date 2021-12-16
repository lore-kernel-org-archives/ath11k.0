Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EADC433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Dec 2021 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMl+Ij4UWFkd+pY8J/4QvlyQGFN1SeEb/22okM7lxBw=; b=ddnWHPwhvITI9g
	q+ugMXMQ51b8spPNRjIKD+9eJCfuvy2YfsWgQjJV1qIwJLenlMi1jW1/VHFvnM0CbaKrg/VOFlM2a
	z8eEwVTiI1am4SpgB4Jv2VvLVs2kLDqyvK/r3aJgxQFs4v34pQncCFuogzBIOQqr0ejN9OXY1oa5y
	x6IlfOjdBaQGnI/9cviXyQchreojyCvRHaHM2tYiYG6Sinq40/rhRSezlsBXMRQ7HCF3X0WcpxRmT
	yuaLIeVNOwLuionzOtB4fIZkM9VpVVF7NRrtYzDy0PSrm35Peq182SR/RH4PagLz12tDFwkb2Q4As
	6ZpS203baIrqvZ8om85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxtvt-006jK3-6w; Thu, 16 Dec 2021 16:48:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxtji-006edY-Ar
 for ath11k@lists.infradead.org; Thu, 16 Dec 2021 16:36:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB56D61E97;
 Thu, 16 Dec 2021 16:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95176C36AE4;
 Thu, 16 Dec 2021 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639672564;
 bh=7d992ORaxrkAOc/y1VyGbJc7x1y3M1BbCoqPtnd/NaY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=aXRn7d3iV3ODodkbKkja6HB1N2V8EhBBk1eSzSimrymBtYZEr/grKRDcYtJ8w4r1+
 QccwPHXwjZN+xpB8/jCLvCAOBzXImPAG5FhiD4c8QXaP8fWuYjoFGm4pY8or9RpFG5
 cyqctg93f7FRII2m2RSsPc2PNpPJBf7rfPSWdx4/JoM/7sp+vCcLNleJ9hpMmCazrb
 HOl62Gaj1Erpu8zKfBJUU1l2hRgBuM+YqddecwXDNvvqaZhuu9jnxYUKNnZjO6bid7
 lxPQBz7UKXaAJyf6jDuvbdLmTj7RMBKpGj2qsEh6igQcZvMmCAI+c+smE7x8YZ4/ed
 2ryqK80I7OB3Q==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3] ath11k: fix destination monitor ring out of sync
References: <1639584090-13751-1-git-send-email-quic_kathirve@quicinc.com>
Date: Thu, 16 Dec 2021 18:35:59 +0200
In-Reply-To: <1639584090-13751-1-git-send-email-quic_kathirve@quicinc.com>
 (Karthikeyan Kathirvel's message of "Wed, 15 Dec 2021 21:31:30 +0530")
Message-ID: <87o85gbj80.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_083606_459863_52FA6033 
X-CRM114-Status: GOOD (  13.12  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> writes:

> More than 20000 PPDU id jumping causing status ring and destination
> ring processing not sync. The status ring is processed and the
> destination ring is not processed. Since destination is not reaped for
> so long, backpressure occurs at the destination ring.
>
> To address this issue update the PPDU id with the latest PPDU, this
> will allow the destination ring to be reaped and will prevent the
> rings from getting out of sync.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2
>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>

Failed to apply:

Applying: ath11k: fix destination monitor ring out of sync
error: sha1 information is lacking or useless (drivers/net/wireless/ath/ath11k/dp.h).
error: could not build fake ancestor

Please rebase on top ath.git master branch. And remember to use --base,
then it's easier for me to fix conflicts.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
