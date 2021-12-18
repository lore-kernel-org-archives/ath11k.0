Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADABAC433F5
	for <ath11k@archiver.kernel.org>; Sat, 18 Dec 2021 08:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4w2CjIZ+R3m1lRBXXtM2W+1rXWvILVEGDRmKuSMud8=; b=FZcHiQXItPrFR65qGwq28j1Kek
	eIMiSsJPICJdCQhIuAK1cbvWEdF+ASkrX5fzg2MFgx1mTd2q5UWkVinrGIurdLtqwq9Jo07tG+Yj6
	9ppIvIR8eWDWZ3vQC87Q81ILKBAjPi77rFdRPgZvfUQhp4V0iNZTGztzMwnsP8v+BaEtsNA7qrSIh
	VKQUEJP5zZxdCM99ijqR9mGXQtVJ7nq58S3nRBvK+Bpk3F5qISrjYxUe4Xd2ojSiWnqu4Ub/gfRY5
	u4X2fibS4P4WYfiyQnh1ujVjMTbUamtTLbnTbRarPV9orut+uM3Ll27Pw8NHVAgz8NOCRYXTptnqw
	462ZS7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myVDP-00DGRA-0X; Sat, 18 Dec 2021 08:37:15 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myVDM-00DGPz-Bq
 for ath11k@lists.infradead.org; Sat, 18 Dec 2021 08:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1639816627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7XGIosFYTDWGNz4+uFjHL6ROYC57PsHCdGUmmDVimiA=;
 b=2UpmT8HHh/ITqa7HrXJYhk20MsxFlLxfYmnYhHtZ+VJbuuu0xScqoUlixa3ziz5Pp8c33D
 USNWtrBKmIKLX/lItH76SuoAz/s1gPjzxPx/YgfAsUruv583EWU4i/kbO6cKSq2wZhATMs
 o6+6fwjN543I3FGkpxC+ak1xhggj0Ms=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 quic_cjhuang@quicinc.com, Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
Date: Sat, 18 Dec 2021 09:37:02 +0100
Message-ID: <2102838.219ycuhFCz@sven-l14>
In-Reply-To: <4f28496abae7743ab2a9fa7150c5d64c@codeaurora.org>
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <87lf0tydad.fsf@codeaurora.org>
 <4f28496abae7743ab2a9fa7150c5d64c@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_003712_754898_7EDC4828 
X-CRM114-Status: UNSURE (   9.98  )
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
Content-Type: multipart/mixed; boundary="===============6348781015972546672=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============6348781015972546672==
Content-Type: multipart/signed; boundary="nextPart1939230.MS5jTM4reW"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1939230.MS5jTM4reW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, quic_cjhuang@quicinc.com, Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
Date: Sat, 18 Dec 2021 09:37:02 +0100
Message-ID: <2102838.219ycuhFCz@sven-l14>
In-Reply-To: <4f28496abae7743ab2a9fa7150c5d64c@codeaurora.org>
References: <20211011193750.4891-1-cjhuang@codeaurora.org> <87lf0tydad.fsf@codeaurora.org> <4f28496abae7743ab2a9fa7150c5d64c@codeaurora.org>

> On Thursday, 9 December 2021 17:05:14 CET Kalle Valo wrote:
>> Isn't ath11k WMI commands and events supposed to be in CPU
>> endian and the firmware automatically translates them if CPU is little
>> or big endian? 
[...]
On Friday, 17 December 2021 12:04:45 CET Carl Huang wrote:
> Both cpu and firmware are supposed to be little endian in ath11k.

I hope this statement is incorrect. But if it isn't:

You cannot limit a non-architecture dependent driver to be only used by little 
endian CPUs. This would be grave bug in ath11k.

If your firmware requires wmi messages and similar things in little endian 
then you have to mark types correctly as big/little endian. E.g. __le32 
instead of u32. And then you have to convert everything manually with 
cpu_to_le32 and so on. See the ath10k code for examples.

Tools like sparse can assist you in your search for problematic places when 
your kernel has the __CHECK_ENDIAN__ related code activated. This is the 
default for kernels >= 4.10.


If Kalle' statement is true that the firmware takes care of endianness 
translation of WMI messages to host endianness, then your code would still be 
questionable:

>> +       /* supplicant expects big-endian replay counter */
>> +       replay_ctr = cpu_to_be64(le64_to_cpup((__le64 
>> *)ev->replay_counter));

Why isn't the firmware taking care of the conversion at that place?

Why are you defining it as `u8 replay_counter[GTK_REPLAY_COUNTER_BYTES];` in 
the struct instead of using `__le64 replay_counter;`?

What ensures that this is value is 64 bit aligned in memory? Wouldn't it be 
more correct to (see above) use

    replay_ctr = cpu_to_be64(get_unaligned_le64(ev->replay_counter));

Kind regards,
	Sven
--nextPart1939230.MS5jTM4reW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmG9na4ACgkQXYcKB8Em
e0aCNhAAhHy4Q89qTeLnxf2M2B4EsogXkCDmByJKzD2zh2RKOZGR4Cr83zZZQLrt
Ugf6tUgjPJHku22jnulsJQEYgghpYDdko0ajh8dFtW9GHsikQwM2KuE55XkM1I/Y
FF7hauJdsSQNpXbLZZxTtnf4NI3xLSU5tVKr+qMvgG6e64IJ1TOfsM0n+0X0YHkW
qnL89QqjpOodEwChsg8aOBEJnrIWcBgZKFSS8lMn3wmbt2uMIx3YkgLkxmcNQCF6
mBopA9rLU5De87ouxvmOt2r81CHeqFFzJ1IBE28toCHf3BprCxEF08yFkFJLszTx
6wlbSVtq5ba9cHI0Hg8j2fydVIixf2AxOSdqKo3WuYvsuSjwsbJVE/zsclt3DGQE
STpAoQUCZ+tHcVA3pM209uvyz2LQ2Bt3+8hxF404BmAbGVuc1lPyg0JXyOLFCdqJ
KEvRn2qVa2j5qp5xw0KRnxEVAgl+sW25dbZ1Y/isCa3y0uSRTKhq5D6Avlq9hyEd
8rgqzeAZ+4yzUgCbO8Oa3vTiMnDE0edi53xBzlxmfRgz9V1000evT7YpvwK88L1Q
HdFGXwkTj2DYY8MAfhKzyPOJTEMSSv9Lkv1JLC22CC+hrHGfotSnTQY1dgWyAsh/
Cw6cyqt6Zb8YJfD2FPjnkU9JJJfiL7P9r9dqAUlC8F82a8hCfAY=
=DiwO
-----END PGP SIGNATURE-----

--nextPart1939230.MS5jTM4reW--





--===============6348781015972546672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============6348781015972546672==--




