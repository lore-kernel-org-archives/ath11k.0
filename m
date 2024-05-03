Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BB7C4345F
	for <ath11k@archiver.kernel.org>; Fri,  3 May 2024 07:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoXRNgV30CkWoOVG5gFVHWYrepvbzcL1AyRc14uCK/4=; b=gselz4kxXStgM4hnM1Lf6v3Ei0
	0TU3VmcN3pP96Okzk3qbrMdv1yuBKJFyvDKbB67D942tMAGx/2PsY47hNi6jYL2Dom3BxzOKS7bmT
	uL4YS5pL1ZXtMy4fCixvCue3dElDrzwxreWolyVncMWeQVY3ba82SdRPXi3btPA6kqtGicFCpGbBt
	0MiXP5D3qzYH1kHLVee5RvhpWaadASUVbqPlsun2+i4id30vPzMTDcIjuORYUEWNpjVk1G4RZxPTa
	6h9nn3euhteqyX3BPk/LN78S3LC88CXbQd3X0o1ofxs/8Nk8ek5Y3aBRpZ7G4vICT5SaopUBvEP3b
	8ZE90hMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nYc-0000000FVkD-2vpU;
	Fri, 03 May 2024 07:42:14 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nYZ-0000000FViB-40NV
	for ath11k@lists.infradead.org;
	Fri, 03 May 2024 07:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1714722126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BoXRNgV30CkWoOVG5gFVHWYrepvbzcL1AyRc14uCK/4=;
	b=fSP31tvsiZlIl1+JSDw8JI2RK/Hw51zhmtK7tU9CZuEubwkDgNSqRHj9bDAmRq5ZpDW7tT
	ilfipFs4cCA9UQ/vLIXIcDyOn3w05Z5Q+m/X+YrMCNUTSIDf3QbpIkolTtaA5PINn/Sype
	dWbWLNLQSMQtF/bLimmmSldFj7i/vkQ=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: Tanjeff Moos <Tanjeff.Moos@westermo.com>, openwrt-devel@lists.openwrt.org,
 Felix Fietkau <nbd@nbd.name>, ath11k@lists.infradead.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: Question to recent Qualcomm CVEs
Date: Fri, 03 May 2024 09:42:03 +0200
Message-ID: <3561287.iIbC2pHGDl@ripper>
In-Reply-To: <13504833.uLZWGnKmhe@ripper>
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
 <4889305.GXAFRqVoOG@bentobox> <13504833.uLZWGnKmhe@ripper>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9272541.CDJkKcVGEf";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_004212_228476_FDC8291F 
X-CRM114-Status: GOOD (  20.11  )
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

--nextPart9272541.CDJkKcVGEf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Subject: Re: Question to recent Qualcomm CVEs
Date: Fri, 03 May 2024 09:42:03 +0200
Message-ID: <3561287.iIbC2pHGDl@ripper>
In-Reply-To: <13504833.uLZWGnKmhe@ripper>
MIME-Version: 1.0

On Thursday, 2 May 2024 09:25:03 CEST Sven Eckelmann wrote:
> On Monday, 29 April 2024 15:36:47 CEST Sven Eckelmann wrote:
> > On Monday, 29 April 2024 15:14:18 CEST Kalle Valo wrote:
> > > It's quite strange that they updated 2.5.0.1 branch first but my
> > > understanding that there should be updates for the newer 2.7.0.1 branch
> > > as well (2.7.0.1 branch is also in linux-firmware).
> > 
> > Yes, I also told them in the support ticket that this is from an older branch 
> > than what is currently shipped in linux-firmware.git. But they told me 
> > that they are working on newer versions (whatever that means) - but they 
> > wanted to  handle first the update to ATH.11.4 (2.5.0.x) and then 
> > step-by-step release it for newer firmware branches. It seem like that would be 
> > up to 2.9.0.x - no idea why there is no (public) 2.10.x/2.11.x for the AP 
> > SoCs.
> 
> Just as info: The non-public QCA ticket was simply closed on Tuesday (without 
> having any upload which works for Robert and is from the same/newer branch 
> than what is currently in linux-firmware.git). So maybe we are actually out of 
> luck.

Now they are (indirectly) claiming that WLAN.HK.2.9.0.1-* is for ath12k. You 
can actually read the response like everything newer than WLAN.HK.2.5.0.1-* is 
for ath12k. Maybe I missed something and somebody can point out my error. Btw. 
their ATH.11.5 release already a newer version than WLAN.HK.2.5.0.1-*.

And maybe someone else known why there is a WLAN.HK.2.11.0.1-* and 
WLAN.HK.2.10.0.1-* [1] for IPQ9574 but not for any other 802.11ax HW. Maybe it 
has to do with the fact that it is used together with 802.11be HW (PCIe, 
QCN9274?) and is therefore still actively maintained?

Kind regards,
	Sven

[1]  https://github.com/quic/upstream-wifi-fw/tree/main/ath11k-firmware/IPQ9574/hw1.0
--nextPart9272541.CDJkKcVGEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmY0lUsACgkQXYcKB8Em
e0YtsRAAlOQyCCMj2jHoir/WyTJFwP3Ag27NEHp8pYalvW0VafG7GE3BpKeiRuif
JrLEq/NhGjoFBGhixD4gjPyta2GaiJmA4FCMmD2ruBhCcVPjzm8PNMWoWsuFmMna
rr7PQ4KQOtT4U9rgGZNOgxvftIJ3qD6fCzK3OqqxcHI8ZBjHJpHrMlLbUjd+BEig
6hQVv1BgvGDYlbtTxTudPXgar+AwR/wTDG0BSYDgUBUgBDWa3l/D1b3duTFqdjPG
sR1Inv6TPMJvlya1R2keZGLfeflUKy35mbeGvSdwGodQcM86mbe/uKDjp8oGR3p7
9h1qEzTQASJ6F3BxCeKtPBtZfV5cHVaO+8qd0L6mcWrxJufZTeH4Uri+2pQepYU/
Vv6LXHvtQCdsUUksM6yho1F2ITYSZW1/Kn8vZDt077AXrZGKSTN2UMoysDFnjnxW
yTcgste9hJ5694n7spxST/C9MJWftJJRgtJlfr7/GOmr2Kj8e8vlrcYmhfDw0igL
lZviGSQqnoNMp92oEUdBzYqhw1Yn+MaxmGOtko7e6qpmrfjmeFFG9jlwtOJ90GJF
efgfiXHqyNTf68RXOrNuqj6K88eslxiIFH3yN4S8tX6CJMkBkfyF7dc3L6lf6PV+
hBy/0twKymPcFfvZ+x1olXy/6sBsGvUZlwquqX7LT+Eci9/yuBA=
=vBko
-----END PGP SIGNATURE-----

--nextPart9272541.CDJkKcVGEf--




