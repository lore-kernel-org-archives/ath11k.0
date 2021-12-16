Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABCDC433F5
	for <ath11k@archiver.kernel.org>; Thu, 16 Dec 2021 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OdX/JAIblaPvTbroUt6bg+VWZPJ8RuXrC3PS7TTsmo=; b=1EFPff18/J44OCV3PfP/B5Ilv+
	/oHHAKVaOForinDi/RFj54zP/wFwC3ri38KFqN/xEAEYJsavUCuvt7pdUoMIW8Hq+pMNRbKDlfGoY
	KELYNSzajnuFJAIyJSGGNjdScTJrKMvUz0QcKNEH2OQYmg0p6q7Coocr1A0UJTuqSlVB0vWLLWaQs
	1PGv1Zlm46h4g3wtHh9FXubfVJEcEOzqOQ9vbNd1XyrFA56swRdqu8zQM6wRi/rYBvQjc9dPaUDaJ
	y0nON3hjdb6s2Mw8lxEMu6zosa4nLV9hHVmcrEBM9Ew2qp0ZFqiPY9q6wam540Dg7Xrc2Rsnq5Mzi
	NkcqIMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxmK2-0049md-QI; Thu, 16 Dec 2021 08:41:06 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmJz-0049lB-UU
 for ath11k@lists.infradead.org; Thu, 16 Dec 2021 08:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1639644058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6vs20MnepFtSPl1RSpSsE7JY07peaGTObHLv+WtfGwI=;
 b=oNtVKtI4OzNmHuYw8MptnLmIiEYXJoskenu2RqQEXM4IuzwXySlCRGWpLt3DW6f+6SLay6
 4cWqNhSOe3FyKgS3lQu1kduq7NJ4ImsYCIr69QeXSxcgxdl+3JeFua8S+SAzTtawcctNge
 LWIiQu7iRE0gtGbalsA93ZvhtCsIXpc=
From: Sven Eckelmann <sven@narfation.org>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "Seevalamuthu M (QUIC)" <quic_seevalam@quicinc.com>
Cc: sw@simonwunderlich.de, Jan Fuchs <jf@simonwunderlich.de>
Subject: Re: ath11k: incorrect board_id retrieval
Date: Thu, 16 Dec 2021 09:40:53 +0100
Message-ID: <273277150.CoJFBkXrIx@ripper>
In-Reply-To: <DM8PR02MB81992A2920F672C9200B083DF6769@DM8PR02MB8199.namprd02.prod.outlook.com>
References: <1734146.k9CKHTOI9D@ripper>
 <DM8PR02MB81992A2920F672C9200B083DF6769@DM8PR02MB8199.namprd02.prod.outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_004104_347516_58CD431D 
X-CRM114-Status: UNSURE (   6.20  )
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
Content-Type: multipart/mixed; boundary="===============3056192340995202922=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============3056192340995202922==
Content-Type: multipart/signed; boundary="nextPart3638716.7EeSZosgaQ"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3638716.7EeSZosgaQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, "Seevalamuthu M (QUIC)" <quic_seevalam@quicinc.com>
Cc: sw@simonwunderlich.de, Jan Fuchs <jf@simonwunderlich.de>
Subject: Re: ath11k: incorrect board_id retrieval
Date: Thu, 16 Dec 2021 09:40:53 +0100
Message-ID: <273277150.CoJFBkXrIx@ripper>
In-Reply-To: <DM8PR02MB81992A2920F672C9200B083DF6769@DM8PR02MB8199.namprd02.prod.outlook.com>
References: <1734146.k9CKHTOI9D@ripper> <DM8PR02MB81992A2920F672C9200B083DF6769@DM8PR02MB8199.namprd02.prod.outlook.com>

On Wednesday, 15 December 2021 18:42:13 CET Seevalamuthu M (QUIC) wrote:
> [seevalam] : Incase of QCN9074 in x86 setup, need to program OTP with board_id. Please fuse board id in OTP and try.

Thank you for the confirmation. So it seems like 8devices and Compex aren't 
correctly setting the OTP for board_id retrieval when 
they manufacture the card. Which basically breaks the retrieval of the
correct BDF (especially when having cards with different board_ids in the 
device).

I am now just guessing that it is the same for WCN6855 v2.0 - which would mean 
that EmWicon/jjPlus are also not correctly initializing the OTP.

Kind regards,
	Sven
--nextPart3638716.7EeSZosgaQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmG6+5UACgkQXYcKB8Em
e0aSVQ//Y72SJkA88w22W2STujIpmjC/hFNwtrNCTbZJFFHwAimUezj6DNf6Sjew
lpwtVgBTLSxDK2YOMMvhrmcOtxnFyk/Tp9Q5qgand1gw6c5iD1JqlvPmRySAcKu6
WQKKv9ytgp9Giy6mxsSGyGtWnatBwUQ5ejUocwMkOu7ZhTKWJ1dGAWmrmigbUtvW
fIv+Ci/7pCXc7r0Er6Qj8TGjigYNZ2saqrfZeFYjnN25QZqmIDb51ZhPTrgjCofc
pWMpg2t/gYOy2KbavJC4e8NavK+d+XKOIY9GG/wYWNToIY5zHdCZR/sTDIdxeb/s
GCWqoCNTsd3TDrphv5m3/7fz0CG+u3/WAFCWYM1QSZtb9OvlMN2GKRuyqPnyBpc8
8eKvyjBK/FAVhtl+muVQiTFNGWv3v6h9K+2vuhbpt4/nL0aPhKKicifFoMZVdq8y
HbKzPcScXExfhRm8MXGKW213bIOJbaJp9sweD2HxRUrgfGlkeG40hpfCxcRmGmuq
gKBkGkNQx+4pklUFN2nHTWj/hrlzQus2qeAiBjdR/IQrSk0k/+VOhG71Ea59ISfl
lC1DlQbeNHnV+cIi2t9JmjKCEFMyeVpXTKL3q0U9XIN2oX5jVGhB1AiSdfc798Mz
9PEm0zF4Et1fna19s2AZ225ATu9yxwBdUcqS3khfus8Y5tmbf8I=
=tt+Y
-----END PGP SIGNATURE-----

--nextPart3638716.7EeSZosgaQ--





--===============3056192340995202922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============3056192340995202922==--




