Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65527C433F5
	for <ath11k@archiver.kernel.org>; Sat, 18 Dec 2021 09:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BgNnjaU7GVaqJvB2PFHlt6D9fFCHTHPOhrI6YLAG0U=; b=aj9WoCVIwm1mhAF9h49xl2ggBB
	UfSXiiNKSAfpzL/X5TMGH/ORknfPEFQW2t1vWWEHYnA3ww1lFqpZYHt2YgpQCCpDydtKhUWtAZ595
	roleDDKJ9nKu9vZI+5DSIeRLRBCwyhcFvl04Y1UMXbw05z7umIBpZIKeMtgd1PszOkdaQTIbguWvz
	ZW4LAMQ/o5hm5CoTpcA79fRbrYTs30HtQncKHpuAmmcJlmm+5BPkkmSLSCpkbY0IvnN4wVsbAGTxm
	TZ15RvjvfdfVYzfnDdQaOXwzJpmWCk7F/VVS7XOPNoQz1zcs8Q+RuXcI88IGr1njtsw8VdJPf/48H
	7hGlp3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myVpy-00DMvx-Q1; Sat, 18 Dec 2021 09:17:06 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myVpw-00DMv6-ED
 for ath11k@lists.infradead.org; Sat, 18 Dec 2021 09:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1639819022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SF02bACsOlKBBTjhK78ueYmpKRKGRba4v5mKU006x8g=;
 b=GmGIbvW/gFj4ogrSfpdY8TLE4kVLY4FA0Zn6lTelRqDCgp+T9SLy80rVnztPLKwpEMrVb7
 gZdSMJGZhVgxVI9851zzj+6R8dP79B0J0ZUNcrR2kEEcncmSWJm9+0UvZXpUdgMaJq5cgm
 JcpeKtXGcrULF5u7kc8Z2f8szVBY7A0=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 quic_cjhuang@quicinc.com, Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
Date: Sat, 18 Dec 2021 10:16:59 +0100
Message-ID: <2127318.8OWqheGOAS@sven-l14>
In-Reply-To: <2102838.219ycuhFCz@sven-l14>
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <4f28496abae7743ab2a9fa7150c5d64c@codeaurora.org>
 <2102838.219ycuhFCz@sven-l14>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_011704_665148_7A00DC16 
X-CRM114-Status: GOOD (  10.95  )
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
Content-Type: multipart/mixed; boundary="===============4189980468187583173=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============4189980468187583173==
Content-Type: multipart/signed; boundary="nextPart2472807.WDt2SMqAfp"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2472807.WDt2SMqAfp
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, quic_cjhuang@quicinc.com, Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
Date: Sat, 18 Dec 2021 10:16:59 +0100
Message-ID: <2127318.8OWqheGOAS@sven-l14>
In-Reply-To: <2102838.219ycuhFCz@sven-l14>
References: <20211011193750.4891-1-cjhuang@codeaurora.org> <4f28496abae7743ab2a9fa7150c5d64c@codeaurora.org> <2102838.219ycuhFCz@sven-l14>

On Saturday, 18 December 2021 09:37:02 CET Sven Eckelmann wrote:
> Why are you defining it as `u8 replay_counter[GTK_REPLAY_COUNTER_BYTES];` in 
> the struct instead of using `__le64 replay_counter;`?
> 
> What ensures that this is value is 64 bit aligned in memory? Wouldn't it be 
> more correct to (see above) use
> 
>     replay_ctr = cpu_to_be64(get_unaligned_le64(ev->replay_counter));
> 

Sorry for the noise, but the part of not knowing in which endianness the 
firmware return multi-byte values is freaking me out. The above statements 
assume that it is returning everything as little endian.

If it is actually returns in host byte order (no idea how the firmware 
determines this) then of course, the questions should be:

* Why are you defining it as `u8 replay_counter[GTK_REPLAY_COUNTER_BYTES];` in 
  the struct instead of using `u64 replay_counter;`?

* What ensures that this is value is 64 bit aligned in memory? Wouldn't it be 
  more correct (assuming it is a u64) to use

    replay_ctr = cpu_to_be64(get_unaligned64(ev->replay_counter));


Kind regards,
	Sven
--nextPart2472807.WDt2SMqAfp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmG9pwwACgkQXYcKB8Em
e0auIQ/8CkFgbaoLmhL9m6AtlCC1vVLG84dopRi73TAhkmFO4ZZPHJ718cmcYiUh
npz6aU7O5uZLaHtGYgZbXFyl6/K6Z9PIGPOmUqTuQSnv1GnMuMI5R92iBaaRmDvY
vVShMx/0HQHB3PnIzBt7RMdqBXbVYU4Cl1/0Y6voPqHuFML4uTg7x0YhLE2BfPmc
+ygNN7h286Y1REqh4oKHXQLwL70dWK0l4gV4ZlCAe0qWIE4S4FnDlbU9c0poIpKv
CGlUjcV7JHfr3zTgLgvNIYR1pga9i2pv2gCNdKEplY3lZ7Nj92Zq87xBZbqhBIyR
FXbnELW45L7AJhOy03/q4sgYYwSDBHjHxLcB0P/nYy5aSQnBXCNXYKwC+atIODIK
3/ktur5QCB568YuH0KFlxnD5xFf9EOcZfwQEbgGaS3IpgFKJjvD9u7IeGzZs63Fs
sCEwRnpsboLGbGOzZfvTz6TxFQur8vy+eij7TVBdKfv2Fb1phHNNfnWEzMICHIMl
ZuxNN5kiiYnMjFdKqm/CXCX0Lau00vHpecSyib3VyUphcf2sbRR7Xp8HmnTEov26
APE4H9sNKi1zPe3x/rD6sl23YMk1ib8rBcnDsWkxxVASsja9lA7H9uGDlzOf2HUP
agxXtp2WCYeQcXiQsj110rupSWY0pJ1dyYzx7SUST09lTHu/1wk=
=QbwG
-----END PGP SIGNATURE-----

--nextPart2472807.WDt2SMqAfp--





--===============4189980468187583173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============4189980468187583173==--




