Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A658C433F5
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:41:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51EF3613B1
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51EF3613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egLTY84zS3eCEkbrmarD0ditu8THo9uCr7kLMuWQP/M=; b=WuoaN+rHKAYTlMjTepYSl4hjLP
	MGVNr7kVrU9hEeHi+o6upT9bl91/2ztK4340fQ20a8xpOrj1fufxb2usSR+etv9Hhao51y/WBZLHc
	mq2tvAew+lcRSk4XrLHhZDP2uwxDv1Sv2ZFRp9S0NXzal5Jbd1YafRwqAz65JmLWWv5xEzp1gTvyu
	3AEFCToNN6dChAEM8+sUJJnwvmicYw0I3Em+OkWbEexWMO6Jy0mUWHTNGB+mAH9Q7a/yyxd4hh39X
	+yuHQASTko36pLyUqtt7X2C6IsGRx9awBlHrq3o5205bDA/QCttaqY7dQ7nhY5165Wpm0IR4/e6uW
	1XkFbJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mndvO-007Mb3-SF; Thu, 18 Nov 2021 09:41:46 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGaG-0040HH-KH
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 08:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1637138779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iuXwVFGg3YCBDP5Ljt+fN+IuTJFfYGidqYCQ28UJkMI=;
 b=SjOfvxAsD0LBx0uQdbTga4tT6i0tdDeoNHhK7u0DXneeTQaDb76bDTVZ1VSlFkhai1YNvX
 +EN4wlcRW/DdFvJwlqLtIyH3xA3HTQo2yJrzRFZTwKW8SsVm7kgJaXSkeFOJewiz3uYAAV
 yPa8S+ZxCPRRty+suS758rG0iMPXCyc=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>,
 linux-wireless@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 3/4] ath11k: add support for device recovery for QCA6390
Date: Wed, 17 Nov 2021 09:46:08 +0100
Message-ID: <2357945.8AGfkZV0UB@sven-desktop>
In-Reply-To: <87mtm3dwu0.fsf@codeaurora.org>
References: <20211116041522.23529-1-quic_wgong@quicinc.com>
 <1752085.FWK5zBq28I@ripper> <87mtm3dwu0.fsf@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_004625_012841_92938E5D 
X-CRM114-Status: GOOD (  13.51  )
X-Mailman-Approved-At: Thu, 18 Nov 2021 01:41:46 -0800
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
Content-Type: multipart/mixed; boundary="===============2521584702334667147=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============2521584702334667147==
Content-Type: multipart/signed; boundary="nextPart1845216.Og6EX3yCZx"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1845216.Og6EX3yCZx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 3/4] ath11k: add support for device recovery for QCA6390
Date: Wed, 17 Nov 2021 09:46:08 +0100
Message-ID: <2357945.8AGfkZV0UB@sven-desktop>
In-Reply-To: <87mtm3dwu0.fsf@codeaurora.org>
References: <20211116041522.23529-1-quic_wgong@quicinc.com> <1752085.FWK5zBq28I@ripper> <87mtm3dwu0.fsf@codeaurora.org>

On Wednesday, 17 November 2021 09:12:55 CET Kalle Valo wrote:
> > https://www.kernel.org/doc/html/v5.15/process/coding-style.html#using-bool
[...]
> 
> Yeah, I have been worried about this as well and we should fix this. But
> instead of u8 I would prefer to use bool like mt76 uses:
[...]
> I didn't even know using bool is legal until I saw it in mt76.

Interesting, I was also not aware of it. And it also seems to have some 
interesting implications when assigning values to it (example 4):

    #include <stdbool.h>
    #include <stdint.h>
    #include <stdio.h>
    
    struct test {
    	uint8_t u:1;
    	uint8_t u2:1;
    	bool b:1;
    	bool b2:1;
    };
    
    int main(void)
    {
    	struct test x;
    
    	x.u = false;
    	x.b = false;
    	printf("u %u b %u\n", x.u, x.b);
    
    	x.u = true;
    	x.b = true;
    	printf("u %u b %u\n", x.u, x.b);
    
    	x.u = 0;
    	x.b = 0;
    	printf("u %u b %u\n", x.u, x.b);
    
    	x.u = 8;
    	x.b = 8;
    	printf("u %u b %u\n", x.u, x.b);
    
    	return 0;
    }


Result:

    u 0 b 0
    u 1 b 1
    u 0 b 0
    u 0 b 1


The last example is basically the reason we see stuff like

    boolean_like_value = !!(some_retrieved_value);

when using unsigned bitfields instead of bool (bitfields).


And the memory layout (on x86-64):

    $ pahole test.o                                    
    struct test {
            uint8_t                    u:1;                  /*     0: 0  1 */
            uint8_t                    u2:1;                 /*     0: 1  1 */
            _Bool                      b:1;                  /*     0: 2  1 */
            _Bool                      b2:1;                 /*     0: 3  1 */
    
            /* size: 1, cachelines: 1, members: 4 */
            /* bit_padding: 4 bits */
            /* last cacheline: 1 bytes */
    };


To my surprise, it was already mentioned in one of the discussions [1].
Was there anything in the discussion which I might have missed and 
is a good reason to not use "bool ...:1" in structs?

Kind regards,
	Sven

[1] https://lore.kernel.org/all/CA+55aFwVZk1OfB9T2v014PTAKFhtVan_Zj2dOjnCy3x6E4UJfA@mail.gmail.com/T/#u
--nextPart1845216.Og6EX3yCZx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmGUwVAACgkQXYcKB8Em
e0b6JBAA0zifY/YwpDdxoScQKo9J5bG4vN1SEnMchgKICaNa7P1e97sJ1ogkhj+8
pq+5krHbE35vopH96mFTvQ0JZVze3m8kom0TXSnN+erwjzV/JrO8vF4qg6Wac2c3
U5ySpWWS8/a2ziipcB5YrLEJzjNzxpJb20hKxE5juJ1gwhmay97wsVFzbnFX403v
ceDIN+fmcRtUg3LGpVXsUQIjIKHb6T/21ud5Cjv6rx/1SsUUrRRvokKWJuvU5JKD
MYbzS2xnleofgJKCjk1/LM4V9F3s0qR7sQYxGr2jlA6MebMer4E8iY2sXuSULdRt
1YbSd0TN535hMprBCmj/lhmWiC0OIwbw1zagjWAbFdB9sksF9eEka6nbXoTzH9w9
q1CLX8uhBgChYXhT5CSAHiv4KtlfrjqAsYsPbuYALMo9G+Pqwtnf0WArWeloPbPu
4ll2X5jOptPpKIPvHvI+FWY/XNJG1DYFQKsXMs2s8A7iSidaKcPj62sLLql4tMsr
zt5ZyQa4gLvI0A4mUQ5uoXgz5AfspFfNPQqsybjs/0/H/B+HIUAfsD+B7Gi/LSlj
SKyYs4ChOowKTR/aYvZZ9RDXOvW0lLS6Ma7hZEAH2cRwZKR+Uc6x86n453wiTB1y
z4Dq/G+v1SiwRNRPbOSE2tyT2gqPEPlAXghdT4rUcyoGiaxXFqc=
=Gdz9
-----END PGP SIGNATURE-----

--nextPart1845216.Og6EX3yCZx--





--===============2521584702334667147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2521584702334667147==--




