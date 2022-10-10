Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100A6C433FE
	for <ath11k@archiver.kernel.org>; Mon, 10 Oct 2022 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NEUtq8GM0lPIAfZ2HTPfoCTei7hlbHqRJq7tJLmHK4=; b=PZirkt0vUaFDBL
	uRKw/LcWb90Epb7/aqpume8glJ9+2xgzd7BUi3JPt1Iks66jo3vJwJGS76Gn2YAN6GJhJW+ZoWxuz
	S/v6/DSu7KbV+ffwhdGnawDowQQrkFALsC7+53OBpLjKrFWvar7gPuXoegTvbgoxlENiJ3iMd5V2m
	YECeGsWol6LzSs8BwaKuPuxFtm1fVGTt1wUBStSR5179bDGJMbAsXCfjIhsOyhLGPLO/b83UJ+7dI
	1pDtZVhzwe7PV3R/lx4nH8xPiZpl0m5Z0Shw273vDB3xnxg6bx85p/n7k6upaw6sB9nKEEELZIsqy
	lv2inoCdRnUFVBvx7BoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohwxF-001hsy-OU; Mon, 10 Oct 2022 17:52:41 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohwxB-001hqe-QI
	for ath11k@lists.infradead.org; Mon, 10 Oct 2022 17:52:39 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 85BC52B06F1B;
	Mon, 10 Oct 2022 13:52:31 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 10 Oct 2022 13:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1665424351; x=1665427951; bh=eIM+MeuDgl
	5z58nSOwcRux9xgNdpNXrzM2SeDZwQsd8=; b=oYZS5cu/Rsvl0KB8JTLsGB3saF
	kHTxa5Fkfk+2YZuUmW9S023XW9o0XZ0SDkanDwFAcRrfnfQSmXsoo5P3Ges1zjBL
	xfvxLGE/PIRL1hIfssvk3zHIJO5gYIpw1Hq6FsGy6STG1EjMUm9xPrf7SoN0TbcM
	lW+Pmrs07xyj6QAHa9a4A47TC+EdrpYC4ECJp1POmEvis5e7t0l4oRjLdzWpE/+5
	huVbsRcM8F2DYQ/eWtpk1cO+0hEV+8sBDdZnEPKEY+8mR+FQsBIlQLr7ia0I79Yd
	dx5VnCYxMOOy7K6aAa4zQAHfR+qG4OTopY2xqj0nZ6JexpQYsNFTfI+kIXDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665424351; x=1665427951; bh=eIM+MeuDgl5z58nSOwcRux9xgNdp
	NXrzM2SeDZwQsd8=; b=U9A8Pr/nhJN0fRLBk0x5nsQOv7x3e+NiaeXMGoKz2X8C
	yQizTYenqakkepNspG883KFpigUTTBod0GP0z/+BJxxLiGU15sBrf4DmuFOrB5pk
	tZxoT7wGtBG/fZ0YVC+OysEa7hll+3SyB+TxTPCvtAPrpskNkj5QTzlCSC3k9q6A
	ZoUONN2LuxiqmrA/hwV/Rn094kcd8rKbbbdNRghnqU3fEEXT86vBPrqf2i0KTOcC
	zKbvN05lgLt0E8O6aiqU1FAunw7EKsjNbMzAxpi9HwBXV6KwODbKyvwEjeub96px
	qKdbKSnAzV+joiEs4L4uLyufFYzCkEvf55D0zq+FcQ==
X-ME-Sender: <xms:3ltEY_8b39mNjScYLdR4EksI10Dmr9dCKLpvYm0EqLHlUzUwYrVQEg>
    <xme:3ltEY7shMHCvjx9dhS_CDkTBNypGWkHRDgUEBy8O590its7J_gEj6K6S0giUkpAxZ
    wSvMi7sMKZIRecmb4Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeelhfejffehveevjeduffegieffhfeihfekteetffdujedufeeghfekuedt
    heetgeenucffohhmrghinhepthhugigsuhhilhgurdgtohhmpdhkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhn
    ugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:3ltEY9C2kDz3h37uVXomDacWmOvYYCjaELqRJgTzUtWZvHe_jBpX7Q>
    <xmx:3ltEY7cigPoef-_K5NZhRVno0hk_IX7XGhKORG3mGpkbz6fDrvav1Q>
    <xmx:3ltEY0P2trZKuLHGNKQ8enQ6dPvU7dVmK_jFfzTAbeHtGlKUXyeoqQ>
    <xmx:3ltEYzpfzxKrcwSazZHRW6cp90WKwAXb278VbPYcPIlYN2rn4Q9OjnNW0SA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 933A0B60086; Mon, 10 Oct 2022 13:52:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Mime-Version: 1.0
Message-Id: <158e9f4f-9929-4244-b040-78f2e54bc028@app.fastmail.com>
In-Reply-To: <87ilkrpqka.fsf@kernel.org>
References:  <CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com>
 <87ilkrpqka.fsf@kernel.org>
Date: Mon, 10 Oct 2022 19:52:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kalle Valo" <kvalo@kernel.org>,
 "Naresh Kamboju" <naresh.kamboju@linaro.org>
Cc: Netdev <netdev@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>, linux-wireless@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, ath11k@lists.infradead.org,
 regressions@lists.linux.dev, lkft-triage@lists.linaro.org
Subject: Re: drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning:
 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_105238_099411_2627638F 
X-CRM114-Status: GOOD (  11.07  )
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

On Mon, Oct 10, 2022, at 6:54 PM, Kalle Valo wrote:
> Naresh Kamboju <naresh.kamboju@linaro.org> writes:

>>
>> Build log: https://builds.tuxbuild.com/2F4W7nZHNx3T88RB0gaCZ9hBX6c/
>
> Thanks, I was able to reproduce it now and submitted a patch:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20221010160638.20152-1-kvalo@kernel.org/
>
> But it's strange that nobody else (myself included) didn't see this
> earlier. Nor later for that matter, this is the only report I got about
> this. Arnd, any ideas what could cause this only to happen on GCC 11?
>
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

No idea here, though I have not tried to reproduce it. This looks
like a false positive to me, which might be the result of some
missed optimization in the compiler when building with certain
options. I see in the .config that KASAN is enabled, and this sometimes
causes odd behavior like this. If it does not happen without KASAN,
maybe report it as a bug against the compiler.

     Arnd

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
