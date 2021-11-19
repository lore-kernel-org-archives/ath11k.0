Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9720AC433F5
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 13:00:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C6C61A38
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 13:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57C6C61A38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGWFGmHSHAJc1PyQg7zOFiIIixz9AoAH7hKp5Tz8vRo=; b=uTyuxmEaKs5f6m
	wxfPcUT05TcKK9LA1my/DbTCsW0TfeQ7u0g7XNzq/a8uEfoDr+eBU79i9mzWFxS+eGx6TcoOeNHjZ
	3sZozNRBPYM8myvLiysQaEVfVmTiIF8dNcp/zpfp8iThKhjvq9B5Mez4znq/MWnZTe8WSR6+siO3Z
	vOptrkeAiuW62d+kDCYaKFN0jqTeATvhsH/ERx+gv6TrUtB3bm9bH+gWD21Pq/JWgpNWiwh1S/paI
	w/B6by6hv1ksKvgc1ELEgKCykeGtO2eXWG8SJYrRptaCf8w6I6ND04+9o3/IxT8m/DmEp2k8SKdvC
	lXlUVbbvCTvqbuakBM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo3Vh-00AQXg-Fe; Fri, 19 Nov 2021 13:00:57 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo3Vd-00AQXC-O4
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 13:00:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637326853; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=9P1+GeW+iMG520eXm/L61/BwyPJU0q/p6N4rHT+ye9c=;
 b=LPp3f035e1K7iG/nNr4CAP7tj67adIL+wQYTHZNpxbCqlsydz5zLybzqGo6HUwx9tczUno/j
 H3nA+WbwR+Inz0gkI1GOxyZRi8MShcRq6kStSfHKw9IRPCcIbnI8MTTQxawXo5TDaKvHMuh9
 NJNuB/6dPa+1APzdxRjjhphrtGg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6197a004f5c956d49e458928 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 13:00:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 60934C4360C; Fri, 19 Nov 2021 13:00:52 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29A41C4360D;
 Fri, 19 Nov 2021 13:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 29A41C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATH v3 2/2] ath11k: Use reserved host DDR addresses from DT for
 PCI devices
References: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
 <1637244892-27267-2-git-send-email-akolli@codeaurora.org>
Date: Fri, 19 Nov 2021 15:00:44 +0200
In-Reply-To: <1637244892-27267-2-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Thu, 18 Nov 2021 19:44:52 +0530")
Message-ID: <87czmwcnb7.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_050053_858567_3CE5984F 
X-CRM114-Status: GOOD (  22.90  )
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

Not sure how I missed these in the last round:

> +static bool ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)

static int ....

> +{
> +	struct device_node *np;
> +	u32 reg[4];
> +	dma_addr_t start;
> +
> +	np = of_find_node_by_type(NULL, "memory");
> +	if (!np)
> +		return false;
> +
> +	if (of_property_read_u32_array(np, "reg", reg, 4))
> +		return false;

ret = of_property_read_u32_array(np, "reg", reg, 4);
if (ret)
	return ret;

> +	start = reg[0] + reg[1];
> +	mhi_ctrl->iova_start = start + 0x1000000;
> +	mhi_ctrl->iova_stop = start + reg[2] + reg[3];
> +
> +	return true;

return 0;

> +}
> +
>  int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  {
>  	struct ath11k_base *ab = ab_pci->ab;
> @@ -339,8 +360,14 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  		return ret;
>  	}
>  
> -	mhi_ctrl->iova_start = 0;
> -	mhi_ctrl->iova_stop = 0xffffffff;
> +	if ((test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags))) {
> +		if (!ath11k_mhi_read_addr_from_dt(mhi_ctrl))
> +			return -ENODATA;

                ret = ath11k_mhi_read_addr_from_dt(mhi_ctrl);
		if (ret)
			return ret;

> @@ -1245,6 +1246,13 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>  	pci_set_drvdata(pdev, ab);
>  	spin_lock_init(&ab_pci->window_lock);
>  
> +	/* Set fixed_mem_region to true for platforms support reserved memory
> +	 * from DT. If memory is reserved from DT for FW, ath11k driver need not
> +	 * allocate memory.
> +	 */
> +	if (!of_property_read_u32(ab->dev->of_node, "memory-region", &addr))
> +		set_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags);

ret = of_property_read_u32(ab->dev->of_node, "memory-region", &addr);
if (!ret)
	set_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags);

>  static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>  {
> +	struct device *dev = ab->dev;
> +	struct device_node *hremote_node = NULL;
> +	phandle hremote_phandle;
> +	dma_addr_t start;
> +	u32 reg[4], size, host_ddr_sz;
>  	int i, idx;
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
> +			if (of_property_read_u32_array(hremote_node, "reg", reg, 4)) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "qmi fail to get reg from hremote\n");
> +				return 0;
> +			}

ret = of_property_read_u32_array(hremote_node, "reg", reg, 4);
if (ret) {
	ath11k_dbg(ab, ATH11K_DBG_QMI,
		   "qmi fail to get reg from hremote\n");
	return 0;
}

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
