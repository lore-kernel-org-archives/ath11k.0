Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4BAC64ED6
	for <ath11k@archiver.kernel.org>; Wed, 22 Feb 2023 10:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOVKaFoMrfQmpX2h1phXLgC6xm9NLgCKw8LJUJ7ys90=; b=iG54Pmjhf2tqNM
	avfpl60/uzta5wWj6JH9bIIrivjLe9mMp6F7kGSdycN5pJMzmxh9mXTWvhInvCESvATTLlzmezBt2
	1N9XhEM3wEAyAtjiXpIsrMwNJypjsU8yZ1UtoCRUwv83kqm08X+iw2s4U/9v+556Zp6D5AA/xrez1
	mBfpeU+O4ezMKI5z9Px82RoTBEg4OXTmcx8Tmv7hIzBs/1duh6xdqnVUg/tGQT5IPCCTelty3LBEj
	7nAGaqJBeQecXsOtQvqljm5R2kkEfHXqPAxMRHDcLrhjXDIeYH+2LnIsuQ1gTvX8E12w5NLiaLb0q
	xX9FSCyqC1fMLLUCRodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmTP-00ByqK-Ez; Wed, 22 Feb 2023 10:35:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUm4j-00BmVu-I0
	for ath11k@lists.infradead.org; Wed, 22 Feb 2023 10:10:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC67E61307;
	Wed, 22 Feb 2023 10:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1593BC433D2;
	Wed, 22 Feb 2023 10:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677060612;
	bh=0EjWaW8FZbf/rs4S89php6TeZDRc/tzK7/iJgWJKpSk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=G2CGdBU8wgzdtt3+iOQ/BysR27IMxblAj4vBx7/K3cM2RgQCcsnyeJFoQfitdFtld
	 0eIWMniczTdNmkRxFePeBRRDJNMdenaM3sRERb6ZcEpPcz8qebzYq0RhiiCfEkc1n5
	 53j3nhK62MNAsYMIAe7BL2+FcuOcfOmzkGgpp+koYU5xNpxBjVhhHo2cdRQyYiKu05
	 SpnYw0CM1ls7Lx7Vh1Jy60l3y73aAeePkGGeiysQERp3uH+1EkPNtPlfU2jGF52o4T
	 aveZENp3vK2h9i72bHf/m5akqCFrtjMiemvCJ5CxgSKJnaxLRroyOEdy2RQ6jjdtQ4
	 B7RgacBZppUOQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix SAC bug on peer addition with sta band
 migration
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230209222622.1751-1-ansuelsmth@gmail.com>
References: <20230209222622.1751-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christian Marangi <ansuelsmth@gmail.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <error27@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167706060829.17720.10858738686921337257.kvalo@kernel.org>
Date: Wed, 22 Feb 2023 10:10:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_021013_724626_8715E8F8 
X-CRM114-Status: UNSURE (   7.68  )
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

Christian Marangi <ansuelsmth@gmail.com> wrote:

> Fix sleep in atomic context warning detected by Smatch static checker
> analyzer.
> 
> Following the locking pattern for peer_rhash_add lock tbl_mtx_lock mutex
> always even if sta is not transitioning to another band.
> This is peer_add function and a more secure locking should not cause
> performance regression.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d673cb6fe6c0 ("wifi: ath11k: fix peer addition/deletion error on sta band migration")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

60b7d62ba8cd wifi: ath11k: fix SAC bug on peer addition with sta band migration

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230209222622.1751-1-ansuelsmth@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
