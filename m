Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037A0C369CB
	for <ath11k@archiver.kernel.org>; Wed, 23 Apr 2025 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtDCyMWD4o0QblVy4W0qH/IAUUG3Hf3eVcRe84lFpEE=; b=DMytSfTOOhVXR5a8l2MYUBeW8K
	MNRhOIJ+VkMEJEa5R4FuJV5/5zvFw0dWXbah4kdJbFh59LdjVU+ewGSZLIP4wtGoK3r1jVKIoOR1G
	8y5nrVfcg1nLrovAK+QMfmKCP7d4444ySzpU4swK0vLz5Btn4aRVzvh9hdKR+3For30GlT873wFSm
	HFX23HCr+XlF33YDtfGixB9TwSxL+60kjsh5XuJEdnqCex60VMEMMAp+ewFd0jtkqKUMtVhboKVrd
	oiTneP4bVAx0mmc1j1j0blcmPwGAKkm/2KqxdFOuoRXLTMg0dSHZeHctnUn9MIZ5efZyqic8fgakx
	9TrBzZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bop-0000000Avtp-2ZpP;
	Wed, 23 Apr 2025 15:15:23 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aW7-0000000Afn1-1zJ7
	for ath11k@lists.infradead.org;
	Wed, 23 Apr 2025 13:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745416305; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bI5HCNRrXiqjvmlp6o7QMKYxgyVKyLu+RF0eljFmwHycqCT6oqePLBppjInBvylRhQzBVIbvJSj326fq1AhiVGZ8KbdQfGTUEQUg1VFxIWjl22OTLymyos/rmutWMCAkWPYv6j1fHIVvbFc/79K9Xo8N49Xm4VoXR5J0b47SIwA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745416305; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VtDCyMWD4o0QblVy4W0qH/IAUUG3Hf3eVcRe84lFpEE=; 
	b=fHPS3aw5iPmLYhR5BUTZp02VGAWgP9wMLl/Uwwav7IBjWUq+jnpEidVFsckJ8K6t8o0LxAgV+/5sS8iUxbr6EcVs82Uz+zLfmfbIDAX3c1nYCTUuxu6wi4lCU8Yk4rEMoiEUA1rk2REf6RhVK+Y8FiyxjQkdhrwfr+vVM7sOMqQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745416305;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VtDCyMWD4o0QblVy4W0qH/IAUUG3Hf3eVcRe84lFpEE=;
	b=dinOHeGS+ToMjUFjJpDI4N8sTWlWhD2KRwXLzt/KlC8D1uJlE+dybSCUMPbL5SKG
	Ry0dw2T/4vTD5wsudt0kIG/qvkJbf75+oHeDHA1cW2wAlCVMZbRgABuVrH+LhqhBj+8
	m1d7tWvsVHtxCMvfqSxRckjCQUqpmhYz+pZ7Jgxc=
Received: by mx.zohomail.com with SMTPS id 1745416303535291.784690825201;
	Wed, 23 Apr 2025 06:51:43 -0700 (PDT)
Message-ID: <e5429039-3679-474f-80cc-12f6cc01de09@collabora.com>
Date: Wed, 23 Apr 2025 18:51:36 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Fix memory reuse logic
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Anilkumar Kolli <quic_akolli@quicinc.com>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250423065931.4017574-1-usama.anjum@collabora.com>
 <f98ed1af-e190-404f-a2d2-aa64a712e7c2@quicinc.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <f98ed1af-e190-404f-a2d2-aa64a712e7c2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_065159_610411_FB500240 
X-CRM114-Status: GOOD (  34.55  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 4/23/25 1:15 PM, Baochen Qiang wrote:
> 
> 
> On 4/23/2025 2:59 PM, Muhammad Usama Anjum wrote:
>> Firmware requests 2 segments at first. The first segment is of 6799360
>> whose allocation fails due to dma remapping not available. The success
>> is returned to firmware. Then firmware asks for 22 smaller segments
>> instead of 2 big ones. Those get allocated successfully. At suspend/
>> hibernation time, these segments aren't freed as they will be reused
>> by firmware after resuming.
>>
>> After resume the firmware asks for 2 segments again with first segment
>> of 6799360 and vaddr is not NULL. We compare the type and size with
> 
> suggest to rephrase as:
> 
> After resume the firmware asks for 2 segments again with first segment
> of 6799360. Since chunk->vaddr is not NULL, we compare the type and size with
> 
>> previous type and size to know if it can be reused or not.
>> Unfortunately, we detect that it cannot be reuses and this first smaller
> 
> s/reuses/reused/
> 
>> segment is freed. Then we continue to allocate 6799360 size memory from
>> dma which fails and we call ath11k_qmi_free_target_mem_chunk() which
> 
> it is odd with 'from dma' ...
> 
> I think just say 'allocate 6799360 size memory' is good enough.
> 
>> frees the second smaller segment as well. Later success is returned to
>> firmware which asks for 22 smaller segments again. But as we had freed 2
>> segments already, we'll allocate the first 2 new smaller segments again
>> and reuse the remaining 20. Hence we aren't reusing the all 22 small
>> segments, but only 20.
>>
>> This patch is correcting the skip logic when vaddr is set, but size/type
>> don't match. In this case, we should use the same skip and success logic
>> as used when dma_alloc_coherent fails without freeing the memory area.
>>
>> We had got reports that memory allocation in this function failed at
>> resume [1] which made us debug why the reuse logic is wrong. Those
> 
> The link is just v1 of this patch, it is not the report. If there is no public report,
> just don't mention it.
> 
>> failures weren't because of the bigger chunk allocation failure as they
>> are skipped. Rather these failures were because of smaller chunk
>> allocation failures. This issue is in the kernel side as because of
>> memory pressure or fragmentation, the dma memory allocation fails. This
>> patch fixes freeing and allocation of 2 smaller chunks.
> 
> I know you are describing why you start to debug this issue. But I don't think it is
> needed in the commit message. No matter kernel allocation fails or succeeds, the issue is
> there, and the description above is sufficient to make the issue clear.
> 
>>
>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> blank line needed.
> 
>> [1] https://lore.kernel.org/all/b30bc7f6-845d-4f9d-967e-c04a2b5f13f5@collabora.com
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes since v1:
>> - Update description
>>
>> Fixes: 5962f370ce41 ("ath11k: Reuse the available memory after firmware reload")
>> I think we should keep fixes tag as ^ claimed that its adding reuse
>> support. But it left a bug in reuse which we are fixing.
>>
>> Feel free to add it or leave it as it is.
> 
> Jeff, what do you think?
I'll update the description as mentioned. Let's wait for Jeff to review
before I send v3.

> 
>> ---
>>  drivers/net/wireless/ath/ath11k/qmi.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>> index 47b9d4126d3a9..3c26f4dcf5d29 100644
>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>> @@ -1990,8 +1990,16 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
>>  		 */
>>  		if (chunk->vaddr) {
>>  			if (chunk->prev_type == chunk->type &&
>> -			    chunk->prev_size == chunk->size)
>> +			    chunk->prev_size == chunk->size) {
>>  				continue;
>> +			} else if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {
>> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +					   "size/type mismatch (current %d %u) (prev %d %u), try later with small size\n",
>> +					    chunk->size, chunk->type,
>> +					    chunk->prev_size, chunk->prev_type);
>> +				ab->qmi.target_mem_delayed = true;
>> +				return 0;
>> +			}
>>  
>>  			/* cannot reuse the existing chunk */
>>  			dma_free_coherent(ab->dev, chunk->prev_size,
> 


-- 
Regards,
Usama

