Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA00C433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:05:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE0861BD2
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAE0861BD2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jetID9/RKBsAho3ihcUVPqqYexEszvnGIiUniH7gqW0=; b=EMAHmin7kqrNbM
	VtPFo6vyTVc01xdZLdfsyYrUUknrp8RPDUWXawS5xZILd9cqTrWqAs7tnkAgFe8MOz6PiLvMAsvDg
	ZmK2uXC1P7YnQLm+4mdlikphF3GPHaO0l4lODdMG7hdMzsDpikwh3vvEAcJeT3d5bpYA7kPujyks7
	4sx8OXycd70THzwj1H2kN9ScMWpNG9+7qe8nqUJOQSea3UPabu4rdQlglOvlcuTuRm5jZYLzoXTQu
	DNyGSHiRGhCWIb1iXHknfskqaJAaQgFJNguJYjRO3QiOYcd205AkdAdfGnTgXefx+mNSsTyDafSwm
	b1g+qyb3E6p3O/dr//FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFwt-003tZV-MW; Wed, 17 Nov 2021 08:05:43 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFwq-003tYy-AU
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 08:05:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637136340; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=HVRNzrs1nP5Jz4ZKRK0Rxuo5ZuOCFu/DJU29ClKa/2g=;
 b=jaSqHqXmRRwlmeI6QgF2jCLpDsEK5nKY7uBNK+00qmm02YAFiar43cOT0VvktdSEDASAFhot
 tyYMUxlhnESL2vNSU8QY6lH7VOiJUWdJdrg/5WcndQing7lPT2KgMcPtqCl+si+kbuQJfhXS
 PnJ06bq561rtRBM72SUBxKO8k6c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6194b7d3665450d43affffe7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 08:05:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E34F1C4360C; Wed, 17 Nov 2021 08:05:38 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 75957C4338F;
 Wed, 17 Nov 2021 08:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 75957C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
References: <1637082058-6398-1-git-send-email-akolli@codeaurora.org>
 <1637082058-6398-2-git-send-email-akolli@codeaurora.org>
Date: Wed, 17 Nov 2021 10:05:34 +0200
In-Reply-To: <1637082058-6398-2-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Tue, 16 Nov 2021 22:30:58 +0530")
Message-ID: <87wnl7dx69.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_000540_443508_D4239FD5 
X-CRM114-Status: GOOD (  33.61  )
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
> address and size from DT entries.
>
> If DT entry is available, PCI devices work with
> fixed_mem_region else host allocates multiple segments.
>
> IPQ8074 on HK10 board supports multiple PCI devices.
> IPQ8074 + QCN9074 is tested with this patch.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
> V2:
>   - Use of_ API to read from dt node (Rob)
>
>  drivers/net/wireless/ath/ath11k/mhi.c | 42 ++++++++++++++++++--
>  drivers/net/wireless/ath/ath11k/pci.c | 10 ++++-
>  drivers/net/wireless/ath/ath11k/qmi.c | 75 +++++++++++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath11k/qmi.h |  1 +
>  4 files changed, 116 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index 26c7ae242db6..0ea6ab7edeb9 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -3,6 +3,7 @@
>  
>  #include <linux/msi.h>
>  #include <linux/pci.h>
> +#include <linux/of.h>
>  
>  #include "core.h"
>  #include "debug.h"
> @@ -316,7 +317,11 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	struct ath11k_base *ab = ab_pci->ab;
>  	struct mhi_controller *mhi_ctrl;
>  	struct mhi_controller_config *ath11k_mhi_config;
> -	int ret;
> +	struct device_node *np;
> +	int ret, len, sw, aw;
> +	u32 *reg, *reg_end;
> +	unsigned long start, size;
> +	bool no_dt_entry = 0;

Use only true or false with bools.

>  	mhi_ctrl = mhi_alloc_controller();
>  	if (!mhi_ctrl)
> @@ -339,8 +344,39 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  		return ret;
>  	}
>  
> -	mhi_ctrl->iova_start = 0;
> -	mhi_ctrl->iova_stop = 0xffffffff;
> +	np = of_find_node_by_type(NULL, "memory");
> +	if (!np) {
> +		no_dt_entry = 1;

true

> +		goto no_dt_entry;
> +	}
> +
> +	aw = of_n_addr_cells(np);
> +	sw = of_n_size_cells(np);
> +
> +	reg = (unsigned int *)of_get_property(np, "reg", &len);

Always try to avoid casts. of_get_property() returns 'const void *' so
you are casting out const here, which is a bug. You don't need to do
casting with void pointers so remove it here.

But is reg property really unsigned int? And not u32 or dma_addr_t, for
example?

> +	if (!reg) {
> +		no_dt_entry = 1;

true

> +		goto no_dt_entry;
> +	}
> +
> +	reg_end = reg + len / (aw * sw);
> +
> +	do {
> +		start = of_read_number(reg, aw);
> +		reg += aw;
> +		size = of_read_number(reg, sw);

of_read_number() takes 'const __be32 *cell' but reg is 'u32 *'?

> +		reg += sw;
> +	} while (reg < reg_end);
> +
> +no_dt_entry:
> +	if (no_dt_entry) {
> +		mhi_ctrl->iova_start = 0;
> +		mhi_ctrl->iova_stop = 0xFFFFFFFF;
> +	} else {
> +		mhi_ctrl->iova_start = (dma_addr_t)(start + 0x1000000);
> +		mhi_ctrl->iova_stop = (dma_addr_t)(start + size);

I don't like casts, they hide bugs like the const issue above. Is there
any way to do this without casts?

> @@ -1245,6 +1246,13 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>  	pci_set_drvdata(pdev, ab);
>  	spin_lock_init(&ab_pci->window_lock);
>  
> +	/* Set fixed_mem_region to true for platforms support reserved memory
> +	 * from DT. If memory is reserved from DT for FW, ath11k driver need not
> +	 * allocate memory.
> +	 */
> +	if (!of_property_read_u32(ab->dev->of_node, "memory-region", &addr))
> +		ab->bus_params.fixed_mem_region = true;

ab->bus_params is supposed to be const to catch this, but clearly it's
not. The idea of bus_params is to have static bus level configuration,
please instead use dev_flags or something else.

>  static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>  {
> -	int i, idx;
> +	struct device *dev = ab->dev;
> +	struct device_node *hremote_node = NULL;
> +	phandle hremote_phandle;
> +	int i, idx, len, sw, aw, host_ddr_sz;
> +	u32 *reg, *reg_end;
> +	u64 start, size;
>  
>  	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
>  		switch (ab->qmi.target_mem[i].type) {
> +		case HOST_DDR_REGION_TYPE:
> +			if (of_property_read_u32(dev->of_node, "memory-region",
> +						 &hremote_phandle)) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "qmi fail to get hremote phandle\n");
> +				return 0;
> +			}
> +
> +			hremote_node = of_find_node_by_phandle(hremote_phandle);
> +			if (!hremote_node) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "qmi fail to get hremote_node\n");
> +				return 0;
> +			}
> +
> +			aw = of_n_addr_cells(hremote_node);
> +			sw = of_n_size_cells(hremote_node);
> +
> +			reg = (unsigned int *)of_get_property(hremote_node, "reg", &len);

No need to cast. And I guess you are again removing the const?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
