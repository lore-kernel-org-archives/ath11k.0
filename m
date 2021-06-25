Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B098DC2B9F4
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 13:03:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 802EF61929
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 13:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 802EF61929
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6rp0oFEDRlKufGVUA+85rFj1+zh5NsjmajDFu2TeEw=; b=qmf2WO3z28L7OV
	4KIbKB8WI6SZI4Pg/OXOQEVFLbEOCQP82fxVkNV4EPYpf7wAu4mfMU7WvczmWbgwaa9We2KMtdfuC
	4bUIa85b5vkaS+hV74YZdxQ6OsIBJa/S90WM7o15Ee7sAFqk6kWnQDTnZzAd/yxClyZYkQp+gnJST
	Q3R0R284QcPPNAzgneZDWhq+pvH7XZCsvZn7SVNK3QvgfsiJOEsM0kQSpBHq3ZbutwxL+qlCQH84F
	Cbc9fGcOxKMApW6aCgerTA62/JHqn7emK+P434JRc6ceCQ3JbfNlaqs3qi3fZ98GlD6vzMc9E8Wzg
	PTnlzOv9GSAUYMKw0HIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwlUx-001aGp-05; Fri, 25 Jun 2021 13:03:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwlUt-001aFy-Pg
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 13:03:53 +0000
Received: by mail-pf1-x429.google.com with SMTP id y4so7976428pfi.9
 for <ath11k@lists.infradead.org>; Fri, 25 Jun 2021 06:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Rtsnu8VD33EKMaZf3cpQ8efCBZxp+xhAKR5JoGpX5Eo=;
 b=QyicnVxC5A1fEGp5XtFu3wD2OgDufaG+KE0JJ9KpzGa7lNZMm/POMik2AXOxX1zkTG
 3J1IUFt9eeLSs/W1TxbtnzkxWiHFHRoseNrxBhaRZHMOz6MBCT6fQt7ROrqIOUqttUZw
 QU8itF6xaMwH0rMf7sAxh58f2tTPEKeert6XLTeTlx+kPxk4jBP6NSAlQUCkl/f4Rl/o
 tvN7rnm43Rwy6RxxZbZnRGq2tHOSGNX4NtjwUxcvJixa4Efap/fpKanlZ1kQGKEU1pLX
 z1blAIpYshe2WZpwUDCgSw2TaFR3hgGkF+y0iIHjiodOYRZzn+PQyEuiGu3LF/YpNVya
 xC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rtsnu8VD33EKMaZf3cpQ8efCBZxp+xhAKR5JoGpX5Eo=;
 b=jcEfDdX4hq6y3Wm0WmTtvYohnS2Vngwv/kTBQObRDC3phKko4/ppCPPu0ESsAynZCm
 1UGExdrT6LwUYN3pjQLq3bZ5kxyCcG0I3iDIBGfiPs90leIeboxjWtyHUiX5jD1yN7EH
 Z825dxYA0hPorQYUzJX01vyLOND9XsyhRdjEGRkitDqDgu919wGP3JxkdRDclBymqpNe
 QWL6TIDDWFmDYO9z2VmbW1cl/zMMt3kJYpI985nrWRYBfESJf+iILzOuIAx+T3YvwiRG
 jXWpqoloMfWWTHCJELVTZxL2FJevGuMM78YwusEcYLmT0lF4SXx4AyGbVlZu5IQjMoIA
 Y1pg==
X-Gm-Message-State: AOAM533FbrrTgRrcGMkR9DIKDfQ27R33JN3hRZhd0M6fBTRUdp8BtZGe
 0pyYij6VFNN6Qc5SiEyDSd9K
X-Google-Smtp-Source: ABdhPJwUAHDHJd41dGZtRGQ/ranfWCHDBM1qzYWPFiEQHKE+umUBbxrpcg2Kbl/SsPWdegV92WZ1kg==
X-Received: by 2002:a63:185b:: with SMTP id 27mr9809644pgy.164.1624626231083; 
 Fri, 25 Jun 2021 06:03:51 -0700 (PDT)
Received: from thinkpad ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
 by smtp.gmail.com with ESMTPSA id e4sm5903958pfa.29.2021.06.25.06.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 06:03:50 -0700 (PDT)
Date: Fri, 25 Jun 2021 18:33:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 stable@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 06/10] bus: mhi: core: Set BHI and BHIe pointers to NULL
 in clean-up
Message-ID: <20210625130343.GA13833@thinkpad>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
 <20210625123355.11578-7-manivannan.sadhasivam@linaro.org>
 <YNXOYkj9TWZgYAG3@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNXOYkj9TWZgYAG3@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_060351_879924_5B960D62 
X-CRM114-Status: GOOD (  13.93  )
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

On Fri, Jun 25, 2021 at 02:38:58PM +0200, Greg KH wrote:
> On Fri, Jun 25, 2021 at 06:03:51PM +0530, Manivannan Sadhasivam wrote:
> > From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > 
> > Set the BHI and BHIe pointers to NULL as part of clean-up. This
> > makes sure that stale pointers are not accessed after powering
> > MHI down.
> > 
> > Cc: stable@vger.kernel.org
> 
> Why is this needed for stable, but patch 5/10 is not?
> 

Shoot! This one relies on 5/10 and fixes a corner case where the BHI/BHIe
pointers might be used after MHI powerdown. But this requires backporting
the patches 5-10 cleanly (a series).

So I guess the stable tag should be removed for this patch. We will test this
series on stable kernels (on how far) and make sure this doesn't break anything.
Then we can share the commit IDs to be backported with details?

Thanks,
Mani 

> And what commit does this fix?  How far back should it go?
> 
> And is this really fixing anything?
> 
> thanks,
> 
> greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
