Return-Path: <SRS0=ylbk=LY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24998C11F65
	for <ath11k@archiver.kernel.org>; Wed, 30 Jun 2021 13:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFE061455
	for <ath11k@archiver.kernel.org>; Wed, 30 Jun 2021 13:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCFE061455
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEJXkSQRqRgvE27terJm9biAAwx0Y61PrjIPgVroy6I=; b=acuhcdqno5XITr
	crR+MzcAEobHBZptWEFMu7UDlCReuHHgHHBGD6Zzz17N8NFK0mqv2JRLUOidgNedFF/TPnl0hfP7S
	1/QWRxIMN3Kx2wj67zQO0kQg1vDNVIwYZ5cb7aWI2fdvMG5PkXXdGNn8zfY9myqAiXn6anOx/T1kn
	Mlagr13c5tAtutHSCVIAe15me5yr8SRM51J+1zdzWf8dihk4alCglIemSosSHXIsNaQU7c7LrhZjp
	zBiTUi++X7+LntZkRt8YtYaFGTgUNVlGIZC9EWr+j2Ysh0RR/sinpidSj5rl2n5JMquCH/8XpJwcG
	JmfMSYQdRqdwpBU8a/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lya5T-00DzOG-9J; Wed, 30 Jun 2021 13:17:07 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lya5P-00DzMT-TX
 for ath11k@lists.infradead.org; Wed, 30 Jun 2021 13:17:05 +0000
Received: by mail-pg1-x530.google.com with SMTP id w15so2197242pgk.13
 for <ath11k@lists.infradead.org>; Wed, 30 Jun 2021 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fgdFcWlgoPypBIRoYUde3N58e9Twt3JB/QiM0lXDUWI=;
 b=RJFbHULSsaCe2wRav93soy+7dgaRoot7nNDKvGe754HFdzty/DNF19Bcuq/sZzsB7m
 kfYO3Ph5p/aW7ODv4rj1iGGZ+E1hDntDeZ6N8VCj15UtFJqIlviSZgLsPoRKORiBHntk
 IRT8ULCoWkFWyIQaogamNDT4YjjjtVKosyrIlu4+Le5nocHse11/b96jqr4mwlrLHgOj
 qatNwWNz+ktQYbAPA+30fpryZ1aDkFkglOqeLfLL29HLLRg5xKUV0zdJVzd8wAmmm6xD
 A48AR3p/O9qf8F/EiK22xuv68R6FUvZdLeh6EGQY0YDjiG+o8JyGtKMC2rivNb5HXw3r
 w9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fgdFcWlgoPypBIRoYUde3N58e9Twt3JB/QiM0lXDUWI=;
 b=ZgXlo+3MAINI707Zbo6EEa+oOjeh6nw/WEOnJFpLyYDcI3RgJB7Rc0ffBePhtly2y8
 Epgu6wJn0x1efeUZFT5r1lu+flnkX2aBZkpKFwNMGeG/0zDM2cjmezocKyHMEBUTRX5W
 NSzUrm0j4cxcJYwg3OkUVzah1swJ/60cTT2Kj+z+gRxhd48ZzQCJNtrexwzRB+RZhUbr
 XreojDs79lZY7wSpJjdbnM/DWbSYd4zlBZjuTLUycnlPYTaJyKN/fN2fcsEFOlFvVjGr
 VZD/TF7YvveisOBVe7ajZYqXkNrBLMQslC84HaaXfPIFvju1R/CVp6AEed1bFboE0kyV
 nCXw==
X-Gm-Message-State: AOAM533mbdBcQSAcqhq+ACfLUxCKE9Gu1EGuvOJGef+nzMBprKA6+fOa
 7tIGyVz53/IIcnd9BGb1Jgqv
