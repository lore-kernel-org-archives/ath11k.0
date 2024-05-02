Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCC5C4345F
	for <ath11k@archiver.kernel.org>; Thu,  2 May 2024 07:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=579FziLzdVqZVaE2jgHgLPJEym1L02EMbBPSwan7Plo=; b=jQ+vxxsnE11c4CrU3qaRfMekan
	nv7PG4Ruits9lT9fMsunafp3P6qjynTKj3JOhX7FqhzsX14Q9uG0yXj28fFWNkT8wTd6kVYpchcu9
	YVjQONcN66bKOrsofzlYswydpRLIsIlHQdTk+2xAGZyzqIxsBeHdEhMIBBxo/NO9kfBxChhAink40
	MD3UF3Tm+RVJSd/nxcs+BWkdzk0Sv6koYsSaWBRvo9RgQP2+HTiqdLsDZgDnTYhRIAsaJfR8qMvzE
	wZgCUBP4TbK22rfyBuFPakIf4H2mjYTUO3ixT1yzXWWhhEjUSLvTqnERZIseCc5XxpQ1OBGO64Kmq
	+3XziD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Qof-0000000BnSo-0Xrb;
	Thu, 02 May 2024 07:25:17 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Qob-0000000BnQP-315z
	for ath11k@lists.infradead.org;
	Thu, 02 May 2024 07:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1714634709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=579FziLzdVqZVaE2jgHgLPJEym1L02EMbBPSwan7Plo=;
	b=DXqThiyPjRm7oT0Xst4JZlyLX3Jzs27g59GO9m0gUHcodbFU7dYKWWpfzH58JMsiW4fsk3
	/NovEEffscqbgVJXWmFWw2jdlsJbz9p/VBdu+54I18rhebLGDS2My7yXzp+XNs52UTcyQx
	71bis/f6zGyaKm8C0iyWSiWiOWR3J8M=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: Tanjeff Moos <Tanjeff.Moos@westermo.com>, openwrt-devel@lists.openwrt.org,
 Felix Fietkau <nbd@nbd.name>, ath11k@lists.infradead.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>, Sven Eckelmann <sven@narfation.org>
Subject: Re: Question to recent Qualcomm CVEs
Date: Thu, 02 May 2024 09:25:03 +0200
Message-ID: <13504833.uLZWGnKmhe@ripper>
In-Reply-To: <4889305.GXAFRqVoOG@bentobox>
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
 <87il00qpjp.fsf@kernel.org> <4889305.GXAFRqVoOG@bentobox>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2934772.e9J7NaK4W3";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_002513_982720_478566F5 
X-CRM114-Status: GOOD (  15.26  )
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

--nextPart2934772.e9J7NaK4W3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Subject: Re: Question to recent Qualcomm CVEs
Date: Thu, 02 May 2024 09:25:03 +0200
Message-ID: <13504833.uLZWGnKmhe@ripper>
In-Reply-To: <4889305.GXAFRqVoOG@bentobox>
MIME-Version: 1.0

On Monday, 29 April 2024 15:36:47 CEST Sven Eckelmann wrote:
> On Monday, 29 April 2024 15:14:18 CEST Kalle Valo wrote:
> > It's quite strange that they updated 2.5.0.1 branch first but my
> > understanding that there should be updates for the newer 2.7.0.1 branch
> > as well (2.7.0.1 branch is also in linux-firmware).
> 
> Yes, I also told them in the support ticket that this is from an older branch 
> than what is currently shipped in linux-firmware.git. But they told me 
> that they are working on newer versions (whatever that means) - but they 
> wanted to  handle first the update to ATH.11.4 (2.5.0.x) and then 
> step-by-step release it for newer firmware branches. It seem like that would be 
> up to 2.9.0.x - no idea why there is no (public) 2.10.x/2.11.x for the AP 
> SoCs.

Just as info: The non-public QCA ticket was simply closed on Tuesday (without 
having any upload which works for Robert and is from the same/newer branch 
than what is currently in linux-firmware.git). So maybe we are actually out of 
luck.

Kind regards,
	Sven


--nextPart2934772.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmYzP88ACgkQXYcKB8Em
e0aufBAA0g9c8U9sOeU65meF2XRVeLCZQboIErFQ9ER42608f/55VDj1rRawf/YW
Nlk9NoX3k1PkrmGD+JrFXaCWkfnGI5vbH4kA2jPdUcXy7SfkqZ8zSdGG1SUUco1E
D4ySzBQYPd+sHkY7p5zQZ+Fiixa3u4/MP08cUrGgb+w8FHVlzGMT0Bv4LH7BdaFA
pbHVUgyfIHusyqOUQbuVsaDgRZqwD9x5Oi06FUPb4n5lKnPBZ9unLoUm0E2r9nbQ
//O/RN9oyPHJ1APuRfcJGaRMmJ2C7cgpaSQ4V1WT0EKTjwx0sb2XjGP7PjncZa7Q
2lmxAJvjkZxzehSu5dxU1KBiQzbaF6EvKxqcAlmfcAZrPFcQBebtBL2fQ9gTKrQP
zMUPAwUnXjerch3JFYsX/kknshOjGpg8NW4defeczIhGQe6NA7/SIrM9iJBpB1gO
Rr1Uynuz/TIW/ZujzHTQiP3K46MDhHL8Rr6i8J9qx7iW7XoeP8r6S3eJUIWIBWHC
kdhqDef9gvVS91j3JJtM3WiTcy47qUnqdffwLp84KNNITPa7umkF3PgxGI9SWEOP
5T2kQaJc3Z0IeCVN3a8207H2sucuh7roiftR6dQ8n+tzM8IRjOj1jNMpIcgkUTyd
L0xL4en/Oo4vrmr//Z/ZjTuLmAfL+RA4ue49VRnN/z9n3N/r5bc=
=KpLy
-----END PGP SIGNATURE-----

--nextPart2934772.e9J7NaK4W3--




