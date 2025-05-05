Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FF1C3ABB0
	for <ath11k@archiver.kernel.org>; Mon,  5 May 2025 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+Gg3Mt50xwSUU5m3t61oAB6vI5/1zWYCb/caGSKW4c=; b=mho3gaQsSoK2XUpyOoxQ3rNDOE
	9KPPk/E9mSv3SC0cbSJoP7lVSodRy5rq71LIhj7EzJNGj8kgy/TzlDk2+LziX/hu9TjseKoaim/Ah
	KT5D6Tc2ZlR+lQhtkBj+cYyBirbL7oQIFeEvYr9EaowyWTvJ/YFu0UTYX58FnMw4s5bbAeAq9AJBz
	Jk7qNQUyQ59tpUe10ybYtBAlGyojdEhknR2D7x9ReWrEbEvfdL6Hqpm9/Vbq5IkKA9rG0ZdDwLVqH
	kIIGsEiKCVN78QmG6W7it6FX7jK/3OlL2CtjHz+SjqWrVujc2/z66jJXXqp0fkwvEAst1IQk9+4IS
	5LCJMJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqvU-00000006kTp-2AeE;
	Mon, 05 May 2025 08:11:48 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqvS-00000006kTF-1T9N
	for ath11k@lists.infradead.org;
	Mon, 05 May 2025 08:11:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746432690; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MLF8NapsauWx/jWEFAUDVSKKaVgiJMS7O27bOiTP34z4/kY/1Y/DTrq0We8cxR6mByfUhB019/sQQNObNPej3kXiy8E+cNM+WvqdBdwBn4UnODiwOMU76aE8ZqFiOMOpTCrp8eqaKJzN1TD0glPySlcfhxo0uu1dH2CEk2jhvhA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746432690; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b+Gg3Mt50xwSUU5m3t61oAB6vI5/1zWYCb/caGSKW4c=; 
	b=mljTnn9fGJrwzH0ffp16E0t2V1qrHGHQhQRg93D9j0dFGPTZy9NQojSFmtHL3rqvcphSWBgY3PtgIZ+WM4pwX4DYUGzo3aA4EXbxNMF19lym/K4opFOvbJgLBS+p5UuGIowb28guCM7oPgprAJk7g5utjbPEGO1Pq1gYfaTCCj8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746432690;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=b+Gg3Mt50xwSUU5m3t61oAB6vI5/1zWYCb/caGSKW4c=;
	b=AVhsher3yyW72VmiAxLe2e1aGyFzNopPF5zAdnZWGSXnM6b/E6VyqX0optYsSjH7
	fv5Qc1bVsbV+y9hLMldqxKb7bnpDR5aaBtf6Pl37ZZ193CSysG2mmYH30z/WDfOYK3i
	8lmp5sDEAAvgLFamLoVcMJ+cghVnxEIAzxwsJBY0=
Received: by mx.zohomail.com with SMTPS id 1746432688103381.6383686732846;
	Mon, 5 May 2025 01:11:28 -0700 (PDT)
Message-ID: <d2ce1fd8-cd84-4744-9847-2ac393bf99eb@collabora.com>
Date: Mon, 5 May 2025 13:11:23 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, kernel@collabora.com,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_bqiang@quicinc.com
Subject: Re: [PATCH v5] wifi: ath11k: Fix memory reuse logic
To: jeff.johnson@oss.qualcomm.com, Jeff Johnson <jjohnson@kernel.org>
References: <20250428080242.466901-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20250428080242.466901-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_011146_482767_C491A25E 
X-CRM114-Status: GOOD (  22.54  )
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

Reminder to pick this patch.

On 4/28/25 1:02 PM, Muhammad Usama Anjum wrote:
> Firmware requests 2 segments at first. The first segment is of 6799360
> whose allocation fails due to dma remapping not available. The success
> is returned to firmware. Then firmware asks for 22 smaller segments
> instead of 2 big ones. Those get allocated successfully. At suspend/
> hibernation time, these segments aren't freed as they will be reused
> by firmware after resuming.
> 
> After resuming, the firmware asks for the 2 segments again with the
> first segment of 6799360 size. Since chunk->vaddr is not NULL, the
> type and size are compared with the previous type and size to know if
> it can be reused or not. Unfortunately, it is detected that it cannot
> be reused and this first smaller segment is freed. Then we continue to
> allocate 6799360 size memory which fails and ath11k_qmi_free_target_mem_chunk()
> is called which frees the second smaller segment as well. Later success
> is returned to firmware which asks for 22 smaller segments again. But
> as we had freed 2 segments already, we'll allocate the first 2 new
> smaller segments again and reuse the remaining 20. Hence 20 small
> segments are being reused instead of 22.
> 
> Add skip logic when vaddr is set, but size/type don't match. Use the
> same skip and success logic as used when dma_alloc_coherent() fails.
> By skipping, the possibility of resume failure due to kernel failing to
> allocate memory for QMI can be avoided.
> 
> 	kernel: ath11k_pci 0000:03:00.0: failed to allocate dma memory for qmi (524288 B type 1)
> 	ath11k_pci 0000:03:00.0: failed to allocate qmi target memory: -22
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v1:
> - Update description
> 
> Changes since v2:
> - Update description and title of patch
> 
> Changes since v3:
> - Update description and title of patch
> 
> Changes since v4:
> - Update title of the patch
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 47b9d4126d3a9..2782f4723e413 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -1993,6 +1993,15 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
>  			    chunk->prev_size == chunk->size)
>  				continue;
>  
> +			if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "size/type mismatch (current %d %u) (prev %d %u), try later with small size\n",
> +					    chunk->size, chunk->type,
> +					    chunk->prev_size, chunk->prev_type);
> +				ab->qmi.target_mem_delayed = true;
> +				return 0;
> +			}
> +
>  			/* cannot reuse the existing chunk */
>  			dma_free_coherent(ab->dev, chunk->prev_size,
>  					  chunk->vaddr, chunk->paddr);

-- 
Regards,
Usama