X-Google-Smtp-Source: ABdhPJwP08UOveU6IrebsAzxULeGoj7rDhUudmYe3gn3bDi3yRcY6TAhgxW2TZAG7ZmtikkGUFkRyA==
X-Received: by 2002:a63:5153:: with SMTP id r19mr34252156pgl.56.1625059021948; 
 Wed, 30 Jun 2021 06:17:01 -0700 (PDT)
Received: from workstation ([120.138.13.102])
 by smtp.gmail.com with ESMTPSA id k8sm13349323pfa.142.2021.06.30.06.16.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Jun 2021 06:17:01 -0700 (PDT)
Date: Wed, 30 Jun 2021 18:46:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH 00/10] MHI patches for v5.14 - Take 2
Message-ID: <20210630131656.GA18484@workstation>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_061704_011777_307EB766 
X-CRM114-Status: GOOD (  25.15  )
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

Hi Greg,

On Fri, Jun 25, 2021 at 06:03:45PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Please find the remaining MHI patches for v5.14. This series has the left over
> patches from the previous patchset and one new series that was reviewed a
> while ago and put on hold for Ack from Kalle Valo for ath11k.
> 
> Summary:
> 
> 1. Added validation for the channel ID read from event ring. If we get events
> from an invalid channel, we throw an error message and skip the event.
> 
> 2. Fixed the MHI wake routines used for the newer modems such as SDX55 and
> SDX65 by using no-op routines only for the older modems and then relying on
> the default routines provided by MHI stack for newer ones.
> 
> 3. Added support for processing the events based on the priorities. Earlier
> a fixed priority was used for all events.
> 
> 4. Added a dedicated flag to the MHI client transfer APIs for inbound
> buffer allocation by the MHI stack. Since this patch modifies the MHI
> client drivers under "net/", Ack has been collected from the netdev
> maintainer.
> 
> 5. Added support for Cinterion MV31-W modem in pci_generic controller:
> https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high
> 
> 6. Rearranged the setting of BHI/BHIe offsets for better validation of the
> register values read from MMIO
> 
> 7. Cleanup of the BHI/BHIe pointers by setting them to NULL to prevent access
> after power down.
> 
> 8. Added support for getting the MMIO register length from the controller
> drivers. This helps in validation of the read offsets from MMIO registers.
> Since this patch touches ath11k, Ack has been collected from Kalle Valo.
> 
> 9. With the help of above register length, added check for BHI/BHIe offsets.
> 

Is this series on your queue for 5.14?

Thanks,
Mani

> Thanks,
> Mani
> 
> Bhaumik Bhatt (8):
>   bus: mhi: pci_generic: Apply no-op for wake using sideband wake
>     boolean
>   bus: mhi: core: Validate channel ID when processing command
>     completions
>   bus: mhi: core: Set BHI/BHIe offsets on power up preparation
>   bus: mhi: core: Set BHI and BHIe pointers to NULL in clean-up
>   bus: mhi: Add MMIO region length to controller structure
>   ath11k: set register access length for MHI driver
>   bus: mhi: pci_generic: Set register access length for MHI driver
>   bus: mhi: core: Add range checks for BHI and BHIe
> 
> Loic Poulain (1):
>   bus: mhi: Add inbound buffers allocation flag
> 
> ULRICH Thomas (1):
>   bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI
> 
>  drivers/bus/mhi/core/init.c           | 61 +++++++++++++++++--------
>  drivers/bus/mhi/core/internal.h       |  2 +-
>  drivers/bus/mhi/core/main.c           | 26 +++++++----
>  drivers/bus/mhi/core/pm.c             | 28 ++----------
>  drivers/bus/mhi/pci_generic.c         | 65 +++++++++++++++++++++++----
>  drivers/net/mhi/net.c                 |  2 +-
>  drivers/net/wireless/ath/ath11k/mhi.c |  1 +
>  drivers/net/wwan/mhi_wwan_ctrl.c      |  2 +-
>  include/linux/mhi.h                   |  9 +++-
>  net/qrtr/mhi.c                        |  2 +-
>  10 files changed, 134 insertions(+), 64 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
