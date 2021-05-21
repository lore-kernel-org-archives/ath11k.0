Return-Path: <SRS0=pS/N=KQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8E1C433B4
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:38:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FA47610CB
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FA47610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5o9NbGG8OlyhFWtRzKsGTqwfp14P20z/rriE6rXQulA=; b=hd/wL4b+l7yGfY4nNUMO20SSgW
	rF9hSsT5WM3KvS1nogj59lLm84LDVQ390vvOjQjdVD0HWBtc0CMRsCAxjD4RLmGUxjbt0U6jk/+P7
	WM1CUT5RPct2aXYfmGPhrBoM66Cwxz8On+3r33y88is7LaWRHsbA6eqgQIVFmHaY9lwkJzYfIrKnb
	DVQJi6UXjPMY6X27UskTim1oTqM9ckxh/QswaxdqjzRlITdrwopat8FggbYVjq5fUpPyJeEzBVQZL
	OzZc7iJRKjnv0Q1UjNG5xGcCsecQzXLLpaHhjlGY67BYY8tcGQYdZWxYtx3Y7FKh5vR13kJAsZeuq
	KXGT2eMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5MC-005Yyx-Ls; Fri, 21 May 2021 13:38:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5M9-005YxC-NX
 for ath11k@desiato.infradead.org; Fri, 21 May 2021 13:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=p4XAwPcTLZLM93Pe17eQwaDCk7aR8CaSc22Qnnp8gms=; b=R/CH8JaCnbhTKVLRTT1APQWung
 3S0PG86A/q+HS2VyE1D1r9caEGYkC8fMQuihxQYV1vmrYXGdgFYXhf87AfRVSsVZuLUtCMxVqY5KH
 vcJ5hyi4Mzj8SUN0kLbRJSsPmxxkx+OoU270onCPnugysAa3gfRYztDYeJl9ySN5PtOXLTNnZ8Axl
 VdkLlVgxGqi+0WWiQrzMmtJxG5msygLqFzjkxLyZTda5UKbRv+sP73n8eoBi8tmO90UL3sACUGP0e
 Fsyod3YSFbrELPGrxzmH+2Lrg992F7Nne6S/UbxHGVCVTOOZyeZI6P2gH/wS8my5OHZyvLxwUkWyw
 rLo8ZIAQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5M7-00H9ZV-9J
 for ath11k@lists.infradead.org; Fri, 21 May 2021 13:38:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 962636109F;
 Fri, 21 May 2021 13:38:17 +0000 (UTC)
Date: Fri, 21 May 2021 19:08:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
 jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4 3/6] bus: mhi: Add MMIO region length to controller
 structure
Message-ID: <20210521133812.GK70095@thinkpad>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620330705-40192-4-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063823_363135_718D3EEE 
X-CRM114-Status: GOOD (  16.11  )
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

On Thu, May 06, 2021 at 12:51:42PM -0700, Bhaumik Bhatt wrote:
> Make controller driver specify the MMIO register region length
> for range checking of BHI or BHIe space. This can help validate
> that offsets are in acceptable memory region or not and avoid any
> boot-up issues due to BHI or BHIe memory accesses.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  include/linux/mhi.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 944aa3a..9c347f5 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -303,6 +303,7 @@ struct mhi_controller_config {
>   * @rddm_size: RAM dump size that host should allocate for debugging purpose
>   * @sbl_size: SBL image size downloaded through BHIe (optional)
>   * @seg_len: BHIe vector size (optional)
> + * @reg_len: Length of the MHI MMIO region (required)
>   * @fbc_image: Points to firmware image buffer
>   * @rddm_image: Points to RAM dump buffer
>   * @mhi_chan: Points to the channel configuration table
> @@ -386,6 +387,7 @@ struct mhi_controller {
>  	size_t rddm_size;
>  	size_t sbl_size;
>  	size_t seg_len;
> +	size_t reg_len;
>  	struct image_info *fbc_image;
>  	struct image_info *rddm_image;
>  	struct mhi_chan *mhi_chan;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
