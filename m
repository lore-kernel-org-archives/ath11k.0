Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BADC47258
	for <ath11k@archiver.kernel.org>; Tue, 23 Jan 2024 15:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LG/APbEAGsEN9PrJqUEaJrd9AfB19pt0IvpXIHHWJk=; b=ibfUM65i3KdXUcQFfbNNjQtMSj
	nh+JuJRQZnbM5bgNDppOWUI0zEIJ1iBuwbSAC3oonIArXF5Of+jR4mKbS4KAFmAyn7EvcmVcRvpx+
	RtuiM8cwnv9EmPbO4WfppQekVLDwIwIXPiEcKEYmBOeTqoEjGwbSjqKWZeid6MrHNm2zPJZWs4xZU
	yrGZ6cKk+ojkjCt2DZjEQI+y1cCa9YFvXyKtx5mSeFzxdhlntelW1QOozKhhknt+/7usB5oybzDdV
	eYwTRPj4EIHS8okdbm2q5wr/X3kr/K6jxUW7fcntjGRVKuDSiOuTHfpLTnyibHkLXhYGfOxduurq7
	t9KtZWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIpx-00H5Mx-1l;
	Tue, 23 Jan 2024 15:37:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIpt-00H5KO-0C
	for ath11k@lists.infradead.org;
	Tue, 23 Jan 2024 15:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CC4D61DA3;
	Tue, 23 Jan 2024 15:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945BCC433F1;
	Tue, 23 Jan 2024 15:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706024231;
	bh=Pm03VHDmHtSJkHOaeiQJeVfiHk9aHqqUuL1m+gjmPjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHFqnV9xpdgXVK2tgy93spV9Wnr4dIsT0rONdKku1vtxiZlKanV9d4j++3xxawUEw
	 Aq8XtPHTwLtmRNF/TjBEwOxnzxBTCzu3naSYAgwSXMRsXySZHU80zMDP9j3Re298mJ
	 SI+1MZp/nOaLJRPayv/j6zpANHzf5CsrBczeMgOCgWBDTa6aPK00BD8m7JrfaqPedT
	 NyiK5Yl0FGWltpq/h7V3raxTklgIY9IYE68qj8BNSITNjqnQ1e3IB265yGp87S87gf
	 /TdiXoCFNVt3qvHEVaqaJO30kVuFio0TmGuslqrSgb8AmM9Q94egmmBfYZDkPSiBwS
	 vC6y8rqc48INg==
Date: Tue, 23 Jan 2024 21:06:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, quic_cang@quicinc.com,
	quic_qianyu@quicinc.com
Subject: Re: [PATCH RFC v2 1/8] bus: mhi: host: add
 mhi_power_down_no_destroy()
Message-ID: <20240123153658.GF19029@thinkpad>
References: <20231130054250.GC3043@thinkpad>
 <87v89cq1ci.fsf@kernel.org>
 <20231220163209.GJ3544@thinkpad>
 <20231220165113.GK3544@thinkpad>
 <7a31696b-cf2b-48c0-bad3-327e9ce47172@quicinc.com>
 <20240104060904.GB3031@thinkpad>
 <20240122062411.GA3176@thinkpad>
 <9ac258d7-8a57-4071-af8d-5b07d776135b@quicinc.com>
 <20240122130947.GD3176@thinkpad>
 <1d9b8bc6-b1ef-4568-a265-b4e69bf90aa9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d9b8bc6-b1ef-4568-a265-b4e69bf90aa9@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_073713_208093_350C9158 
X-CRM114-Status: GOOD (  44.77  )
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

