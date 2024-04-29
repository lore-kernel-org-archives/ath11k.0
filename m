Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3A1C4345F
	for <ath11k@archiver.kernel.org>; Mon, 29 Apr 2024 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dqbkib0bxKKANnpl4mPSGPwuahB3su7zfx76HtatWR4=; b=Zuj3oS/KeAJf51tXeGBZe/LyDE
	cdUu/ZSzWt1hvyAX9B21xAjiSdwnX0y2XldIoj8ySNKJkeKgXZASN5qEFUNCgpLnCu9Eb4Z+IrpeO
	4lSZBiENZTqTvgiuTv8TgU2vgYkOAe55i6hf8YoW8DxaPIDqPH7MfCrahmMoKQ8WkimqaEQCiuiOa
	jt+NGJ5tbO7+sKgwMGZZm3/gAAWCCfnSOjLG3No2q73eVwyfVN/icfLXT5NUK5zJf4PhWvp1RhmrC
	5Lfp9/ZPqm+P/d12aJ50ywVI3sKaBq9Xhd++YeyZODuKFl1t30tqsqcocYraT1PL9s5PORi3FZxeT
	0Dcz7uIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RBo-00000002y1f-47K4;
	Mon, 29 Apr 2024 13:37:04 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RBl-00000002y04-41pF
	for ath11k@lists.infradead.org;
	Mon, 29 Apr 2024 13:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1714397816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dqbkib0bxKKANnpl4mPSGPwuahB3su7zfx76HtatWR4=;
	b=fzC42RRH+dAiq8tdJgrC5qHQnTZqIQUAxa9SWyapXAOTGWZiAB3qraQ3/FH66ydypd4VKb
	2ESHZlNYl46JYduSaxW8vSFHnPjLEZ2H8zRNCWTwNh87KJyMalJdSSBWFR/GV/CQFXHXWQ
	U9Wl1dIqwSPW5aXWVWIOIwpCNruwUQY=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Tanjeff Moos <Tanjeff.Moos@westermo.com>, openwrt-devel@lists.openwrt.org,
 Felix Fietkau <nbd@nbd.name>, ath11k@lists.infradead.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: Question to recent Qualcomm CVEs
Date: Mon, 29 Apr 2024 15:36:47 +0200
Message-ID: <4889305.GXAFRqVoOG@bentobox>
In-Reply-To: <87il00qpjp.fsf@kernel.org>
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
 <87ttlvjk6l.fsf@kernel.org> <87il00qpjp.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1886866.tdWV9SEqCh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_063702_215984_808436B0 
X-CRM114-Status: GOOD (  10.42  )
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

--nextPart1886866.tdWV9SEqCh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Subject: Re: Question to recent Qualcomm CVEs
Date: Mon, 29 Apr 2024 15:36:47 +0200
Message-ID: <4889305.GXAFRqVoOG@bentobox>
In-Reply-To: <87il00qpjp.fsf@kernel.org>
MIME-Version: 1.0

On Monday, 29 April 2024 15:14:18 CEST Kalle Valo wrote:
> It's quite strange that they updated 2.5.0.1 branch first but my
> understanding that there should be updates for the newer 2.7.0.1 branch
> as well (2.7.0.1 branch is also in linux-firmware).

Yes, I also told them in the support ticket that this is from an older branch 
than what is currently shipped in linux-firmware.git. But they told me 
that they are working on newer versions (whatever that means) - but they 
wanted to  handle first the update to ATH.11.4 (2.5.0.x) and then 
step-by-step release it for newer firmware branches. It seem like that would be 
up to 2.9.0.x - no idea why there is no (public) 2.10.x/2.11.x for the AP 
SoCs.

Kind regards,
	Sven
--nextPart1886866.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmYvom8ACgkQXYcKB8Em
e0bRsxAAnMMYFIu5D9dmMhN8X89gWc8rJZu8hfLdN2no2xEscV+4MPRXPhnyTlAG
QSOQcmNDMQNWFOLMNmElqSozHUSyweAOATktad4uhusxOp9rN/3Zrvgbqtxf2vSR
EOy+R0yRB6rvog7cepP9WHhTqEJwrbIi5jmuFAwpxCKRs/p+uYAbvCIbefF66yh0
j7eSU9xfhK0buIxINBs22awIR5QfvcwxMBU71pN3M4VIluQR3sbk6ZzJ0mk0KW04
QS3ZV+A6mfOQEzP7R+WZ3XGrMGPkdkCgtfjQzo4LLfJsj4c7KGaKp1lDM71SeUgw
mOGSBBy240FR41DlD1Ma/looqHOEm2/agjbKWkVO41LxA9q4Wk8aO2yA3cFM0wyg
h6naN7c3GpfMRgUIMRlBMtk1gUTW3hh9Fg4W2GudztNAOeONH7jAEGfRzPKwwxrH
lMkPz9yV0ilzxcjD8dFAv+9+ATrLNZVzQ85nXx8JZv1rbOEo6Op1Bv1rnz9wAlsP
G2exubPV8hPmu2/t+YttVzIxp8Y/vV6Q9rvfPftGAgmZ6JS+oDbbGQcOEUgbaR1h
+qwVzRrUkPnwa5UQFHcmNiwHhlh/3m2aw1rdpxIZeDyItqtA23on1X+ZJ8PctpSz
BxA/kWtkjo9u8RoHuZ0dJXUHcwqMIWZXj4TRa6rXktImPenOXog=
=fjWX
-----END PGP SIGNATURE-----

--nextPart1886866.tdWV9SEqCh--




