Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1476AC2B9F7
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 16:25:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4F6C61402
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 16:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4F6C61402
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8UHS+e1RbQU9b/BcUhHxXxmq0unwfUHQzmQFHig7tk=; b=d8YMx88HQMClp1
	RqMIBzwgmWP9rBgjER2CyM0pZMyqkFLB+ijvyM7b0sUc4pH0J5vzk8v9WAOSNMnVTnJ4Nk5B843/t
	p9ZCXXFLn8zGl/2Pnh0ZK+oC3ml9XRBnKSdgqMWb6DGeVnwc/B+zPF1mXZPio0xgAZa8CK8oVxMCK
	zNzZuU1vtRDxm7L5bjN8aRvjnyshGZDaOPVyzuaaZE4QZLB1WwhhgU68V1PBQF1+VEu1a0Rn7yTip
	QMcdApCY0PvmrbJsUGzgfbPPfClod3nJ9tH8AnJQuf56WXnw/upsuNm8MfulqNtj5U4qefkKSM6aM
	j7xg/MQqiIQEoNMEajog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llDO7-0015rs-KT; Mon, 24 May 2021 16:25:07 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll6BJ-000m8W-4E
 for ath11k@lists.infradead.org; Mon, 24 May 2021 08:43:26 +0000
Received: by mail-pl1-x62f.google.com with SMTP id v12so14267942plo.10
 for <ath11k@lists.infradead.org>; Mon, 24 May 2021 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MjMSw6JkJ3i+fscbkM2syJzOK3oeShi36fMtZEjyMNs=;
 b=nohoYVKtZXuHTwTn3O8RxPNvaAdv5rJX7Zo8d90Wii3cPlFrjzdoDpSQoC7IHxEaCU
 DcZhtSHAmxLE1GpFjM0WFDWJXinPAEOcEgD9VrVFWeuUmTK6dhRY3XYsVFrLg71xLx6n
 tRCu3Xj5l9V8dMf8y+/hfkQh23Lq2TyslSG03i0fBXscXS9xmiJGr2NUsoVIkCs+Gm6N
 8G7UwzQo89K0NHgiHr3CBOKGB5rhH3diq9oazfAyFAgGMogJXpHqCcDkyEhrRdIUqs42
 6jA1T2OXYEyi5iBCqv8UK3+g4h0D6+ESHpNdBua38AjwgqZKtQE7j5xrX6AB9hsduB44
 sK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MjMSw6JkJ3i+fscbkM2syJzOK3oeShi36fMtZEjyMNs=;
 b=QQyWL9ZDxOSfhwoMBA1NXewJST7gE/cVEMepttP0+fWHIdl2EALNDtPSVWIx3C9R6U
 PYtjsFkgPZLejzhMilYqLxpmYN7n7/6u8OXcj7MMJoLeyYKKpF1S/Xf0mhjZnvHwMOq1
 b3A4ahz4tROjaOOE9GDzpNq7x1LmEC/L6NsCdqU6IGEnCEZz85r+1mDNj/lzTyTx5zHi
 Dpz0pwUMV/pl0vOVpWW7op85Lq4jyWwtqKN2gHBumtMZIuZaeZ3LPO349c6DxJKpDgqA
 mvPnMQOtPWUe1lo4jS5PPAVv++6i7thjitqfyjqAtDPMw8KjEubrsM+Kfflb4ZeeK/Ps
 EQgg==
X-Gm-Message-State: AOAM532Pa+EWr5tUtrVS455xy45mkwsEmJw3zWnwGfqZ4okK+bWJR1Xi
 4QiCCINhkKZg05KbVKcC6EGI
X-Google-Smtp-Source: ABdhPJxkPjTW5y7cL79NQ02rVczpjAotpBArCZGu1B5M/vZwN1ohB6tRfUPnfVcMZZ/YTL3HOcGZbA==
X-Received: by 2002:a17:90a:520f:: with SMTP id
 v15mr23501633pjh.23.1621845802722; 
 Mon, 24 May 2021 01:43:22 -0700 (PDT)
Received: from work ([120.138.12.242])
 by smtp.gmail.com with ESMTPSA id q3sm10629201pff.142.2021.05.24.01.43.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 May 2021 01:43:22 -0700 (PDT)
Date: Mon, 24 May 2021 14:13:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Baochen Qiang <bqiang@codeaurora.org>, hemantk@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: Wait for M2 state during system resume
Message-ID: <20210524084318.GA27389@work>
References: <20210524040312.14409-1-bqiang@codeaurora.org>
 <YKtPXWrTb6Qj+E9l@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKtPXWrTb6Qj+E9l@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_014325_203758_FE6FBD78 
X-CRM114-Status: GOOD (  29.68  )
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

On Mon, May 24, 2021 at 09:01:49AM +0200, Greg KH wrote:
> On Mon, May 24, 2021 at 12:03:12PM +0800, Baochen Qiang wrote:
> > During system resume, MHI host triggers M3->M0 transition and then waits
> > for target device to enter M0 state. Once done, the device queues a state
> > change event into ctrl event ring and notifies MHI host by raising an
> > interrupt, where a tasklet is scheduled to process this event. In most cases,
> > the tasklet is served timely and wait operation succeeds.
> > 
> > However, there are cases where CPU is busy and cannot serve this tasklet
> > for some time. Once delay goes long enough, the device moves itself to M1
> > state and also interrupts MHI host after inserting a new state change
> > event to ctrl ring. Later CPU finally has time to process the ring, however
> > there are two events in it now:
> > 	1. for M3->M0 event, which is processed first as queued first,
> > 	   tasklet handler updates device state to M0 and wakes up the task,
> > 	   i.e., the MHI host.
> > 	2. for M0->M1 event, which is processed later, tasklet handler
> > 	   triggers M1->M2 transition and updates device state to M2 directly,
> > 	   then wakes up the MHI host(if still sleeping on this wait queue).
> > Note that although MHI host has been woken up while processing the first
> > event, it may still has no chance to run before the second event is processed.
> > In other words, MHI host has to keep waiting till timeout cause the M0 state
> > has been missed.
> > 
> > kernel log here:
> > ...
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.911251] mhi 0000:06:00.0: Entered with PM state: M3, MHI state: M3
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917762] mhi 0000:06:00.0: State change event to state: M0
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917767] mhi 0000:06:00.0: State change event to state: M1
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4338.788231] mhi 0000:06:00.0: Did not enter M0 state, MHI state: M2, PM state: M2
> > ...
> > 
> > Fix this issue by simply adding M2 as a valid state for resume.
> > 
> > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> > 
> > Fixes: 0c6b20a1d720 ("bus: mhi: core: Add support for MHI suspend and resume")
> > Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > ---
> >  drivers/bus/mhi/core/pm.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.
> 

I've applied this patch to mhi tree with tag "Cc: stable@vger.kernel.org".

Thanks,
Mani

> </formletter>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
