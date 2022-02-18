Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF50C433F5
	for <ath11k@archiver.kernel.org>; Fri, 18 Feb 2022 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTB2MsqO/Qf9FOzKxXjbTV5yhdHMhwKBAKBOh/KAFhY=; b=NnfsgIBb8vh02ngosCv9wgwJxM
	nszdPyDriVGyDxHxSWZYq50BRHjB8k3fLp/6VNXQnewBMsneyg0x9SAqTlTfKb3VIeBPEGWuPta5i
	zfelKe7K6OsV5Q9KUBjxfMBYLbiW6U2lqXGCrHNZq699WNygGpLzui/agPNLlJKxa1o2I/pV3lwRl
	i6ejj+SMUIi5dFaAWjGL9eGbzw+d7XSPPq8APkJMMq3WwQQ7zP+ZMB96j5HPTxun4b9c0UvVX3tH/
	k6AercHFtzXrwyLl2axDVSJeZvaP+KL1qrjAEX9V8jduV145c2YMwXuRNzMAMnNU19Ushsnjdl8Xr
	loZbvYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3gG-00EilY-Tz; Fri, 18 Feb 2022 13:52:16 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3gD-00EikN-VK
 for ath11k@lists.infradead.org; Fri, 18 Feb 2022 13:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1645192329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4pb96WhkZJpQiDu/Y70uPk131+AgkwCQ1F7iC/w6T7k=;
 b=GtjwFlLvklfJENV6+ze7am/jG7N3cfLzkr7litX7W3Uif9cI8qJTkyzT5pD4yMHEyxVSz4
 H70J3cutpHN6jM2rHPBuLVCS2c+RNTdV0g3y0TMv8K2h/2ocJYlmKxD5cpOsv83EzaYvYF
 yXUef/8qkqUacCI7U+ZDT2ZvEWPaSdM=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: Re: ath11k: incorrect board_id retrieval
Date: Fri, 18 Feb 2022 14:52:06 +0100
Message-ID: <4611744.eon2OSsH4K@ripper>
In-Reply-To: <1734146.k9CKHTOI9D@ripper>
References: <1734146.k9CKHTOI9D@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_055214_379736_2B3252C6 
X-CRM114-Status: GOOD (  12.85  )
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
Content-Type: multipart/mixed; boundary="===============7299729481095007414=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============7299729481095007414==
Content-Type: multipart/signed; boundary="nextPart51415623.Rr01p1FT5n"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart51415623.Rr01p1FT5n
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: Re: ath11k: incorrect board_id retrieval
Date: Fri, 18 Feb 2022 14:52:06 +0100
Message-ID: <4611744.eon2OSsH4K@ripper>
In-Reply-To: <1734146.k9CKHTOI9D@ripper>
References: <1734146.k9CKHTOI9D@ripper>

On Friday, 26 November 2021 15:48:17 CET Sven Eckelmann wrote:
[...]
> * 8devices Pineapple
>   - 2GHz: 160 (0xa0)
>   - 5GHz: 161 (0xa1)
>   - 6GHz: 162 (0xa2)
> * Compex WLE3000H5
> * (maybe there is not a single one which works?)
> 
> If I would use these boards in one with a devicetree then I could just 
> overwrite it using qcom,board_id (and/or qcom,ath11k-calibration-variant). But 
> this isn't the case when I want to use a couple of these cards in a simple x86 
> system. All off them (even when they are significantly different) are reported
> as
> 
>     ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff

I've send my 6GHz modules back to 8devices. They told me that this problem was 
identified and fixed in their calibration process. I've just got them back 
from them and now I see following reported by ath11k:

    ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xa2 soc_id 0xffffffff

So it is definitely not a firmware problem and it should be fixed by the 
manufacturers (similar to what 8devices did).

Kind regards,
	Sven
--nextPart51415623.Rr01p1FT5n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmIPpIYACgkQXYcKB8Em
e0Y3fBAAuQr3703P5EnY3eqvK87sVsDGENw6Eo4Z868K6P2nIEPk/kXGqFzqK7WJ
1+Gk8dUOyqDTGUui70IPe628aC0Kb0wpneC6WOkA07axDk5xOumxN2ujnAYayAh7
8z8pOH7p0aBqVx4+4VUgkIPjwrzUIvYom52oiqs1ywT87/RljZjK1KXKKpvclhcd
oFlasapERTzhocGk4eefBxzEDSXKLM2YUSMVvKcwLmURevfVIHKHq5d0vpPqdXlG
qM+9tTtsfrMwzydDXZUQHJh/V7T9RwC83Cy0yJaJbOJq9J3KoyzSHzTTpz0ahFlj
gptstCPJLHfqZj2NO+9sudf2v7YlKLncoD0a08BontGDPF4IWbYBIHEnrQ/VkkLw
PTRPjNBSLQVPPl8Q+HYYkTEsih7NGz+dId8Et4zHb3FhC8xMtXixWg+wjwIJsJm8
aAa5Y1tQw4uWPGF8WFd3zxouqk66JgRVugZ0ZtFLV5nLXaX9d3Jh6pYbbwmJCLo+
mQQF82Ygva4zhVO4R6pvVLxeqt1+7cR45+FQgN4+Pj1PYxitU6/qfIbyAZ9EdlVQ
q8C2zJSh9kFvSx1AYxTGd7ve7NA2fMzykbk1j/5fmVsxQJXHCdRA9S7ulc9LjDwu
0O/QyiY5DnFLeMQRnXMhIw5KpYC2zXINr85Z7eCPRY2OFCpwrOo=
=Zr3J
-----END PGP SIGNATURE-----

--nextPart51415623.Rr01p1FT5n--





--===============7299729481095007414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============7299729481095007414==--




