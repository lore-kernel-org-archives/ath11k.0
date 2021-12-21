Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB801C43219
	for <ath11k@archiver.kernel.org>; Tue, 21 Dec 2021 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v33nGFStvdmlQ805+/eczi8b2U4VmTTM3Yx45QHo8NQ=; b=cuQUuFj57L4ey3
	1Tc4COpmmAq9Teoz9g8ixZwkzvjupG5H893NctEA+4gIaT2Ez2kgbJHzhuuk7duX7zWo/20a+lwFv
	v6/fzgQIOzNO4E8dW6Tn2PIohzUq0k8BAEySQHQ+wyUXtWN58ajgONEiVNeIh8QPHLgam31H5MKEV
	UY53SbOHmFSzD5bMllTb84tuWakoL9qhNFTv/sEeeajS5WbCEnW35g+1b4ftbrxs6cEXbhentaZ2U
	tXKgwIOqCKu8PwLrCShZ06EGfkuzXTtaHqE9MdpdlZPcERbxg0iTBJRd0lDNYB57OyMn3qPCDJHJS
	hyHe4BsdOHyNHZ/bN2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzgRt-007Buz-So; Tue, 21 Dec 2021 14:49:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzgRp-007Btu-Uc
 for ath11k@lists.infradead.org; Tue, 21 Dec 2021 14:49:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DEF19B8171C;
 Tue, 21 Dec 2021 14:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAFEC36AE8;
 Tue, 21 Dec 2021 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640098138;
 bh=8vHGnwhKlFVmRTByj0rA81VBFGKYpqyMdpDcm9Krgow=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=iTjRExKZJszmd3s+uyw0aSdNb189ohkoxTeopT8//nCa9iFxToY6IcyWsRKgiRWZs
 uQlrskmzbQttFoOK8RWWogY01YxOJ0mP06WjeNBoXovw3NyN3V554DPaCxD8gmpGaA
 2vB/mVjORhbd8IppkYrtRLni2nQ8+Fo+yKo2KCb5NyFCwEh7U2uozgz/xpB5/0V0L9
 BG7oWVlSIoywzi6YvNU5Z78za73beWH+DbSLvpsks4gYQUi6IM+csYmC0f2kO7vz6w
 JLQJ2RaFDVi9CVPsplXXaik0mQ+zXPEZU3QKWH57VO+UKmsHFE6kzeIHs2r7KksUS9
 fkW94aXL+Mrkg==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 quic_cjhuang@quicinc.com, Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <2102838.219ycuhFCz@sven-l14> <871r27bnkz.fsf@codeaurora.org>
 <1934542.dmet8VCoWv@sven-l14>
Date: Tue, 21 Dec 2021 16:48:53 +0200
In-Reply-To: <1934542.dmet8VCoWv@sven-l14> (Sven Eckelmann's message of "Mon, 
 20 Dec 2021 12:50:55 +0100")
Message-ID: <87r1a66mju.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_064902_303849_969E7CD0 
X-CRM114-Status: GOOD (  26.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Sven Eckelmann <sven@narfation.org> writes:

> On Monday, 20 December 2021 11:03:08 CET Kalle Valo wrote:
> [...]
>
> Thanks for all the explanation and pointers. I will try to use this to more 
> clearly formulate my concern.

Good idea, this is too complex.

> If I understood it correctly then ev->replay_counter is:
>
> * __le64 on little endian systems
> * __be64 on big endian systems
>
> Or in short: it is just an u64.

My understanding is that on little endian host it's (the number representing
the byte index):

1 2 3 4 5 6 7 8

And on big endian host it's (as the firmware automatically swapped the
values):

4 3 2 1 8 7 6 5

So for on big endian we need to use ath11k_ce_byte_swap() to get them
back to correct order. (Or to be exact we need to use
ath11k_ce_byte_swap() every time as it does nothing on a little endian
host.)

Completely untested, of course. I don't have a big endian system.

>> Yeah, if the host does the conversion we would use __le64. But at the
>> moment the firmware does the conversion so I think we should use
>> ath11k_ce_byte_swap():
>> 
>> /* For Big Endian Host, Copy Engine byte_swap is enabled
>>  * When Copy Engine does byte_swap, need to byte swap again for the
>>  * Host to get/put buffer content in the correct byte order
>>  */
>> void ath11k_ce_byte_swap(void *mem, u32 len)
>> {
>> 	int i;
>> 
>> 	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
>> 		if (!mem)
>> 			return;
>> 
>> 		for (i = 0; i < (len / 4); i++) {
>> 			*(u32 *)mem = swab32(*(u32 *)mem);
>> 			mem += 4;
>> 		}
>> 	}
>> }
>
> This function doesn't work for 64 bit values (if they are actually in big 
> endian). It just rearranges (len / 4) u32s to host byte order - so the upper 
> and lower 32 bit values for an u64 would still be swapped.
>
> Unless I misunderstood what CE_ATTR_BYTE_SWAP_DATA is supposed to do. Maybe it 
> is not causing returned data to be in big/little endian but causes for one of 
> the host endianess' that the data for 64-bit values in mixed
> endianness.

So my understanding is that when CE_ATTR_BYTE_SWAP_DATA is enabled the
firmware automatically swaps the packets per every four bytes. That's
why all the fields in WMI commands and events are u32.

> And if the function would operate on a struct with 16 bit or 8 bit values then 
> we have something which we call here Kuddelmuddel [1].

Heh, need to remember that word :)

> But if the value is an u64, then the code in the patch is wrong:

The firmware interface should not have u16 or u8 fields. And for
anything larger ath11k_ce_byte_swap() should be used. Again, this is
just my recollection from discussions years back and I have not tested
this myself.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
