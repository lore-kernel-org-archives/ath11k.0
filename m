Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768CEC433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FawskBVodiTrxqWxaZ+iztYqjaokARFkbkbygVLFQ+Q=; b=QzfL0RoaIaSgMhLbnAlSJ4eyLA
	dCMPIVHevi8m3gKyX9gofiEOzvWRiNDwYkFpu/jLbxa/0gZWec+fsMSupZI4GmknPz5eM3AWcmQGW
	gHPImtgUK3Ig+OjGt100Rp+p+rXp4KIXysvaUsGbQ7sRTbCgYQ5gOLvnmQvbd0SWu10nPCOhYkbPQ
	q7u22FKNJvxMYzwLqY4pHTkuFJAatb+6rjvQM0xIkObJow0dsxuniDyNdGDJUtJ47NH2IuQG1pPnJ
	dy1xks9oNTssyeW3c1ksXR6VCs+fDBiE0hqgpDWVyicDDzgTpXG4W0i4WUyUkafAoKCmvu4ghaSjc
	LgbwsKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mut0l-00BpqY-18; Wed, 08 Dec 2021 09:13:15 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mut0i-00Bpq4-EN
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 09:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1638954786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0njKFutL1mNnPmBb/c5W3lzOUqpWwin7MxzB9u0Mo4=;
 b=11pFjxvB/S54mDbTxMZoK7IyGKWIESWX+sWs9W7oZCc8b0E5sUql+/KV+vtI66FFY9UPPm
 6jU5zu+/WV6xskbK+l3ymNeETehWB7VE/2bSJKvl46YQI/B/T9w7nVrC8ZbMtMlBhuL1XM
 NTkHnY4ICRd2zUF02pew1Hbxcxsfyi4=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <quic_wgong@quicinc.com>
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for
 WCN6855
Date: Wed, 08 Dec 2021 10:12:59 +0100
Message-ID: <2239044.ZpX2dJDJjJ@ripper>
In-Reply-To: <463b4075-e98f-d51a-d305-a7adadc8a585@quicinc.com>
References: <20211129101309.2931-1-quic_wgong@quicinc.com>
 <163895135713.29041.4980786229647025244.kvalo@kernel.org>
 <463b4075-e98f-d51a-d305-a7adadc8a585@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_011312_664677_D0AE9046 
X-CRM114-Status: UNSURE (   8.37  )
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
Content-Type: multipart/mixed; boundary="===============7987460341302166147=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============7987460341302166147==
Content-Type: multipart/signed; boundary="nextPart3702762.AusovfAdrM"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3702762.AusovfAdrM
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for WCN6855
Date: Wed, 08 Dec 2021 10:12:59 +0100
Message-ID: <2239044.ZpX2dJDJjJ@ripper>
In-Reply-To: <463b4075-e98f-d51a-d305-a7adadc8a585@quicinc.com>
References: <20211129101309.2931-1-quic_wgong@quicinc.com> <163895135713.29041.4980786229647025244.kvalo@kernel.org> <463b4075-e98f-d51a-d305-a7adadc8a585@quicinc.com>

On Wednesday, 8 December 2021 09:19:28 CET Wen Gong wrote:
> On 12/8/2021 4:16 PM, Kalle Valo wrote:
> > Wen Gong <quic_wgong@quicinc.com> wrote:
> ...
> > Sven, after your memory corruption fix is this good to take?
> 
> After Sven's fix "ath11k: Fix buffer overflow when scanning with 
> extraie", it will not happen kernel crash.
> 
> But it need Sven's confirm.

Correct, it is not causing any problems anymore when the other fix was applied 
before this change.

Tested-by: Sven Eckelmann <sven@narfation.org>

Kind regards,
	Sven
--nextPart3702762.AusovfAdrM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmGwdxwACgkQXYcKB8Em
e0YiDhAAxzkugENCxrewJCQBwH31n1fvJArR1vppfDspDwd04c/ag9YHYpsklBaA
9EAXyiEstysVer85Arvulolk881OFUf3yd7LY2tSYswmTMdyYEHUt7K+FsnuduVp
ddEb6POPaZZzK0eB86gR4WyorN14i8MPmZdb/swM2foI7h9TbCzcmjpvnSGIXAbH
jWpbq6GC4yhc2uJSH2zyiDjhOw+9pFP2G++RumWEnenqgFmrNsDrYBncNfmn/Tnh
nVNLhmo8XotWrsAUdwri2Me8Ch7+lCawHFCr4NY48juvKCY2ZbxjRGvGTMHiAo+e
flBEhHokiabT6HZoIIAKvlnnIt2JHTg2XfBYf/h4sHiWnr/4Ow4SF/xfSia3UHyM
LF/6KzIaMF6RbbsFRjy0GTBLFSruth0glp2yoFaHN4S3pLI9EraJJMcgLf9M1zFm
PE2dJlnfUyGoCnh9t2z/Adh51PnJI6RRo8IFtauGqkaZkReYr58KB7WwCYM8Qle3
0GTkl0MbS8La71l7O1Aad8NaM3qsNZNwAbCg2uhedeIrgZchZfq9WFZeXOcNncFs
dzUTRGk9Znv12piiA/hv0qNxEadOOVyOR4SVipfhbypL+Ut1jODY5FdZOB4Tx5Ac
Eev6DA2urQlSbk3Z/DOcbVEfM5cq3oCIiy/rqK1AEweMY/XPmL0=
=RIgu
-----END PGP SIGNATURE-----

--nextPart3702762.AusovfAdrM--





--===============7987460341302166147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============7987460341302166147==--




