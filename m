Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBBCEB8FAF
	for <ath11k@archiver.kernel.org>; Wed,  6 Sep 2023 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4ldBeD07jll7YfdlDuJK3/N7zYZXHJfoKAAa0LNLFA=; b=MpYUUYtpw7D//V
	hg4Tk2IQid7iHuZWBXKIkq//KEYYY2QyNMTBGeWqzWUJBS0oyTf3qrKVyY6s0/wbuQN4AsLZBcd1M
	sQuw3lFb1Uu5oCCTWr3eKSd/PKHRiEsF/RERwFwwq6OImT34VUlL3ILsI21mPuuC/n3Lfb0mj+eLo
	DH1CCXT5BNm/tW6T5q9+qGtjfnpMlAIZ8Gy2h/gvLPTnlYrbR1PvUMzx3NfEs8MUbWyJ/7uLQMMof
	H/4v2MECbMg3XcaeVUhTYIgDT8yRSnYNWdq167ZJ5EiT3cn2od8Psoo0S0bT7yJIhGQSgzXpGLL2S
	C2NmRi1vdPTKtJzHhKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoA7-007mc5-35;
	Wed, 06 Sep 2023 08:45:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoA4-007mas-13
	for ath11k@lists.infradead.org;
	Wed, 06 Sep 2023 08:45:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2E114B818FA;
	Wed,  6 Sep 2023 08:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21780C433C7;
	Wed,  6 Sep 2023 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693989917;
	bh=G/oSzi+I3YHg1Y4n2Fiw1GfWaiTJNRSfQtDjSG2f7Rw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=r2u5mIozWcK0/UTBoeM1LPsrST4vTVflWoKpJLlgO29THfqHM3sLnmetc7gnDDVkv
	 WdRifdY2DIbcOj4pseRTyngRLKU9INuUlVSUVu4eT5VDqD0yhGeXexGUuq7zr093mN
	 M4hIE81GPfWosIi3k7rVtRvndzzS6D1rHVHdWYvel3Py1LSa1XLmiT+X90e2C6besN
	 zrfckt1o03xE3Cp9hRjw5qyfbxJB9ypXvx4v16Hf2QBJSRgJaJhO4FOgZhQQi4tbOQ
	 uTegbreK1l4yC2PYa7yIoETsQypidyCvMH7c0fLq3cm1onCF8mDTVQT9BlLZTpv/VS
	 vfXIIydnwETgw==
From: Kalle Valo <kvalo@kernel.org>
To: Alex R <alex@ironrobin.net>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
    Johan Hovold <johan@kernel.org>
Subject: Re: WCN6855: Request: Support ThinkPad X13s 21BY-S03Y00
References: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net>
Date: Wed, 06 Sep 2023 11:45:14 +0300
In-Reply-To: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net>
	(Alex R.'s message of "Tue, 05 Sep 2023 16:09:26 +0000")
Message-ID: <87jzt3ellx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_014520_521726_1ED73011 
X-CRM114-Status: UNSURE (   8.89  )
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

Alex R <alex@ironrobin.net> writes:

> Trying the latest board-2.bin from
> https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855 and my
> wlan0 fails to come up. dmesg: https://pastebin.com/CWHpD0kC
>
> My other X13s system (21BX-0015US) works fine so I am wondering if my
> new X13s (21BY-S03Y00) product type is unsupported.

For easier tracking can you please file a bug to bugzilla:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

Also adding Johan in case he has any ideas or knows what has changed in
21BY-S03Y00.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
