Return-Path: <SRS0=qRpf=PP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E050C433F5
	for <ath11k@archiver.kernel.org>; Wed, 27 Oct 2021 07:08:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA76861073
	for <ath11k@archiver.kernel.org>; Wed, 27 Oct 2021 07:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA76861073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhcZ8MvDO7F4zzhxBR1G0zO/7ELRqlDwFRSzLLjLfbQ=; b=J/GZbDsYxzPZlaE1tTAqkydhWP
	vPX0h8tOgkXvzCHV62VzdE8BWQlI3iwQE0thn66PCxRixvTRaq8aPUCB36JvXydbDhKMiDn3udAtG
	P6gQGc97S4PG5QqJLMa1Ov51BwPlCm8ZCdEILfpIvJpJNjq9yOt1iIzCGrTzAXV+XIEVlHZF2KcAf
	0lA/cz2YlW+Oht0Q4A5AWdX7OffehFca28g8pDfBADPT+mD1eJvKgICk/5SJVo2R9wFAu/a/c+hxK
	+p6P5rkUJ8qCs8pJOOe1EfjyHWDH2YNOlVkyMGppvjUZkOtlxS58ioSi6hkmor746eiUovQ7gSF8n
	I7ZXtgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfd2r-0046r3-6G; Wed, 27 Oct 2021 07:08:21 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfR5q-002kJe-20
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 18:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1635272552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kpSsBuI/yra5yOXYuL8UW9rcOksCsGQVxFgeLbgQfGs=;
 b=DafVf0dhMTF9atvgEoEIYZ6Td7qBtIEEC55dFy7EEKcAZf5hvMcLNO6ySXPt+BwwVAk3Ks
 bP5yz74e8MWfe1J2KpGkC17Z4tZpDetqISnQmz/HbazMaf21s/tB2+r7SnqfPWGY5dbczm
 77dFrMkPT2M/p5TmSbYBHaqv7g4T4UI=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: Re: [PATCH] ath11k: clear the keys properly when DISABLE_KEY
Date: Tue, 26 Oct 2021 20:22:12 +0200
Message-ID: <2140984.h3xd69cp4r@sven-l14>
In-Reply-To: <20211026155446.457935-1-sven@narfation.org>
References: <20211026155446.457935-1-sven@narfation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_112238_275569_E84A6E9B 
X-CRM114-Status: UNSURE (   6.23  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 27 Oct 2021 00:08:20 -0700
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
Content-Type: multipart/mixed; boundary="===============1761297264997598368=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============1761297264997598368==
Content-Type: multipart/signed; boundary="nextPart3042913.mnNX1PIVWj"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3042913.mnNX1PIVWj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: Re: [PATCH] ath11k: clear the keys properly when DISABLE_KEY
Date: Tue, 26 Oct 2021 20:22:12 +0200
Message-ID: <2140984.h3xd69cp4r@sven-l14>
In-Reply-To: <20211026155446.457935-1-sven@narfation.org>
References: <20211026155446.457935-1-sven@narfation.org>

On Tuesday, 26 October 2021 17:54:46 CEST Sven Eckelmann wrote:
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

I would like to retract this Tested-on. My test caused another problem which 
resulted in a complete shutdown of the vdev. After fixing this problem, it 
turned out that this change didn't fix anything (as far as I can see) on this 
firmware version.

Kind regards,
	Sven
--nextPart3042913.mnNX1PIVWj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmF4R1QACgkQXYcKB8Em
e0ZtmA/+NHgZ2CVrq5gZ2qvv+rj6FNvuZLBnmSaMH8gjr+lRibxXr+3x9W1ZS2fM
ZDiQXeF7FCE9np2I7Nd8HdeAx08NMPu+Vqgw6hmsEd5ZRf6KOKp+S+5WMgU+fqKL
uYzYGwTPTnsWzJ8ZIEwAa8nR1+zx4n1L6CzSAxBpmdxeWcp99icO5iHMme+0WW2W
kqiOIzRJVlNzZBpu0gTybSnDTVR/unc25wTiQOktrw1FhJhjEkoJA/piZv7kFc6z
MWS9zhQJmk1cEJD2+YoObfaFmoQ7XN1SoqTBHh/jqAkJnjOkLGv41bFBwmHOZnyT
4vtFaAPYUqBfiCcsXlaxqHeYMIgOi2m2t6HtKXP6kDuddy1L/sO8vhHmkrQA4Gxe
ls48r6GJwXsB5ZedHP4BE8puzLEyOTs94geco0mPntceYNVbBjNYNVBuaLVvDb99
LdhYBiiNM6+fuQqh49WKfYuFmwa25etOPnHMV5PJgV7VViqgI5A6RtcJSOIfu9V2
B4hT6Mjx6p8MxUXPSLzpQefo9KjXXOGksTiFblKGOXGZ78Jz8werAuTxzzRESRZT
5e7tl+nNT+IHInbZufqTxf8+eYAC4U0M/Fq2lHbSbvT5498YFOm2FxqTirkl9b8V
y+JLaC+sAIrPABdztXhZ4djO0+hdaL6jho9NLds/xD9AZh11CI8=
=Ec1P
-----END PGP SIGNATURE-----

--nextPart3042913.mnNX1PIVWj--





--===============1761297264997598368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1761297264997598368==--




