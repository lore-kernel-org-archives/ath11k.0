Return-Path: <SRS0=748x=PQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53588C433EF
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 13:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F40D660FC4
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 13:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F40D660FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B87G2QaH+z0f9maDl5Qovqc2MwPCRQ7ZSLg/1wFyyqo=; b=dS5o3C9uFGNb3pEn1fvi3JnWg3
	pg/mzbKkbvp/6D2J1DBdv5cnXQCMBdzjOx579Jw4yjWzX2LCKeAFB9rDDqmjKt0tJg12oasPYQN6c
	SdD1QHon9acl6hdUq1Gg9MdTchsI8FgnPwDZY3/k2/T9cr5VN5j2lDJlMbQBAI4+3IGS3brZcz0XF
	fp9vfOcSgehKYMbOqEod85GX7lqIBOokqhP8kdhE1FlWYH1BYp7zaF3EwIw3pqmsCMTQVsJX4VEzB
	LtKXZhiDurSNx/zYnV5LYttVLXMTRevftRy9Pg+XybzSYQBk2eA9rS7zYUII5ZpcLQd7VuOjFzCy1
	TWQZKZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg5LA-007ugM-Ia; Thu, 28 Oct 2021 13:21:08 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4kd-007o8o-UO
 for ath11k@lists.infradead.org; Thu, 28 Oct 2021 12:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1635424999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QoC3OLStbdQmvaOCAZZzBXCDyQBKZIDqUoI7nwVlY8I=;
 b=zRm2ZI6QBNV6gGXFufelafWy8ObcMPbfARLivD/K8NdPZ5z8pHTNifc9+WErcZ6X/R3PVl
 W9grdB0IpcoUzFmB1jNJXXfpF9jmdXypizFYI4LB7NHIcYLNmT/abruzmYxm3nzBA858ft
 zJimoW54ApW1DH9unUJFiY/affwVMD4=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: Re: [PATCH] ath11k: clear the keys properly when DISABLE_KEY
Date: Thu, 28 Oct 2021 14:43:16 +0200
Message-ID: <4399157.2QDAq5Xuus@ripper>
In-Reply-To: <87sfwl494s.fsf@codeaurora.org>
References: <20211026155446.457935-1-sven@narfation.org>
 <26869605.A2Tbvc0WiF@ripper> <87sfwl494s.fsf@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_054324_189268_2B06CB2F 
X-CRM114-Status: GOOD (  15.10  )
X-Mailman-Approved-At: Thu, 28 Oct 2021 06:21:07 -0700
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
Content-Type: multipart/mixed; boundary="===============8540076497450653726=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============8540076497450653726==
Content-Type: multipart/signed; boundary="nextPart3426232.laXtC95Ive"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3426232.laXtC95Ive
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: Re: [PATCH] ath11k: clear the keys properly when DISABLE_KEY
Date: Thu, 28 Oct 2021 14:43:16 +0200
Message-ID: <4399157.2QDAq5Xuus@ripper>
In-Reply-To: <87sfwl494s.fsf@codeaurora.org>
References: <20211026155446.457935-1-sven@narfation.org> <26869605.A2Tbvc0WiF@ripper> <87sfwl494s.fsf@codeaurora.org>

On Thursday, 28 October 2021 14:38:27 CEST Kalle Valo wrote:
[...]
> But it doesn't either break anything either, right? So in that respect I
> would like to keep the Tested-on tag in the commit log to document how
> it was tested.
> 
> Though I'm not sure what I do now, do you think I should the patch still
> or should I drop it?

It seems like QCA wanted to have a look again at the problem. So I would 
suggest to drop it or mark it as "Changes Requested".

I cannot make any statements about whether it actually clears anything 
in the firmware because I neither have documentation nor source code of 
it. So only persons which have more knowledge about it can work on this 
problem.

Kind regards,
	Sven
--nextPart3426232.laXtC95Ive
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmF6muQACgkQXYcKB8Em
e0Ybjg//UfH7a6x1M+B5p+UecsGikje4Z3pmYm6nbdZbseYEhgYra7DAdgi3wAZy
v2EW914tFvNo2v1aW9ALhAEJG0sDBnPmmlp3RBvtyVd4y55NNtXlWeX/6eTjyRty
K43725qiOa5EA4pTF4WINwzzZuUqQIx+XplPm9MI5PL7bW9hxR0FP3xMP/F4rtUQ
cjlGL8XeD4NiugM48Y8BENgPFOLWwEsMtd+UbUyKxuOAXEHNO2dunQ9OqMdyMiLf
U+KTTiTq65sS38KlrwOrPQD+Wnqlozd+TXYab1oIhpriYzabLoQMxMst4ak1sXaY
2Pga+m95mAuxjX1qct3LlgpiZb3ei5DYEMki2BeSTTSZQ/dgL3CgfUbVuMhLoRXb
99+Rw7G9+zLxXP+zPk4gRArGkRPFv/N15IYaOHNG/U2QYdokH1q7u62anbkmHfBt
y7eheiGdP+NHvP4i7Mf2jmVNkMit2V7m7nMoPBq4vJOaJHbVk8e//1cLpN/6EUo8
l+Q6NFL0uhusJhNJgejdqwQSXasqJSkjUaG+9/rE0ZzbQBkNwSEZL+7Siow+3mdy
yirVqmCReuLmG4cIrSJb5baYU5IIt0q32zYoju2wdt0xIUQpgMiDcx0Grg8QzueX
C7lAgXuYeqra72CVwUPLDs/krNg/LhFYdH6lUFU4Mukn9sXzuFI=
=F+Gz
-----END PGP SIGNATURE-----

--nextPart3426232.laXtC95Ive--





--===============8540076497450653726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============8540076497450653726==--




