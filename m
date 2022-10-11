Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6E2C433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 10:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MNzvrLrQDaov2Bv97hMCatIBtuAYwgi7eJ1leGO7WQ=; b=PluxDZWblPlU6Y
	0QiTLuiO5OspDZH38+ZM1TebLfeTxgeKpQyQsdXAL3KbcvE93XUV95NrdT1hyF+/IgYO5VQjDPUOz
	MmFPkGg9zCz123ItfkNIdtvaMCHwE/Gsu1bF3tBIs1zK06Nq345hSo5sBRaHFQYPZ6EVtEPXP02D7
	P9E4PG+wt2LZKilg4JWPpU2lWlibKC/F0lGsuteYvWmkl4p8PNon9XzjYSPN1bns7vJDuIf0lCt2u
	uZxMd67rVZR76lYwySWaAlkL2fmiXgoYrn8pqJJBcpvIf4yTzHsxodY8iGtpDW61e6h81aTj4nu7/
	bi4xRyLpaBSngPAwNXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCt8-0043Hz-2Y; Tue, 11 Oct 2022 10:53:30 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCt5-0043H1-CW
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 10:53:28 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id B498C2B066B9;
	Tue, 11 Oct 2022 06:53:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 11 Oct 2022 06:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1665485605; x=1665489205; bh=5bI3YI3TxD
	wB3OBrM9zXo72ykVPw/KrTh1LKAdTEzQI=; b=wvKNwKMxqrtAUNztuQlpfH9rp1
	brYdNWsHKjW5fJGmq9KxBMWNgghy92WBf4MC7Df/2iyjxjmhvBS9lfU/852FLQBp
	cwYxE7DKRf1odZT1cYvYmIOjaFXYHx1v9iQfOZ1r45PpQULyQ73bENRT2VQaF14n
	YlSUTQWrnjdvMW5/vOFs1RpnahKqADuw8MKEfsOS7DOCiPl8jJUcMj54k+6YL/cP
	Tldi28IarLCcK31EyloZYKNFdkDjGMo5sgbySgmeTpy7U14eqb6cErLRRWgnPBRL
	5JF2BDvJFdUGJNEaZehLDR7ifkamlAlDo52ovoiZk8a6s4AnrGC4lGLa7D/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665485605; x=1665489205; bh=5bI3YI3TxDwB3OBrM9zXo72ykVPw
	/KrTh1LKAdTEzQI=; b=QiyfXg4wplRnzHFR+cKAh/LuF+QhtxgGfaKaoB9f8dyO
	41zuh4OCh3LAMg4AEswO0xUhCGhmzHV8pNpkmkRBcuTeFDIeiBfw464gNOdcqn4I
	fFFPIYbZCGph4Y1DbFmnVdv7soycxHa2mLCXm1LiV2NLX5Ofs0QiFuHBNtEOyXcM
	uSFkq7zJo2eoNmSWveue5aUznNqZ04sn7yu2lATDofJ0jSGdfILE6BQEBY2e32qg
	H0XRSS/QYLFzQYuA4wig9W2u4LP2bAW4VtELDlZbNut75XPUyRQ5DeCUiiHM2elL
	vp6jgsEcas+IeiCGy2bMpewivf1Zqz3ZMcf30umdXg==
X-ME-Sender: <xms:JEtFY32lcooBYztdni67Wwmf0LubIg_dQcMQkf3jQrxQ-oDXKtPCUw>
    <xme:JEtFY2HgsDD9Sbsgfw-Jy2gu8rI3E0Sl9eGDOrmslweQR1ZqSxMeUEs_-Yh-k0Swd
    mPXzYddL1kPBGVBsoI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejiedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:JEtFY34Hs5N1C3qu7St5NaZMRwdLH8GqRYGVSNCkcjMa44U90zOy6Q>
    <xmx:JEtFY83QAC37vCJ0ovUwIfvJSa_Vo9YEENl-M-JBNfvib88fBVKhGQ>
    <xmx:JEtFY6HZMGQ9A2HNXL7dS-yvA5FZgAEJlvb5J-il0U7Y-PCW9C3p5A>
    <xmx:JUtFY9C-zwgQtavNsqAMd3xx1ciDw6jSZur_Rm2SJnHJdxi7sCsWrmxdE6s>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B75D1B60086; Tue, 11 Oct 2022 06:53:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Mime-Version: 1.0
Message-Id: <e21a4eab-fe4f-4028-a22e-d60a6feb4dac@app.fastmail.com>
In-Reply-To: <87tu4aok1j.fsf@kernel.org>
References:  <CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com>
 <87ilkrpqka.fsf@kernel.org>
 <158e9f4f-9929-4244-b040-78f2e54bc028@app.fastmail.com>
 <87tu4aok1j.fsf@kernel.org>
Date: Tue, 11 Oct 2022 12:53:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kalle Valo" <kvalo@kernel.org>
Cc: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 Netdev <netdev@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>,
 linux-wireless@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, ath11k@lists.infradead.org,
 regressions@lists.linux.dev, lkft-triage@lists.linaro.org
Subject: Re: drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning:
 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_035327_470053_ACC881C5 
X-CRM114-Status: UNSURE (   6.65  )
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

On Tue, Oct 11, 2022, at 10:12 AM, Kalle Valo wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:

>
> You guessed correctly, disabling KASAN makes the warning go away. So no
> point of reporting this to GCC, thanks for the help!

What I meant was that if the problem is specific to KASAN, it might
be nice to report it in the gcc bug tracker with the KASAN component,
ideally with some kind of minimized test case or at least preprocessed
source.

   Arnd

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
