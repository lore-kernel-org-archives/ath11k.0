Return-Path: <SRS0=pS/N=KQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF635C433B4
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:52:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB7306008E
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB7306008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffzMHlPNwjZOErebUoQZV/6Xb/vS25LowN9kbEJs+Ho=; b=pm3iXtrfrvT1ZZGcs4uPX7PiTa
	Goc77ZUC8aifU51gebzKXzf1zuXotg/eoqCdoFWIATmwLx0tJi095T5c0M9VewMxfnpdQkYEkhnjy
	9Ey5VtNRbWbxhrCt+2Al635gltk5SZ0d73Q1A2zdYrbWeUfEX/5gmH9VOM49YSWruB07pA2dA7n5w
	s+UyHaVPFp3RMsY9FOkwVTNewMe3AgPrAjMX6CbIHziP4CZZ+gVGctaeYzeIp9J6vZ0L3uympS2pA
	XOTJbSwf0PFxd9YTLqmwtftncBPN2HCLjMqES+YIvHC/wziu8xCJEtCDZaPFKFDrx6R+bo6/2g1pB
	M1NHjwqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5ZQ-005fF9-Og; Fri, 21 May 2021 13:52:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5ZM-005fDm-UJ
 for ath11k@desiato.infradead.org; Fri, 21 May 2021 13:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K0BAqM2Z+/gjVByjKaxjVJkytfRj7Yd1x2txMjJbMM8=; b=IxygLJjRwrNkr6WrICaAA6M6dd
 PTcHzb1JqoF5d/4DbEcdcZHGRfQi8CECXS9pHKFU+YKhamDz4AL94eVoesLGZnIICEgvScfA/YEIT
 AZY+629ZM9X3eiyHqf1oi1NjSKZHTc1lhExI8JCvlbEcaeL9jCJmpwt04lzlLYJtGW40c8qxDPlXm
 m2Z/A7WVgtY+iD3ZMGpCHqHGEyQUML5+yCiCXGQeGnYWDkmfKzYiR0vgIFubQ4k7PxF8qRoeCvCMt
 uGmsDgb89vnpnXgttxUTIVwwJ7s8ik4SUsiOvXfqgoKmGyiWyDhQaFwGceS+G7sa/Es40y5EbVtBT
 fF4PmvSQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5ZK-00HAVi-HC
 for ath11k@lists.infradead.org; Fri, 21 May 2021 13:52:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D58E26008E;
 Fri, 21 May 2021 13:51:56 +0000 (UTC)
Date: Fri, 21 May 2021 19:21:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
 jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4 4/6] ath11k: set register access length for MHI driver
Message-ID: <20210521135152.GL70095@thinkpad>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-5-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620330705-40192-5-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_065202_606309_DFE30010 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, May 06, 2021 at 12:51:43PM -0700, Bhaumik Bhatt wrote:
> MHI driver requires register space length to add range checks and
> prevent memory region accesses outside of that for MMIO space.
> Set it before registering the MHI controller.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Kalle, should we do immutable branch for this patch or I can pick it up via MHI
tree (if there are no other patches expected from ath11k for this controller)?

Thanks,
Mani

> ---
>  drivers/net/wireless/ath/ath11k/mhi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index 09858e5..c0f013c 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -235,6 +235,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	mhi_ctrl->cntrl_dev = ab->dev;
>  	mhi_ctrl->fw_image = ab_pci->amss_path;
>  	mhi_ctrl->regs = ab->mem;
> +	mhi_ctrl->reg_len = ab->mem_len;
>  
>  	ret = ath11k_mhi_get_msi(ab_pci);
>  	if (ret) {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
