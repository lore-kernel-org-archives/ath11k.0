Return-Path: <SRS0=mR4F=GY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DD4C433DB
	for <ath11k@archiver.kernel.org>; Thu, 21 Jan 2021 07:53:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697D623356
	for <ath11k@archiver.kernel.org>; Thu, 21 Jan 2021 07:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 697D623356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eM5p/00mqcJkMUiUCHcMn3S4xjXkEKeBmeUtX6r+XRw=; b=UcRT6Qh9Z19bweyXYAcyi5Vr5
	RYfZu0HdQ/Rk4wFXt2qefY6Ogx2hIY/dcFv83rF4iBhI3kN/ib79ObFQrqVbrFFuOE1T4t64bNKQ8
	bCP/WHLO4eFAIIP21XpJ4HO9Fiz36EUsW27lMjdzCD96xeiW+A4b15R6XGxapuXbze1Yn9WSPMLnH
	BoUT7CbMVe3TH8+8sIE4kirj0tgzndNHFwNSyLhwqGt4K8NtwC+hELIdgy6MsUFXGaUZvjEGqA9wn
	xGEZ8sQRhgufluAZNNuIOP+qkKEk46a4qhNMww/+netPm+cS16T3GeGl7HbawQF9cfwsBvqhlUU94
	mcEmzRL3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Uly-0007xJ-FU; Thu, 21 Jan 2021 07:52:54 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Ulw-0007wi-18
 for ath11k@lists.infradead.org; Thu, 21 Jan 2021 07:52:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id i5so868850pgo.1
 for <ath11k@lists.infradead.org>; Wed, 20 Jan 2021 23:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dT9+H7Wn+xe3mxpnUyhf4xC/aOE8YkVdW3Zd3U5DkAE=;
 b=mgoKd1TUDtE9hpIY2dItKRVTwAcV6hUUtfa5S384O/FDwQveLM9dbdNMgBMHXV0JbG
 Scoce0JJnigfMrWhJ/5Zg2dvzes1eDyDWrjhKjuSv7OTaZLpTyIKuOtqK38kCZEGpLl3
 DzmfRwnLnWLoJmG4zCMe0lRaMZnnT/iV0Glsy9uHBuBpY1P6aoV8XcgxyR0hpuDRHXjQ
 5xEknotM20Ptm9ZSx1y59mukcLOpGZ04VFvfECdP1IRblEIZTTQ1VCJl3aQKWYcEEwR7
 3P02mMSI2Q8ikeGCg+i9VOBcJ+nN31UFbexf7pFXYyd78pdAZXsrgZqTSzgyN73Wo4jp
 MT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dT9+H7Wn+xe3mxpnUyhf4xC/aOE8YkVdW3Zd3U5DkAE=;
 b=Hb8Bcssl0Msuk0fEEDB4+rUq1mwJ4mYGnx/8VcvIf8Tgfqr2v1kmvOrSsnoFg/8wEO
 xNm85UDXDCpCknKcEXFzQYwT+xBVXCxhJmroTYcTOm9cTK7CkRXHtT9qlhUeSwNaGJEL
 wJxvQOmKXEeftAOecZ7hT1u5xl/TrE4/B9cWaw8CZ6RdFPBbmfjKVu7vk+5nXeMtp7jG
 5CnwOi5aSfwVmbrV4UWlD35uVcihGcb/ms4U/DN8KpTFK4S+xW+G8JIdH5la4D0L39vS
 6lscSg1J2UZRickwh5TnY2bQTbhdTyE+90i3GYyMB/mOiZISFrukbsRyBKIuLfEShbl4
 5uig==
X-Gm-Message-State: AOAM5323CLgWUY8vgg//Wp2DHUYIpfsL2AlVsKglo6Azl9ykYVnmcKGW
 Lk/y85plvDjw4/daxDaEkjOa
X-Google-Smtp-Source: ABdhPJx/nzxnmS/57IY8S3HyB80kjVJ1GniNQmxUlfCxDq6JD4rdGp1huhlfoy3elXUD/qnM2O85yg==
X-Received: by 2002:a63:e14a:: with SMTP id h10mr13372799pgk.297.1611215568647; 
 Wed, 20 Jan 2021 23:52:48 -0800 (PST)
Received: from thinkpad ([2409:4072:6182:23c4:4d5:e6d9:fc7e:c8e2])
 by smtp.gmail.com with ESMTPSA id i6sm4685076pgc.58.2021.01.20.23.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 23:52:47 -0800 (PST)
Date: Thu, 21 Jan 2021 13:22:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3] mhi: use irq_flags if controller driver configures it
Message-ID: <20210121075242.GB30041@thinkpad>
References: <20210104101128.8217-1-cjhuang@codeaurora.org>
 <20210104170359.GE2256@work> <87o8hti8t8.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8hti8t8.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_025252_182533_83F4EADC 
X-CRM114-Status: GOOD (  20.69  )
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
Cc: hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 09:40:19AM +0200, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > On Mon, Jan 04, 2021 at 06:11:28PM +0800, Carl Huang wrote:
> >> If controller driver has specified the irq_flags, mhi uses this specified
> >> irq_flags. Otherwise, mhi uses default irq_flags.
> >> 
> >> The purpose of this change is to support one MSI vector for QCA6390.
> >> MHI will use one same MSI vector too in this scenario.
> >> 
> >> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
> >> is requested. The reason is if irq migration happens, the msi_data may
> >> change too. However, the msi_data is already programmed to QCA6390
> >> hardware during initialization phase. This msi_data inconsistence will
> >> result in crash in kernel.
> >> 
> >> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
> >> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
> >> 
> >> To avoid above two issues, QCA6390 driver specifies the irq_flags in case
> >> of one MSI vector when mhi_register_controller is called.
> >> 
> >> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> >> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Applied to mhi-next!
> 
> Would it be possible again to have an immutable branch for this commit?
> We need it for implementing one MHI support to ath11k[1] required by
> Dell XPS 13 9310 laptops, which a lot of people are waiting. Otherwise I
> can only apply the feature for v5.13, which will be released on July.
> 

Dropped this patch from mhi-next and applied to mhi-ath11k-immutable branch:
https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-ath11k-immutable

This branch will also be merged into mhi-next.

Thanks,
Mani

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
