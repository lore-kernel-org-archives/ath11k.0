Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1B3C636CC
	for <ath11k@archiver.kernel.org>; Mon, 20 Feb 2023 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToxRKxhgbbX6aDLwtis5clrceFdXFYoL/qTy5c7IpTw=; b=vZ+z+Hy/gYQcgx
	pV5dgKmjS53b2NXM0tJJvi9i+49jS5rF5TlkU0OaWvCQ5Tnp7x8ZSKWkMbb490uTs6I8qxKAPcGqp
	6BRtLv7h8HYFCLmILcPy8n6CCsxPgPwPJBOFGDUvtplJzoDINxRRizLY5PgqVGomz1imFHWAkYB0J
	HeTO0TE89xRzVgfc+HVojmCimoaJ/TXk0eBQgFvkZxYDgY1Dr305crPePD8DQ53/GyoSdHiAehFh7
	Dbi+acT5Wa/Tas/+4r8v1nhqAvLx53/jL00Q5/UVno2gGvu1sd+KzSPlsoCy4UsO9+7PJzIvhchBo
	zsV6qV/INJAz4VGF62PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1zh-003Pbm-Ug; Mon, 20 Feb 2023 08:57:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1zf-003Pag-1n
	for ath11k@lists.infradead.org; Mon, 20 Feb 2023 08:57:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 43F9660C85;
	Mon, 20 Feb 2023 08:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A14C433D2;
	Mon, 20 Feb 2023 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676883473;
	bh=cn2uG6h1Z4V5em3rkbUzwLVNE0WxlJeGFfNh8HPkEw8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bu2j1/eVWJEWPVWt8awRoRGUNv6v6xk8DtnmKtp2ZF7tPl66VH+mUsJ9paGtOUYs+
	 z3t4MnvL9+m41LUoFslSpvlV8q0ayfW8S0lerzI4f/9ITLdJIBmsaXGnzlb/jqKBAy
	 m0U7a2X7gBROblOisdQkf9NFnHXfJGFULiQvTFw12Wis2err8Eneagir23+cPKZwVv
	 yMK45fbQQvAeXE1K8SwRX93YkcxhUygQnqEs4aerTJiCflc49eU34uKqQMXEg4zrkV
	 1qpkXmutpl0w8t4wLGZYZ4e0KqWFNp1n9ASePw5NgOaYMKG8gY98lDNUk0V0s4/W0g
	 ItCaL/yb1oixA==
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
Message-ID: <167688346963.21606.5485334408823363188.kvalo@kernel.org>
Date: Mon, 20 Feb 2023 08:57:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_005755_325682_8CF3ADE6 
X-CRM114-Status: UNSURE (   9.71  )
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
> Fixes: d673cb6fe6c0 ("wifi: ath11k: fix peer addition/deletion error on sta band migration")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

I assume you only compile tested this and I'll add that to the commit log. It's
always good to know how the patch was tested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230209222622.1751-1-ansuelsmth@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
