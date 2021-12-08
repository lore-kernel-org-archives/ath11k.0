Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3D0C433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wF75c2qt2DPdHiNPM3FxeeUSw2jebACT3e/kcs5CoQ=; b=yTnm2+oz0heMVb
	seBabBl17Xf7iTvS7BbSZvxhZwW0UhnC0Q6/9wW/EXDNIKn9b8SBKXVhBFBYww58T5ou/iPOTr6o8
	wzjO9GkcbMf9F7oXlTq8KPDkwHDu7WkSKt1Ne4VIoqR7ZfXEpS4sH8HWx4JecdngndnU7fdsA1aAa
	qaYdGHo9r6+0VCHKojYlEAh2SkxYRke/mKw+Vcxnlz1zQ5W0kWze9N/3nwCrx41j3ITn2v0ln/GLh
	cawMzxs1SlRKOKz/Rhq571tPvqbcLnZqL4EFkBqTM3votRLD6aR8VCSdIvAyUHXm1bNXEsfuNabd8
	Gmuv8g4m0rdF4uv+EW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muz7w-00DLzP-9q; Wed, 08 Dec 2021 15:45:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muz7a-00DLqs-AR
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 15:44:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FD76B82137;
 Wed,  8 Dec 2021 15:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C50C341CA;
 Wed,  8 Dec 2021 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638978279;
 bh=8ywbSsmMTnCb0bYAOFTzp+UZJcVTRDUeHz5n/MuFm34=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=KHDiUPKiWOLM55/3Yw8e4cELX/ius5cnT4xTYfUYv8s2t5BL9tp7WMc4eJgVt+137
 3oAUQGeMzVe8+EeXIUo16JceG7hUa1vnrENIH3i9BfSnn4tRPbNUUPlVnR+7hYxUYm
 q9wdILgXIYNzx5bNmE98ZHV9BQ0Q8WsNsha53JO1LvHjgZ+XW/LtP3TAj2eRPKyl88
 yOyuOJ9Oh7/QUAOfJDv8+LXPrvjBwAJnILpRt1B/AzAfDUdZ7oX8Wla21X7pdnULfY
 LoB/xovXZ2PLPyNiYOMe8Sr2AMnbKyohVVUIMlKzLU6nt6Ly+8MhWFeq2HsJ13PEG4
 OZWgXYoQX5wVw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add HE UL MU fixed rate setting
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1627597558-25144-1-git-send-email-msinada@codeaurora.org>
References: <1627597558-25144-1-git-send-email-msinada@codeaurora.org>
To: Muna Sinada <msinada@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Muna Sinada <msinada@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163897827714.29276.8873042028382760166.kvalo@kernel.org>
Date: Wed,  8 Dec 2021 15:44:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_074442_551128_39579585 
X-CRM114-Status: UNSURE (   7.88  )
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

Muna Sinada <msinada@codeaurora.org> wrote:

> This patch adds ath11k support for setting HE UL MU fixed rate.
> HE UL MU fixed rate is informed to HE STA by HE Basic Trigger frame.
> The added code is reusing parts of the existing code path used for
> HE fixed rate.
> 
> Utilizing iw command, HE UL MU fixed rate can be set:
> 	iw dev wlanX set bitrates he-ul-mcs-<5/2.4> <NSS:MCS>
> 
> 	Example: iw dev wlan0 set bitrates he-ul-mcs-5 2:5
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00356-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>

Doesn't apply anymore, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:6029
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/wmi.h:1047
error: drivers/net/wireless/ath/ath11k/wmi.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1627597558-25144-1-git-send-email-msinada@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
