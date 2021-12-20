Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA959C433FE
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 11:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OU096FfuJIejWkTMYzN8fTowQCYtNoQoVZc/YIWpSA=; b=lTFHQgo6Nk5wBxa0WmU+Xe11o2
	Z0jHUpWBhIa2fRhS/7KJwTyVJAMDUu2o7U6mw2eu2xhteDZc1gSYje8ukTVG1G7X570kF3Xhmxax1
	m/YofQwni/FvXZlsRslpcknAr+dAtkvm4/z6Ap3uhQcO/BknBGnHH8EMUcxBsAnxMwRaNcKnMF6Nc
	hF4KNC7r9G4puYxO1BiF7ewbz1aNw8hsf+qSvZ+ewNStcvsUvFi4EArO870DLtaPwIGJs/V9NlIHA
	9iEcZuI/jbEqIL0/ZkEu4dQ5dHAF220l1ZZfTIo4USXEdgbtLra7bXYlmkXqCnP2t/AS07F9kVPaW
	fdrj9nzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzHCC-0026SG-8k; Mon, 20 Dec 2021 11:51:12 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzHC8-0026Qs-L4
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 11:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1640001061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GA8JQx/SRdXWNyvRJZI6IgUTJdC3q/GraShMOvVmfQ4=;
 b=ZRQSKezfVOiLgW7MUCRZZmZohakFTPrZonMte0j0tV4ixtpxbP2Yd9D4cFyBRRbMlFpS6J
 0zkOBG+/IXt/X0GJW1oFvTVaYBzfwib59FPEZjXbUqVyPPWpACHdjMi+z+fPhcqG3/kS6K
 he7fiFu5k9iej7lRUfMb6Nyc0xQrDcw=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 quic_cjhuang@quicinc.com, Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
Date: Mon, 20 Dec 2021 12:50:55 +0100
Message-ID: <1934542.dmet8VCoWv@sven-l14>
In-Reply-To: <871r27bnkz.fsf@codeaurora.org>
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <2102838.219ycuhFCz@sven-l14> <871r27bnkz.fsf@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_035109_043538_C475B122 
X-CRM114-Status: GOOD (  23.78  )
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
Content-Type: multipart/mixed; boundary="===============3468954286114824349=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============3468954286114824349==
Content-Type: multipart/signed; boundary="nextPart3309310.PNGyNpqY9y"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3309310.PNGyNpqY9y
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, quic_cjhuang@quicinc.com, Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
Date: Mon, 20 Dec 2021 12:50:55 +0100
Message-ID: <1934542.dmet8VCoWv@sven-l14>
In-Reply-To: <871r27bnkz.fsf@codeaurora.org>
References: <20211011193750.4891-1-cjhuang@codeaurora.org> <2102838.219ycuhFCz@sven-l14> <871r27bnkz.fsf@codeaurora.org>

On Monday, 20 December 2021 11:03:08 CET Kalle Valo wrote:
[...]

Thanks for all the explanation and pointers. I will try to use this to more 
clearly formulate my concern.

If I understood it correctly then ev->replay_counter is:

* __le64 on little endian systems
* __be64 on big endian systems

Or in short: it is just an u64.

> Yeah, if the host does the conversion we would use __le64. But at the
> moment the firmware does the conversion so I think we should use
> ath11k_ce_byte_swap():
> 
> /* For Big Endian Host, Copy Engine byte_swap is enabled
>  * When Copy Engine does byte_swap, need to byte swap again for the
>  * Host to get/put buffer content in the correct byte order
>  */
> void ath11k_ce_byte_swap(void *mem, u32 len)
> {
> 	int i;
> 
> 	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> 		if (!mem)
> 			return;
> 
> 		for (i = 0; i < (len / 4); i++) {
> 			*(u32 *)mem = swab32(*(u32 *)mem);
> 			mem += 4;
> 		}
> 	}
> }

