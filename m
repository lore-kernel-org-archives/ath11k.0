Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2753C41513
	for <ath11k@archiver.kernel.org>; Wed,  9 Aug 2023 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5Gg5UX0HxmoM9/bdCmPkhbHbILKV1lNkWPuQ/gxaZg=; b=LP1Sahxsp2qRRb
	WL45WWuYCf01cNX3F9UkUD3geDeKptA0pj7gdSDkRA90BaLWHOUc2ihZM+hk0tq2kszYp1CXB8QA8
	6apBhZD+yPrHikKchPJFyrfF4u3StQjBkj3Z3rzzSRvHcoPNHkqEIHBjGWSSJBwQ/3y+0h8e32nQ8
	vVD9aRgBylopq5iIrylGe7gQFVAZp0AzWalGn9EZPaOoXroSmrpdza2N9f7gTnr2zCsRNpMEX0fPC
	c9ZEivebz8nvr8nPwrp9Mg8HMkjM6MHb9rEjX5AbHJ4rsoUpjR+h3NBKxHbmP4q1ybLCdXw4OAHPK
	h8WwLzajeZBL0y93QHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTfIb-004RN4-0m;
	Wed, 09 Aug 2023 09:16:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTfIY-004RMl-1b
	for ath11k@lists.infradead.org;
	Wed, 09 Aug 2023 09:16:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 888C763093;
	Wed,  9 Aug 2023 09:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4BDC433C7;
	Wed,  9 Aug 2023 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691572569;
	bh=9V4zZTiTx/OUaeehWA5kos6hj9j4FO0wAOEIeQtMA0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=plM/dt4FUnY/BBMbowR2boeB0PV2QPQxyJhZWIUWFBYzFaHbWiSy0uAVukIIRxIJj
	 Qbs5YH5fxisix6kwrqU+A9qH+YaVPi4wvt2UXE5876MpaOutCmLxqZdvV5X6XmHYj0
	 pPNm1/Ov+grRbI7yNXDvXz38ZTXsEkRFEV3dN+1n+w6Ztvj4vJqYsHe7yYksDl5ELw
	 CjG7hf1UbkWJXvJZLmUt/qXmb8XuuW6q0qAsEzAKpOHQGJw/gNiIg6zwtD0w6Vzv5z
	 JKedvArhKS0Gt0WXPkoZcRrMjMJbrLG7vMPGQCpNUb0ajckB5MiyhxHRYKgeN/SYCX
	 lEuAGgjvQAe6w==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qTfIU-0002lc-1l;
	Wed, 09 Aug 2023 11:16:06 +0200
Date: Wed, 9 Aug 2023 11:16:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "Revert "wifi: ath11k: Enable threaded NAPI""
Message-ID: <ZNNZVsFb3_Dt_NMb@hovoldconsulting.com>
References: <20230809073432.4193-1-johan+linaro@kernel.org>
 <42f78c02-1ddc-cf1c-694f-abf9059dfb60@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42f78c02-1ddc-cf1c-694f-abf9059dfb60@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_021610_596479_8BF6275E 
X-CRM114-Status: GOOD (  19.20  )
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

On Wed, Aug 09, 2023 at 02:32:37PM +0530, Manikanta Pubbisetty wrote:
> On 8/9/2023 1:04 PM, Johan Hovold wrote:
> > This reverts commit d265ebe41c911314bd273c218a37088835959fa1.
> > 
> > Disabling threaded NAPI causes the Lenovo ThinkPad X13s to hang (e.g. no
> > more interrupts received) almost immediately during RX.
> > 
> > Apparently something broke since commit 13aa2fb692d3 ("wifi: ath11k:
> > Enable threaded NAPI") so that a simple revert is no longer possible.
> > 
> 
> This is getting as weird as it would get :)
> 
> > As commit d265ebe41c91 ("Revert "wifi: ath11k: Enable threaded NAPI"")
> > does not address the underlying issue reported with QCN9074, it seems we
> > need to reenable threaded NAPI before fixing both bugs properly.
> > 
> 
> It seems that the revert has actually solved the issue reported with 
> QCN9074.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=217536

Sure, but it's only a workaround as the underlying cause has not been
identified.

> We were trying to reproduce the problem on X86+QCN9074 (with threaded 
> NAPI) from quite some time, but there is no repro yet.
>
> Actually, enabling/disabling threaded NAPI is a simple affair; I'm 
> wondering to hear that interrupts are blocked due  to not having 
> threaded NAPI.

It sounds to me like the driver's locking is broken if moving to softirq
processing hangs the machine like this. But I have not had time to try
to try to track it down besides verifying that reenabling threaded NAPI
makes the problem go away.

> What is the chip that Lenovo Thinkpad X13s is having?

It's a WCN6855 (QCNFA765).

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
