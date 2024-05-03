Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9B3C4345F
	for <ath11k@archiver.kernel.org>; Fri,  3 May 2024 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2nzBAOcAdSYJoQ0RR9KKeTGjGfsFmjvjfMerI1Hmm0=; b=1JwibAzPPneTetPSyGXsnZW8cf
	AE0I3RSnvelMCs0P+O9JamiaX/guIatM9KctmNvbkSHLU4BkTQvXbXNwBgavt1J9ykPP8J4yK+yvk
	KSQL1KCJJLXwsl7RBvURaoqH0S3PuLaH13XxGC4RvkaL0nzgULJnUA9FlaHaEqC4vYdY/3VQ37LvI
	M5+uSebMjpLRBRE7UxTiXaOWv83isKS33T8eeBzDW17Wq8G5y+4UnI7O5XiR374+X7PGxWVokZ2/A
	EeqazSdEij7za3FcsgCWF5BETHxkGu44nCcC0JSd0HiCdj/JkxmPtoa2kEsnC9dDXtXzqgzSzEuWs
	A5wGhmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2slg-0000000GcO0-0mR6;
	Fri, 03 May 2024 13:16:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2slc-0000000GcMo-36ZQ
	for ath11k@lists.infradead.org;
	Fri, 03 May 2024 13:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E5D161D74;
	Fri,  3 May 2024 13:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C9DC4AF1B;
	Fri,  3 May 2024 13:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714742129;
	bh=u7OhV14b+KvvL/Ob6hW0mx28C4XmQQk3bSQXLrG+R1g=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=UMgF+XHkCoWysTyGLbnNRboqoX82pBZjHq8IISsbQmKwb5+lz58zNVpq6t6zv9b8l
	 2yaWIOPp89LuHIkKP9PCcUmyoY59voKR9wOPjUIm87jdE0jkhrmkTkuJk12oMYV5Er
	 ekmjuSPQrZDSCbd/TNlLNKzar9aesWO49u5WOWLBwPSu/IrF66f16F/xA5fzbVEfgU
	 2PyoozYi0OAdoiFeIDTI8jZdYhHyZZFqHSSakr+aZSTbhVmSC//38jPuaeUMhuHFzP
	 58uhFZFU67uwhluWGQnlPHpX3HcBSv288izLYJVZlg10gBh6PpeF8u9ev6/kEDJySG
	 5IcYCl1Jd8wIg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath11k: refactor CE remap & unmap
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240430-ce-unmap-v1-1-e468328f95d9@quicinc.com>
References: <20240430-ce-unmap-v1-1-e468328f95d9@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171474212652.1512332.14638586836562362719.kvalo@kernel.org>
Date: Fri,  3 May 2024 13:15:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_061600_866756_A99AE61A 
X-CRM114-Status: UNSURE (   7.87  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently the logic that handles hw_params->ce_remap is inline code,
> both for doing the remap and the unmap. An upcoming change needs to do
> the unmap in a second place, so refactor the unmap logic into a
> separate function. And although it is only called from one place,
> refactor the remap logic as well to have functional symmetry.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

8b9ea752a9d6 wifi: ath11k: refactor CE remap & unmap
c57d00a4d3d8 wifi: ath11k: unmap the CE in ath11k_ahb_probe() error path

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240430-ce-unmap-v1-1-e468328f95d9@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