This function doesn't work for 64 bit values (if they are actually in big 
endian). It just rearranges (len / 4) u32s to host byte order - so the upper 
and lower 32 bit values for an u64 would still be swapped.

Unless I misunderstood what CE_ATTR_BYTE_SWAP_DATA is supposed to do. Maybe it 
is not causing returned data to be in big/little endian but causes for one of 
the host endianess' that the data for 64-bit values in mixed endianness.

And if the function would operate on a struct with 16 bit or 8 bit values then 
we have something which we call here Kuddelmuddel [1].



But if the value is an u64, then the code in the patch is wrong:

> /* supplicant expects big-endian replay counter */
> replay_ctr = cpu_to_be64(le64_to_cpup((__le64 *)ev->replay_counter));

This would break on big endian architectures because ev->replay_counter is a 
__be64 and not a __le64 on these systems. Just from the way the byte ordering 
is supposed to look like - not the data type for the C-compiler).

If you have a look at what the code does (beside 64 bit load by _cpup), is 
just to add a single swap64 - either by cpu_to_be64 or by le64_to_cpup - 
depending on whether the host system is little endian or big endian.

So for a __le64, it would (besides the incorrectly aligned 64 bit load from 
struct wmi_gtk_offload_status_event),  do a single swap64 to __be64. This 
swap64 is from cpu_to_be64 and le64_to_cpup doesn't swap anything.

But on a big endian system, the __be64 would also be sent through a swap64 
(from le64_to_cpup) and cpu_to_be64 wouldn't swap anything. So at the end, it 
would be a __le64. So something which conflicts with the comment above this 
code line.


There are now various ways to correctly implement it:

* change replay_counter to an u64 in the (packed) struct and:

      replay_ctr = cpu_to_be64(ev->replay_counter);

* keep it as u8[8] in the struct and make sure yourself that an unaligned-safe
  64 bit load is used:

      replay_ctr = cpu_to_be64(get_unaligned((u64 *)ev->replay_counter));


Kind regards,
	Sven


[1] It is something like "jumble" or "mess"
--nextPart3309310.PNGyNpqY9y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmHAbh8ACgkQXYcKB8Em
e0boxg/+O3G/C7Y2sJlXwM4w2HUfyLc70l1j5N9ltzUMjSsa65knAMU7xm9QIyh3
pZWDAjdX6es5v6eK0G43otA00oTK0H9tSKidBi+wa/pLmhBBA9NB0W7j0Q43Lryo
othZOf01mTjdNCB7CIsm7x8gToLWn5zsq9kvW/Nmj7DnuC7C+Js4eJEWZzaOcsnX
bTkrmb8H1zQnfk5CQo2cjC4oMK660IUjUYAw853ETyZz4E3hv97N99/9zcKvXkmk
rPEOWOCTYisKwpDeokMDbk+FHYHXLkcjku30o2vtQqY/EBb0LyT51sFejQOBZryL
N5K8AJuoTjZAT/s5JxCm44EFGF7+lpUCjK8uv7olwwNacEpYFQNtzD52riXN+lEh
kR7OSuOIdY+HjjkwkmeJbdZ0T6p84rwFrX9RMi/eu33y9oIx0rzegTNsVrglSIh/
3xOHUYWHSl4usKAGKiF8BUwKvPrGzPfFIU6W3My5JFBiNUbXEmXoEYH5bq8UN0Wd
MXupMkTl9Frnx8/mxnrcJSM34qDdAPC5kBHkzFxsSZ7Whn6FtGTJtvPPgoPcqCsV
MvXwnTWjXcv7cHDVIgmRV3DtDY1PBFZx+57z2L/c2Mj/dDNIpfMb9VMFd/pq0e99
UJ6BVkOheo3CDL1tTysyai82qJvgRtDwVwDDU1z5zOsneiGR8JY=
=8lrz
-----END PGP SIGNATURE-----

--nextPart3309310.PNGyNpqY9y--





--===============3468954286114824349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============3468954286114824349==--




