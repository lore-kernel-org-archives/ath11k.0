Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4B1CD5BD5
	for <ath11k@archiver.kernel.org>; Thu,  5 Sep 2024 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5Qc1C8m+IYiU7lwtnv23ICPJZWvyVdX8VwJGPVvdAE=; b=HcP8mUMNem4Gg+ov0ssCFb8pQJ
	I7aSqC1s57rLO2ueNbGjhlcl5Qt9HPCnf/K/gFaLU572pV77P6fN7+wkRGHR+hzwMs+8Mq9hKrgxu
	3eN53fxYdCEn52yTNoiPFgHK5LhM7uOt+SGBbuQewEc5gc7y/L76QjjhEKcPOsZEm1Sp8VhZD2Tcl
	IwyHOOYpIg1aAstefVCCdoRBMn3W5DZSqqWeRuWP1G/djLgmCZy1xt7by6uCw43uBl57FElilLoSM
	QUSPVvpVItvnS9zeix0cw6pLr6MqjCWSAUJ9pehTf2pZv7fEsQuN8DtoLC7mPLasBR/FE41JX8URe
	fRo9x34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFDc-000000095TH-3pM8;
	Thu, 05 Sep 2024 16:20:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFDH-000000095OQ-26eP
	for ath11k@lists.infradead.org;
	Thu, 05 Sep 2024 16:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 063B6A44DC7
	for <ath11k@lists.infradead.org>; Thu,  5 Sep 2024 16:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F62C4CEC3;
	Thu,  5 Sep 2024 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725553201;
	bh=nwAsYYrguqDxU9no8Long5e3xKJoCmijbR2bx/gDFhw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=A4+fjJZFwxZXIo+Fp5KBmDUo2y8g0G56NQINFwik/ZW1ZyjTGwrdRn9STiEXVyVY2
	 VjTUTVFupBsrGajsyjKRxBgUf8IumTRm6MHPUol60y26FYd87vP1C8RhO+OBRqiXBj
	 jZ+XzQsLEqY4Y3jtZtW5WjGvWwM9F6WkNlcEBxikDq/RBZD7Njx8itpS9b+z8cUNf5
	 XlEP4WNQxRONaj55fjBf7dAu5F125t6WdSaWAfUJmf+uYQXjYnUBhSbixMqLCiUWwR
	 rZRa3YA2DyD4EUlSdGSHDRUCHHDahfrINjGED/WAEvXs5nfnWwGb8/yNlapHEFdmFt
	 qQt0bvT+3424w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH][next] wifi: ath11k: Avoid -Wflex-array-member-not-at-end
 warnings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <ZrZB3Rjswe0ZXtug@cute>
References: <ZrZB3Rjswe0ZXtug@cute>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172555319846.1740680.15884701557144481853.kvalo@kernel.org>
Date: Thu,  5 Sep 2024 16:20:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_092003_644597_25E872CA 
X-CRM114-Status: UNSURE (   7.35  )
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

"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Move the conflicting declaration to the end of the structure. Notice
> that `struct ieee80211_chanctx_conf` is a flexible structure --a
> structure that contains a flexible-array member.
> 
> Also, remove a couple of unused structures.
> 
> Fix the following warnings:
> drivers/net/wireless/ath/ath11k/core.h:409:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/net/wireless/ath/ath11k/dp.h:1309:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> drivers/net/wireless/ath/ath11k/dp.h:1368:24: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

820aa897837f wifi: ath11k: Avoid -Wflex-array-member-not-at-end warnings

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/ZrZB3Rjswe0ZXtug@cute/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


