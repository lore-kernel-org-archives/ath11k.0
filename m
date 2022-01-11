Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3709FC433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Jan 2022 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eswGFlB4JCAngZ/Z3q7Z9m84PLgDXhDGaOFE0jBTzfo=; b=QCkeqW//w33C71
	lCgS9nnJe1t70Rhiyoj2sDw8cKo75w3hRGdbbooOosfIec0fEpZseL1eCGo7mFYjZQv6hSRjLBlky
	Q+rpJZYzt8ackMJpCp8hc0GtHb2PsLeyj0/5IxeIFIyBH4F48P63bq9cAATHvoTkMaurdZsgvxzFm
	v2IrHTwM0JUNih6w3cqoRHsj00zwzWTDc0rl5tnbdd+4aDmlb2/+aqfvUjK3WnZOec2Oi6SHMkATQ
	okAO5VxP3EpBcjy+ha/1KY+CFGZ9BFtq05vUzXi2EJF68aOGYVaIiOQWOy2gpRKIReOmQocAiKagZ
	pxQSjBvanuU3QkmYDNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7IIU-00GZxz-Bo; Tue, 11 Jan 2022 14:38:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7IIS-00GZxA-0a
 for ath11k@lists.infradead.org; Tue, 11 Jan 2022 14:38:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D01761684;
 Tue, 11 Jan 2022 14:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4018C36AE3;
 Tue, 11 Jan 2022 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641911920;
 bh=BzfEzZiGgzx0tSuP84HARdUdUuAEdyL2H9x7G3VY19s=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=OoiHGODEO0VELV7/2HpZM/cc+jlfUxM7UHhErYDlQPKJiyV9ZozvDZk1R14J2qJHe
 YJk8gZ395CeLu7/1eMxCFcqpsqfyFpti4KaXZFvHJoQ957ksHcg5hbtz4uYDbbutN3
 N5SBTUXE4C4YD3Gt0/kRgYt52fTdWgYmfUKJ2kPl9KneRkDS0cTv6yiEYkGjU8Eqwx
 jTMzPioeQ7vA0lYx4KTUbJko0iRVmMqmONZ2k6ywhnd4qpWuEeI87xp+mtD8zVR9+9
 YEYJtKV0eVVG5UBZ5nVGpF5eSiCgVQMghP6FBXZOgTI9agBMcgv91TdGTfQBdo8YM4
 R+yeOG96cvXTg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix workqueue not getting destroyed after rmmod
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1640231787-17408-1-git-send-email-quic_adisi@quicinc.com>
References: <1640231787-17408-1-git-send-email-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164191191704.24158.8323554268454002040.kvalo@kernel.org>
Date: Tue, 11 Jan 2022 14:38:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_063848_129210_33BFFCA0 
X-CRM114-Status: UNSURE (   9.90  )
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

> Currently, ath11k_core_alloc() creates a single thread workqueue.
> This workqueue is not detroyed during clean up when ath11k modules
> are unloaded from the kernel and is left as it is.
> If workqueue is not destroyed, it could lead to kernel
> memory scarcity in a longer run. This could affect self and
> other drivers workability as well.
> 
> Add destroy workqueue in ath11k_core_free().
> 
> Tested on: IPQ8074 WLAN.HK.2.4.0.1-01746-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9f4ecacf2fa4 ath11k: fix workqueue not getting destroyed after rmmod

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1640231787-17408-1-git-send-email-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