On Tue, Jan 23, 2024 at 09:44:11AM +0800, Baochen Qiang wrote:
> 
> 
> On 1/22/2024 9:09 PM, Manivannan Sadhasivam wrote:
> > On Mon, Jan 22, 2024 at 04:09:53PM +0800, Baochen Qiang wrote:
> > > 
> > > 
> > > On 1/22/2024 2:24 PM, Manivannan Sadhasivam wrote:
> > > > On Thu, Jan 04, 2024 at 11:39:12AM +0530, Manivannan Sadhasivam wrote:
> > > > 
> > > > + Can, Qiang
> > > > 
> > > > [...]
> > > > 
> > > > > > > To me it all sounds like the probe deferral is not handled properly in mac80211
> > > > > > > stack. As you mentioned in the commit message that the dpm_prepare() blocks
> > > > > > > probing of devices. It gets unblocked and trigerred in dpm_complete():
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/power/main.c#n1131
> > > > > > > 
> > > > > > > So if mac80211/ath11k cannot probe the devices at the dpm_complete() stage, then
> > > > > > > it is definitely an issue that needs to be fixed properly.
> > > > > > To clarify, ath11k CAN probe the devices at dpm_complete() stage. The
> > > > > > problem is kernel does not wait for all probes to finish, and in that way we
> > > > > > will face the issue that user space applications are likely to fail because
> > > > > > they get thawed BEFORE WLAN is ready.
> > > > > > 
> > > > > 
> > > > > Hmm. Please give me some time to reproduce this issue locally. I will get back
> > > > > to this thread with my analysis.
> > > > > 
> > > > 
> > > > We reproduced the issue with the help of PCIe team (thanks Can). What we found
> > > > out was, during the resume from hibernation the faliure happens in
> > > > ath11k_core_resume(). Precisely here:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/tree/drivers/net/wireless/ath/ath11k/core.c?h=ath11k-hibernation-support#n850
> > > > 
> > > > This code waits for the QMI messages to arrive and eventually timesout. But the
> > > > impression I got from the start was that the mhi_power_up() always fails during
> > > > resume. In our investigation, we confirmed that the failure is not happening at
> > > > the MHI level.No, mhi_power_up() never fails as it only downloads PBL,
> > > > SBL and waits
> > > for mission mode, no MHI device created hence not affected by the deferred
> > > probe. However in addition to PBL/SBL, ath11k also needs to download m3.bin,
> > > borad.bin and regdb.bin. Those files are part of WLAN firmware and are
> > > downloaded via QMI messages. After mhi_power_up() succeeds
> > > ath11k_core_resume() waits for QMI downloading those files. As you know QMI
> > > relies on MHI channels, these channels are managed by qcom_mhi_qrtr_driver.
> > > Since device probing is deferred, qcom_mhi_qrtr_driver has no chance to run
> > > at this stage. As a result ath11k_core_resume() times out.
> > > 
> > 
> > Thanks for the info, this clarifies the issue in detail.
> > 
> > > > 
> > > > I'm not pointing fingers here, but trying to understand why can't you fix
> > > > ath11k_core_resume() to not timeout? IMO this timeout should be handled as a
> > > > deferral case.
> > > Let's see what happens if we do it in a deferral way:
> > > 1. In ath11k_core_resume() we returns success directly without waiting for
> > > QMI downloading other firmware files.
> > > 2. Kernel unblocks device probe and schedules a work item to trigger all
> > > deferred probing. As a result MHI devices are probed by qcom_mhi_qrtr_driver
> > > and finally QMI is online.
> > > 3. kernel continues to resume and wake up userspace applications.
> > > 4. ath11k gets the message, either by kernel PM notification or something
> > > else, that QMI is ready and then downloads other firmware files.
> > > 
> > > What happens if userspace applications or network stack immediately initiate
> > > some WLAN request after resume back? Can ath11k handle such request? The
> > > answer is, most likely, no. Because there is no guarantee that QMI finishes
> > > downloading before those request.
> > > 
> > 
> > What will happen to userspace if ath11k returns an error like -EBUSY or
> > something? Will the netdev completely go away?
> It depends, and varies from application to application, we can't make the
> assumption.
> 
> Besides, it doesn't make sense to return -EBUSY or something like that, if
> ath11k returns success during resume. A WLAN driver is supposed to finish
> everything, at least get back to the state before suspend, in the resume
> callback. If it couldn't, report the error.
> 

Ok. So I am getting the feeling that we need to talk to the PM people to get a
proper solution. Clearly fixing the MHI code is not the right thing to do. We
might need a separate callback that gets registered by the drivers like ath11k
to wait for the dependency drivers to get probed.

Can you initiate such a discussion? You can write to linux-pm@vger.kernel.org,
"Rafael J. Wysocki" <rafael@kernel.org> and Pavel Machek <pavel@ucw.cz>.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

