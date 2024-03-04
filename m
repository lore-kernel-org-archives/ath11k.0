Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BE3C54E41
	for <ath11k@archiver.kernel.org>; Mon,  4 Mar 2024 07:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQA7QiO5dsDPtSSogM1jgwN2Q3Gd/+PdTusKoCBTZx4=; b=cDH40fSxYdxEVAS0YeEZ0JB1Kb
	Dgwy1vJ8J5xqaQ/HBnBeBq9sHlW3vzwXOVyyz35mccfYTP8CyFLIf/Xuc0vKROW+lQGaJpb2oxneG
	ItJeUTHTSdyC8vssRhFFzOjO3OpVt9WF99+j4NvCoZSx/gERBZ/QOu8P0HhfuLS9r3JaBZ2PJWy6I
	YAmp2BwgcK0Sb7KHRhnI9Kp9wQM0U2LYkNPF8/K24KH7QzlQ0buMkuAZxtcA0+Jj2lFc2ZhVJ3+Fq
	dEOlHq08EE2R0xC+z+pIm69H5iaUBpSSJW2/ba1P5HSG6pafM1esBS16/cD1mpTvoiYY8FLOubvxd
	a54wOufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3Cu-000000082Iz-2u4S;
	Mon, 04 Mar 2024 07:57:56 +0000
Received: from mail.kevlo.org ([220.134.220.36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3Cr-000000082Gk-2RZz
	for ath11k@lists.infradead.org;
	Mon, 04 Mar 2024 07:57:55 +0000
Received: from localhost (ns.kevlo.org [local])
	by ns.kevlo.org (OpenSMTPD) with ESMTPA id c0ab81eb;
	Mon, 4 Mar 2024 15:57:42 +0800 (CST)
Date: Mon, 4 Mar 2024 15:57:42 +0800
From: Kevin Lo <kevlo@kevlo.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: adjust a comment to reflect reality
Message-ID: <ZeV+9tS5qZAyDJwc@ns.kevlo.org>
References: <Zd1Muyd8mtA1Hih7@ns.kevlo.org>
 <6bdcffce-e657-4990-bd60-5dd67abbb9c9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bdcffce-e657-4990-bd60-5dd67abbb9c9@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_235754_049572_24164F8A 
X-CRM114-Status: GOOD (  13.81  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Mar 01, 2024 at 08:16:16AM -0800, Jeff Johnson wrote:
> 
> On 2/26/2024 6:45 PM, Kevin Lo wrote:
> > In ath11k_mhi_set_mhictrl_reset(), I observed on QCA6390/QCN9074/WCN6855,
> > MHISTATUS has SYSERR bit always been set after SOC_GLOBAL_RESET.
> > 
> > Signed-off-by: Kevin Lo <kevlo@kevlo.org>
> > ---
> > diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> > index 3de7fa6f88d0..1198e80d9dff 100644
> > --- a/drivers/net/wireless/ath/ath11k/mhi.c
> > +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> > @@ -158,8 +158,8 @@ void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab)
> >  
> >  	ath11k_dbg(ab, ATH11K_DBG_PCI, "mhistatus 0x%x\n", val);
> >  
> > -	/* Observed on QCA6390 that after SOC_GLOBAL_RESET, MHISTATUS
> > -	 * has SYSERR bit set and thus need to set MHICTRL_RESET
> > +	/* After SOC_GLOBAL_RESET, MHISTATUS has SYSERR bit
> > +	 * always been set and thus need to set MHICTRL_RESET
> >  	 * to clear SYSERR.
> >  	 */
> >  	ath11k_pcic_write32(ab, MHICTRL, MHICTRL_RESET_MASK);
> 
> Unless you've verified this is always true for every supported chipset

Only PCIe devices trigger the call to ath11k_mhi_set_mhictrl_reset(),
and I've verified this on the QCA6390, QCN9074, and WCN6855 chips.

> I'd rather more accurately say something like:
> After SOC_GLOBAL_RESET, MHISTATUS may still have SYSERR bit set and thus...

Okay, I'll update the comments as per your suggestion, thanks.

