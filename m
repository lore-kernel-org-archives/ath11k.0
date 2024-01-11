Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A4FC47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 20:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M/+nO8sJ+V5s6gV1QS2HNCfEa4Pe0Ufyowvz6d/9x+c=; b=AXy777OKaZphEhPeanqWt1kpGd
	pxJ8NxvNQO+dqBupHbS7M9jR17S1uaVxvbZCZCyosXLAUFhQFyU5MFw/87t5bBEAJZmHrvod+gwed
	eI+YM5aY4WPMwXejdt0/FYHXQO6q9ZA4I9JoqwBus08mTYXuSMdS855NIdTbVDcTtMTVXDBgw5fOu
	O1ssI/O7237GOIToWFQhCXWzTjtAeDqDZGsnSadNssA3J1naWaP2WukfVAw3dg6i6R7HjKGDhf7qZ
	t6/zDAIsayQt+fYyW44aI91hC5MUmUKfYElyrxnqFFNFQtvKYW86eVp5NnmXHu5Ev5OrtowzeR1yA
	h90QW6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1y6-001CJe-0h;
	Thu, 11 Jan 2024 20:48:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1y3-001CJ4-2p
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 20:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 46DB3B82147
	for <ath11k@lists.infradead.org>; Thu, 11 Jan 2024 20:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8635C433F1;
	Thu, 11 Jan 2024 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705006077;
	bh=M/+nO8sJ+V5s6gV1QS2HNCfEa4Pe0Ufyowvz6d/9x+c=;
	h=From:To:Cc:Subject:Date:From;
	b=iNCmk8OTvawS5zCELb+HRcB+l9P56yWGAwdrDVlV2G7Qfu9WvaCNjkb6N8QieOoAI
	 zWxC5OvZdfE8AAefd/Z5PTzItDUF1dY0fz48p/bIgXHRLlnA2/tups1VLImugKRKmU
	 HlHLiLYK+3Mkfy2rnLuVZyResfbwOb5mh9pqBakwSIHo9mF1iiKKlHJYeqSw8TKlp5
	 AcruYZSKHyOD1yFSR/rluufwKV2HO9HwVpu0toL9yaFwUC76GeidLXAc/FLjwus0d9
	 RlSvPYHTkpxNuKiV7xMsugFvrTiPIi2M1t2gWK7gTb73tba3dIWRwhIfxnpb7m+Lb3
	 hdubl1AKXJBEA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
    linux-kernel@vger.kernel.org
Subject: [regression] ath11k broken in v6.7
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 11 Jan 2024 22:47:54 +0200
Message-ID: <874jfjiolh.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_124800_064435_D257E7E1 
X-CRM114-Status: UNSURE (   3.96  )
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

Hi,

Just trying to make everyone aware because I suspect this will affect
quite a few people: ath11k is crashing during suspend on v6.7 due to a
mac80211 patch, more info:

https://bugzilla.kernel.org/show_bug.cgi?id=218364

Proposed fix:

https://patchwork.kernel.org/project/linux-wireless/patch/20240111170629.1257217-1-benjamin@sipsolutions.net/

Kalle

