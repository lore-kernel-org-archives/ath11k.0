Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59B3ECAAD8
	for <ath11k@archiver.kernel.org>; Wed, 31 Aug 2022 05:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNIjjOPiOR+esT+1LzaQ8GQcZZlb+Tk3Ikv62WA8rxE=; b=PjRJLAE2RKDHPa
	irYqDLYZz/NIe6tMOf05ihr2lZGOot30p41zCoOAcK9djwNZAxEBywZuIL68fo7M9ALQ2VsmCOy/t
	sHfoXo77CeMP8WXkO1H4SZHf4H+KxFCNV6O8/JvMYO0dGu/BRlcsh003C9lMYcWxi/THWXsBMHhUN
	S9SVZowrUD+gpLkFXyJzgjnNsHDVx+WlZMu9sDs8ZOy8y+JgxO8zyMUM4G/ePxPxfCSRd6i9JimwN
	1SX5fDsSM0K1hkERRrIEEECC42bSpY7q+/HD9TteBsBEycY6t2rFp0oNUYDXPvpHTXfB4cYA/1cRO
	r4cUpfVvowgLcxikARTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGjv-0048a5-FD; Wed, 31 Aug 2022 05:58:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGjs-0048Yt-AX
	for ath11k@lists.infradead.org; Wed, 31 Aug 2022 05:58:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AFB89B81EE4;
	Wed, 31 Aug 2022 05:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD4CC433C1;
	Wed, 31 Aug 2022 05:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661925489;
	bh=duwCTQWFTJPkUcNFvAB5Z2Rj/Xrbs84gsgwZ6kI7J3E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Lp4yb0sUDFxEUI/jZYjqTqWm7M4sCet2I1aJ/wlF+NgvaYCBAnF6ggewTSlf0iNPF
	 MtuE3s3ZYvkyWz0SN3KRX0qdocNx6+oKKZ21V31WBbQKpoXrMmWfoQKzuZT8g4mver
	 VHahHq3xtAZLECxttwfXp4BIkX57IxE40ZE+1D4YTnIsR72WTK/VkcMDT6Pco+i8dI
	 SIemJEFJ4OuiCj/FH95NUr62ZXX7N4/tumomgYyUnRn/e7t6yCn+D5/WXPu55/rHPH
	 4vGStlE4Wqpx7CkSbhAA0kkZU2V/bn3EnD21z1OmIq/0CaDAiLDrGXrvWvl2sqFbXs
	 gAnxy6xu1fKaA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Enable remain-on-channel support on WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220720134331.14832-1-quic_mpubbise@quicinc.com>
References: <20220720134331.14832-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166192548485.26203.10728415761503127962.kvalo@kernel.org>
Date: Wed, 31 Aug 2022 05:58:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_225812_538367_B456C24A 
X-CRM114-Status: UNSURE (   7.33  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Enable remain on channel support on WCN6750 as it is needed for
> GAS, Passpoint.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Failed to apply. And please use --base when submitting ath11k patches.

error: patch failed: drivers/net/wireless/ath/ath11k/core.c:559
error: drivers/net/wireless/ath/ath11k/core.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220720134331.14832-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
