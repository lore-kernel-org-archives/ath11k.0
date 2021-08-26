Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56521C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 18:20:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FFFB60FD9
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 18:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FFFB60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=He70vaWse1r3qIM3C0e1V9y9ExtV8mDXOfckgNIswGs=; b=Vx9lTOx31DhpCY
	ox3GJijsftI6jlp7xd4TKyicGdZvy0uRE9AZRBRBV+t5IDnPidyv/cxQyVGV3QgCccaem6DjRWjko
	MGze+woFjMgLRexDQzO4in1s7fm2MGJroyXKwM3piGJq2rUL4loj5gN4IUrqVmLUPUQoR/WjHwDLQ
	j6rLvhD4LCrwpLivNO8P0cPHX5nObtNwn/bFuPcBu9nBrCl/nCiBhAHDCCGbZzF3uPYuJigdFlARg
	YT7Lyn50wtaQU404dcZsWtmXhLuiCI6m4CaCePzEs2XnWRPxNcmHmQ+cGvbAuq+aS7UH5BYZK/nyc
	afMZoVD0jXU/N9tQMQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJJyz-00AjIt-09; Thu, 26 Aug 2021 18:20:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJJyw-00AjI2-At
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 18:20:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id EEF3C61004;
 Thu, 26 Aug 2021 18:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630002006;
 bh=FgtgiMWlY5oPUg4qmUwE/QGtQnMEC91eALnafDcwsCo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IQMz39/qP5GDU74VlGPaBMibSv1PCCnrAc3OGpC3tHYRICWbIvm3T4iHD9fuGCO/E
 NHv2U8i82tE4y09Q1lVWpVa2g8GUZo3h55kAY4AcgVzC5GKT/4PsXwU8HJHNwEAWIo
 OJArmxHbDK6XnQXKEaKFQFcBqygC2BVA1t3Kk9/6DW53Vp4nvN3i2OfSDBI+xkTya0
 gvlN18+Rqlv7x+69igW8zqg6p4ojnokbpAKExPavkN7jtIYCuSJYoZmLeLuIH8gKOL
 BadXwU/pDKfk5U/19Fj1/Z6AseBl5TuSnRXIW5/xQEEUQt+udilqHH0MGEbrW8C0Qt
 LEnWtuyWQjB8A==
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "net: really fix the build..."
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163000200590.31811.1873637542988637686.git-patchwork-notify@kernel.org>
Date: Thu, 26 Aug 2021 18:20:05 +0000
References: <20210826172816.24478-1-kvalo@codeaurora.org>
In-Reply-To: <20210826172816.24478-1-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 wt@penguintechs.org, manivannan.sadhasivam@linaro.org,
 hemantk@codeaurora.org, loic.poulain@linaro.org, nschichan@freebox.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_112006_436578_8714E198 
X-CRM114-Status: UNSURE (   6.91  )
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

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Thu, 26 Aug 2021 20:28:16 +0300 you wrote:
> This reverts commit ce78ffa3ef1681065ba451cfd545da6126f5ca88.
> 
> Wren and Nicolas reported that ath11k was failing to initialise QCA6390
> Wi-Fi 6 device with error:
> 
> qcom_mhi_qrtr: probe of mhi0_IPCR failed with error -22
> 
> [...]

Here is the summary with links:
  - Revert "net: really fix the build..."
    https://git.kernel.org/netdev/net/c/9ebc2758d0bb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
