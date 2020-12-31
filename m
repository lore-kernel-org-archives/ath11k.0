Return-Path: <SRS0=7VVY=GD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA6DC433E0
	for <ath11k@archiver.kernel.org>; Thu, 31 Dec 2020 06:48:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E78F22262
	for <ath11k@archiver.kernel.org>; Thu, 31 Dec 2020 06:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E78F22262
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5z9ET63E6GAYJXn/FyfB/g5GxhUeID1t/jHrpdNAsg4=; b=u55eqkPIX/OfkQbpwa8MHuiWP
	WkCfNFDYZnkQPbxU5x6Hx9Uk2ebEOSroWwWMVoqjA2N9GrO1OoSiFHZyJM/EoXoCWbGq/XH7YzCnR
	O2O4aL5KB55z3D+GUU3GhSAT/kdjQIBJccib+yUs1PauxQN9Jrb1MSLr3dQHo25hsd0NdcCzwepap
	5OykgZYIPGvce7qoCJBKBD/+Tzh6YpG72G1Y+Ffi2bRDV3UMIl5MH1aEN/mzgITR0Td9gXeoP0z+H
	Esatapo+iz/vjSakJNXdrMwZfESY3a3jkriD6k8Almq88kEnjSxPTKyxhvvbRFJLSFxIfKo95jasW
	D9Z2Fl72w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kurl0-0003dP-1G; Thu, 31 Dec 2020 06:48:22 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kurkw-0003d0-Ee
 for ath11k@lists.infradead.org; Thu, 31 Dec 2020 06:48:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id t8so10834777pfg.8
 for <ath11k@lists.infradead.org>; Wed, 30 Dec 2020 22:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3pSOoazkdWnac64m4qyGWl6qnqkGX2eN81drYC7+T9w=;
 b=nALCS3xfpAXFMm6zICJql2rGHdsSutJBzPYzkaxgyTIIpfLOWv4Fa2hUU38UADIYzE
 AkQC4TW1J2wLILE/Cz/Y+27422arhSvTd9c+/jG0aHUCl+yKNtUF3YUUBU4wv079zuVB
 /B8AeORiZLX4kFs6km1QabcemFq5rBONnwMsdRMsF47rYRVykPN2XMI6c2Q7EkZo7hTm
 LTxhE5mflFM/6bd50gCpV8rPpzJLm9zry9LFTJhmDUoNu1i9xSb/BByGj3Iu+W9yR2SM
 daMpVN+jZWUGNFkAU9m4YYsEnl/ABzgcOjP4rbXX+6yinpkapKIJFdx0GiTCxBGhfVZ6
 fkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3pSOoazkdWnac64m4qyGWl6qnqkGX2eN81drYC7+T9w=;
 b=HkYEVzEd/kQo8CdFT/c/jJK1zUrKVhkEfj7doXg6d+8QKMiepP/DAs5oJNBvTl6Zj+
 Cejdbcjjl1bVtUROteX3NWMOwIZIrhTLscOfWdzxseMUGFzGrz6VnnZs+hcFNSTVZ/xf
 dn0L+Um6tGI/vTxUzEeazGOK0vGUlLP7zxv3YtQkaGiXNByQkibvAshzymZc/XnUALn+
 0kLTWZ4LIua+9XwDHYwggXA2QYvnAqUCBa1bGZrjoDxnFUzBrYM0cpdr+R/Pdyl2JjBa
 dr5I91Nvg0qDuhjsoREzEZ+JeI1Z+0KK59/vcPBtKaORYdu3F00nyJLFADmIxIuxO0mr
 THeQ==
X-Gm-Message-State: AOAM531wWq1f540uLOeyqJLjbdCiu9iE+yjBq2Ywbl1NozEdMU+9mBBi
 2Gk6VsCcSl6L/hcoZ5X1oDJP
X-Google-Smtp-Source: ABdhPJwK8nQFdrE7FATvAE5N0ASB+cmqME7rTCsP+K7xJcznXPi9SlR6c6IlWOAULPzCwsjqeV2pkQ==
X-Received: by 2002:a65:67cf:: with SMTP id b15mr55145723pgs.429.1609397293473; 
 Wed, 30 Dec 2020 22:48:13 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
 by smtp.gmail.com with ESMTPSA id x23sm53673540pge.47.2020.12.30.22.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 22:48:12 -0800 (PST)
Date: Thu, 31 Dec 2020 12:18:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH v6 01/10] mhi: Add mhi_controller_initialize helper
Message-ID: <20201231064805.GA4006@thinkpad>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
 <1609231431-10048-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609231431-10048-2-git-send-email-loic.poulain@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_014818_791514_E09C84D5 
X-CRM114-Status: GOOD (  20.28  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org,
 bbhatt@codeaurora.org, kvalo@codeaurora.org, hemantk@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Loic,

+ath11k, kalle

On Tue, Dec 29, 2020 at 09:43:42AM +0100, Loic Poulain wrote:
> This function allows to initialize a mhi_controller structure.
> Today, it only zeroing the structure.
> 
> Use this function from mhi_alloc_controller so that any further
> initialization can be factorized in initalize function.
> 

I know that this has been discussed in earlier revisions but I'm still not
convinced to have 2 APIs doing a similar job. Since we don't have any usecase
currently to initialize extra fields other than the struct, we should be using
the alloc_controller API.

If you want to have a devres managed allocation, then the API should be extended
as below:

struct mhi_controller *mhi_alloc_controller(struct device *dev)
{
	struct mhi_controller *mhi_cntrl;

	if (!dev)
		mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
	else
		mhi_cntrl = devm_kzalloc(dev, sizeof(*mhi_cntrl), GFP_KERNEL);

	return mhi_cntrl;		
}

In this case, the ath11k MHI controller also need to be adjusted but we can use
the same immutable branch way.

Thanks,
Mani

> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 6 ++++++
>  include/linux/mhi.h         | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 96cde9c..a75ab8c 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1021,6 +1021,12 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_unregister_controller);
>  
> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl)
> +{
> +	memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
> +}
> +EXPORT_SYMBOL_GPL(mhi_initialize_controller);
> +
>  struct mhi_controller *mhi_alloc_controller(void)
>  {
>  	struct mhi_controller *mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 04cf7f3..2754742 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -537,6 +537,12 @@ struct mhi_driver {
>  #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
>  
>  /**
> + * mhi_initialize_controller - Initialize MHI Controller structure
> + * @mhi_cntrl: MHI controller structure to initialize
> + */
> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl);
> +
> +/**
>   * mhi_alloc_controller - Allocate the MHI Controller structure
>   * Allocate the mhi_controller structure using zero initialized memory
>   */
> -- 
> 2.7.4
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
