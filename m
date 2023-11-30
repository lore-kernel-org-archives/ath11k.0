Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3FDC4167B
	for <ath11k@archiver.kernel.org>; Thu, 30 Nov 2023 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a86nEtI427ZkCbWDYc5Gc1YXkU4renPXQebxHKDo9fA=; b=vMHqFUWon87hwHYa2H3YgQ2V5E
	VDIBQB5O/siidLaVVYO9pAa0o5b1gsD58cI1Q7JQQml/DvASQ9ORcETgal+gnFhtQ6x8UHBO6Sbj9
	/2O0gvadMu031yGQDcARkYI/BG9kBz7aszXQG4Xz7Vt6UZXbDBXeoO3a9DC9X9NrSXe7ZLpoWh6sv
	5FuEtQcO8uihCozbmgVsJKJcTUdXFsQ6mv7dLJNcScuIAZ6IsxXeSvh4s8zgK7daeSyKODmqE0Lag
	Osa9oSPuQ0AUNac6a+0R0Jm0WpNXavBG0LUVGCwXji7NjS3M6St30yWx5zjvPyHWlsO2x+nbnEGdB
	FJsBfeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kUP-00BSlc-0m;
	Thu, 30 Nov 2023 17:06:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kUM-00BSl1-0k
	for ath11k@lists.infradead.org;
	Thu, 30 Nov 2023 17:06:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D4237B827AF;
	Thu, 30 Nov 2023 17:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190DFC433C7;
	Thu, 30 Nov 2023 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701363967;
	bh=C9xNgVVhXRSyE0l4y+M6+IWYv5jkCVWMh6VIt0VA/fs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=g4XTjG8y9knI3NBpjmTbY0jzFw1mcc8iGTdhzD7XCC86xTR66ytM4U3sCJEbptvGC
	 WaURhaPOoe0YRt72iQB5S8OT3kTeOHpJXFqqkUoRlXzw107QCz1bBK/pnOq6Wu5WGd
	 3mRQBGy355RRvxnoF7KEwJXXbOQIbdkVQ7kr4qJ8Phe34meaoksvynwBQb9DYmbops
	 L9FzU5EVrZOTLUm5oKo6v2XcyzO8V3qlzqSIT3yAO5/8Z2yMAhkKT3YB8T6W7W+wMf
	 tovsKxEmGSU0L59zRi5GhbYqwnwGbn8MFHx+xplKXYD5q1hwU8wwCbBXU1LZHU0/2P
	 FfJUYY21ujKOw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH wifi-next 1/6] wifi: ath11k: Convert to platform remove
 callback returning void
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231117093056.873834-9-u.kleine-koenig@pengutronix.de>
References: <20231117093056.873834-9-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=  <u.kleine-koenig@pengutronix.de>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, kernel@pengutronix.de
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170136396402.1435047.15867746880964995534.kvalo@kernel.org>
Date: Thu, 30 Nov 2023 17:06:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_090610_410270_53114338 
X-CRM114-Status: GOOD (  10.68  )
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

Uwe Kleine-König  <u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

62e31362033e wifi: ath11k: Convert to platform remove callback returning void

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231117093056.873834-9-u.kleine-koenig@pengutronix.de/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


