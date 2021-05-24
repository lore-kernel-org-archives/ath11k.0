Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DC0C04FF3
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 21:43:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6D86140F
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 21:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD6D86140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwIe7dDp/WCQFTcpUAVq2HeialAXbMH2Dm3NkGpcYyU=; b=N8WXPleUT6XESN
	jxkgly5jYjGO7kx1iV4FLCeVZe93FBCyK6mbMUp2bpbr1LybGFK+6ixGO19Cl+p1/eqeYuLseml4x
	ycHpXV0Rb4yXyhDs7v+Kc2lNp4QsUJvTRnBOyF3TGnOHnT5xP9zwCO6z78wsott0gDFuy7RdHsitf
	1EmB5V5yxHPNmhPmi5E0o+4RLE/4whkRJRtMwaicGtjxwh1KOLpasUoD6dk65cTczGpgwFgMP13zy
	19zvE6aroeBJIXDM/WzlFHb/cYZ35Brmm6wIUwKDlmPGBwq7ZK1+MENyM9NzeX419BpDeXGWBopSp
	PMo+eG64y4aNXEywRuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llIM9-001ywy-FU; Mon, 24 May 2021 21:43:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll4b3-000jHq-4n
 for ath11k@lists.infradead.org; Mon, 24 May 2021 07:01:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A49BC60FEF;
 Mon, 24 May 2021 07:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621839711;
 bh=wae65KOcaAEsmwm5b4JIWjciQ5lLGB76byDWItyOH48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=onN/sezX1sshCB0mmiddosdsLbGt4B1DkCIccD2p67O+zB5zG/SovvP30Nnq/FAV5
 IKmn6cw0aUb8PVl8AUXmDWSJwgT2sLEeY3Th7bfUjNPc5S13gYQgecadGH04/WsoCM
 +lbTia6B1epI5dz9xhdKceX2Y4kkM+PvXcrqi7yk=
Date: Mon, 24 May 2021 09:01:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: Wait for M2 state during system resume
Message-ID: <YKtPXWrTb6Qj+E9l@kroah.com>
References: <20210524040312.14409-1-bqiang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524040312.14409-1-bqiang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_000153_255091_A8E7D49E 
X-CRM114-Status: GOOD (  20.44  )
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

On Mon, May 24, 2021 at 12:03:12PM +0800, Baochen Qiang wrote:
> During system resume, MHI host triggers M3->M0 transition and then waits
> for target device to enter M0 state. Once done, the device queues a state
> change event into ctrl event ring and notifies MHI host by raising an
> interrupt, where a tasklet is scheduled to process this event. In most cases,
> the tasklet is served timely and wait operation succeeds.
> 
> However, there are cases where CPU is busy and cannot serve this tasklet
> for some time. Once delay goes long enough, the device moves itself to M1
> state and also interrupts MHI host after inserting a new state change
> event to ctrl ring. Later CPU finally has time to process the ring, however
> there are two events in it now:
> 	1. for M3->M0 event, which is processed first as queued first,
> 	   tasklet handler updates device state to M0 and wakes up the task,
> 	   i.e., the MHI host.
> 	2. for M0->M1 event, which is processed later, tasklet handler
> 	   triggers M1->M2 transition and updates device state to M2 directly,
> 	   then wakes up the MHI host(if still sleeping on this wait queue).
> Note that although MHI host has been woken up while processing the first
> event, it may still has no chance to run before the second event is processed.
> In other words, MHI host has to keep waiting till timeout cause the M0 state
> has been missed.
> 
> kernel log here:
> ...
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.911251] mhi 0000:06:00.0: Entered with PM state: M3, MHI state: M3
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917762] mhi 0000:06:00.0: State change event to state: M0
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917767] mhi 0000:06:00.0: State change event to state: M1
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4338.788231] mhi 0000:06:00.0: Did not enter M0 state, MHI state: M2, PM state: M2
> ...
> 
> Fix this issue by simply adding M2 as a valid state for resume.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Fixes: 0c6b20a1d720 ("bus: mhi: core: Add support for MHI suspend and resume")
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>  drivers/bus/mhi/core/pm.c | 1 +
>  1 file changed, 1 insertion(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
