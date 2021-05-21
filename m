Return-Path: <SRS0=pS/N=KQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A219AC433B4
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:52:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 731356008E
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 13:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 731356008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYxjbR2b3c4guzOo0+FbN/XNSWG4zUKoIDqtfsRbG1Y=; b=Hj8lJ/P2uVmAY7CdQv0c6u0F4l
	C2L6NGdtwXgdMHHQttz5sK4IrgdU0m/oMOVJ65iMIoXp+rNzzii4o8kEaRYRHNB2YVU5jTq4sDNNo
	9hvzJzcunEGrmoq2pJCYm9/5jj0uZB7m1d+McB60FfPMNp3PoRQeQmh1nUOUUp5WF3fJNVlSMIXOK
	ibBZwzYhv0AvkazMJKh8q/ggov22X+rN9nkEpnLy5UbI9Dg6LnydNbzp7TK1pmdzVh3qWnUxmXW81
	3bfv8VtjOjO1W2N3nkhCUhfBbr54/MYsXhadfTV/KuPRFRaZuYy4pSRfI87n6QJT4Fcve+55YkAa3
	O5in+BFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5Zn-005fOE-Rs; Fri, 21 May 2021 13:52:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5Zk-005fN7-LL
 for ath11k@desiato.infradead.org; Fri, 21 May 2021 13:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TcwP1dX6Hmmu0yeIeVFrztjTkgb6kTE/rM0lZcvtSG4=; b=wDWZ8MCKPhZP4JkejbcQLHI2NV
 XM/54kJrT5pmxr7NSjNii6gGDdEn4FkAFxTnrw22XAZ7VPF74oOlozuy1qATCSvw00ZbW2yIG4gzy
 4N/WStp8la9lfpzRoFlDhjcMqypwL0F/2Xl0/rJvCB+3Lcj3rG6bp3TLZ/dnHaXvva+xgfhKWAv2S
 6131ES1/oD1S7SXW1d/soELspLbAfGTsfog2sfXIg4MKqXDm8NxrrH3w5DTe4kfAhPSJDtjVzRNxe
 v5b95BlhkwxnjRSDrkrJQpQ8d2FLNx+5RsoZrKgTw5/2ihLynjcW+3EYdGjRQW3tu//L9pJ4nCF54
 hbfiTBRA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5Zi-00HAYi-7P
 for ath11k@lists.infradead.org; Fri, 21 May 2021 13:52:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 191086008E;
 Fri, 21 May 2021 13:52:21 +0000 (UTC)
Date: Fri, 21 May 2021 19:22:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
 jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
 loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4 5/6] bus: mhi: pci_generic: Set register access length
 for MHI driver
Message-ID: <20210521135218.GM70095@thinkpad>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-6-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620330705-40192-6-git-send-email-bbhatt@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_065226_307543_2F3E2792 
X-CRM114-Status: GOOD (  15.88  )
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

On Thu, May 06, 2021 at 12:51:44PM -0700, Bhaumik Bhatt wrote:
> MHI driver requires register space length to add range checks and
> prevent memory region accesses outside of that for MMIO space.
> Set it from the PCI generic controller driver before registering
> the MHI controller.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 7c810f0..fb7889f 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -463,6 +463,7 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>  		return err;
>  	}
>  	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
> +	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
>  
>  	err = pci_set_dma_mask(pdev, dma_mask);
>  	if (err) {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
