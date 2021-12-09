Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B224C433EF
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 08:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYSybZ/cqH+ohPRY6hmenA1Py7S6XYf2+2HJNo+zQ9g=; b=nySh9x05Rqqlb2
	Xu+/Jr/LPYFfgB1lo74pX2qXgXnXp9ZULmfQDOROL/oSdCCefHzDZhQmd9EVr3h2oGOUZj0EnHn/x
	i9pofx/aNjcXFpmggLtD42IhT/FUT7PGs8/CFUVdEPm4JIqope5YU26ZBfZjVNHJmJu3+3VYWpVmW
	e8IrNjpRtPjZawavl+IoDlOsY8NY9/iQRzHN+LlI77JpoTvtg0IU8Q0UwcvunxgZCyaFGXRHMGyYY
	2kpRWYakQWRwKktTTILGMQfwH6jN5ZYU55yTG3B009KatmlfWMh5aiJNmi+kn9TTYU8MH+aaFh5q4
	L8kXUwOwmZdMahp/O7YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvET8-00FDFO-48; Thu, 09 Dec 2021 08:07:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvET5-00FDEr-Du
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 08:07:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 051CAB8235E;
 Thu,  9 Dec 2021 08:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F405C004DD;
 Thu,  9 Dec 2021 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639037272;
 bh=9HSmsfMKHpF4f9eGjC4cv2s5/K0HxC/q6EHNgjltL8Q=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ITjPp9Fg5dys06q+H+NFzfGozFrNxZhZLI42km2lwKFIKTuhD0YkAoDh+CUAeXZ84
 YfQqSl8/MlO2R4GXcVL5aqUBKh6m/A9flq1U54IWaBQgIGvrm75rAtbXnPD5Lc90IL
 uhA+X91cnviVUV/TDKQ5v/H8FAo9RGVW8cli+ih34W2OYkUjtM2XaQHDOEkKolj7F/
 hpt8cATVojYZgYuoFFND9EC+U7bqN/Ogwg5h9JPBhbzQKaCeEn6tviWtMaPGTHeR7P
 zmpD/ztqluUyYDBJf9o4KvYk8UVZvpZHF1dgnazMtlf2FRKMO595T84tTEjgesaA0r
 NvFI9lTlK6Z5g==
From: Kalle Valo <kvalo@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v7 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
References: <1638789319-2950-1-git-send-email-akolli@codeaurora.org>
 <1638789319-2950-2-git-send-email-akolli@codeaurora.org>
Date: Thu, 09 Dec 2021 10:07:49 +0200
In-Reply-To: <1638789319-2950-2-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Mon, 6 Dec 2021 16:45:19 +0530")
Message-ID: <87tufi42wa.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_000755_633689_B5F264A8 
X-CRM114-Status: GOOD (  12.45  )
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

Anilkumar Kolli <akolli@codeaurora.org> writes:

> Host DDR memory (contiguous 45 MB in mode-0 or 15 MB in mode-2)
> is reserved through DT entries for firmware usage. Send the base
> address from DT entries.
> If DT entry is available, PCI device will work with
> fixed_mem_region else host allocates multiple segments.
>
> IPQ8074 on HK10 board supports multiple PCI devices.
> IPQ8074 + QCN9074 is tested with this patch.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

[...]

> @@ -349,8 +372,15 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
>  		mhi_ctrl->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
>  
> -	mhi_ctrl->iova_start = 0;
> -	mhi_ctrl->iova_stop = 0xffffffff;
> +	if ((test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags))) {

Unnecessary parenthesis, I fixed it in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
