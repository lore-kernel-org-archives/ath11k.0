Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20623C47DAF
	for <ath11k@archiver.kernel.org>; Mon, 22 Jan 2024 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPwna83DrZvCJ3GdX8KZq17s2woY9BDVG5brkJURZT0=; b=j+/H8Hn+9mrT/aat5IQ2UOGh4R
	qJNZKfgNN5sL70SukG9KLymB4hpjzKTKsV1P4H9PV3H1I4t33Cc+rYKoq+lHEzcERVSDwWvd2lo/f
	dSEPP6DTNpBjCtdbH9qQR3m3AVKgBghGK+22fcqWvHSJnv1BDgS8L5wR1n/5T2KYmiFX5IDUsvkyG
	DEP2FtzR2NBYpnfO1nWrZTdhGFjgFxTFS648ARG7Beh6fJwcLacMDqG2FkN72YEwJFfu3b7Qc+uNV
	2tf2l6Q3LpRN/TtRRWistfz9uVwETrMMHYenY9Mlhf1CQC2jD96liyW8kSYGimuVH7tliYEo0xSDS
	dhTZlCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRu3u-00CEYv-15;
	Mon, 22 Jan 2024 13:10:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRu3q-00CEXb-2h
	for ath11k@lists.infradead.org;
	Mon, 22 Jan 2024 13:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AAAFECE29BA;
	Mon, 22 Jan 2024 13:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BABC433C7;
	Mon, 22 Jan 2024 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705928994;
	bh=M8QIjfgLmhjPzTCa+15a6GOuMApXegCXdUQZ/H5k2DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDK2yH+IyNUI5eeCq14hsHsWxNiGiPh+F+iDqLLBTHHz39Q3M7fBTIE1/AQsAJXv1
	 zFA4KyEah/qF/IxvCI/dddIZaCdAZVjCWkbSnsO8W2K2uAbEe1AEEjGv/nkHWAnVuC
	 guI0pYz1v+TEcowjwVTzbTxrfK1H9L/dKS9w6jypNFQlRXdmEMqlwrBCy8U5WctNRW
	 hIcWRdmUn2ZqLaWLkpr9NHeXcrhd9axnEVMx9sywyzitz/8rfdXrq2DAcSy/8fKwn8
	 4KePO05Bpr6NUDQVRryRFGhBiYy72nd697/K5UooqWFOnVBuBV7GaRXdg/rVxvAO0w
	 rjNvkxxr36s8Q==
Date: Mon, 22 Jan 2024 18:39:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, quic_cang@quicinc.com,
	quic_qianyu@quicinc.com
Subject: Re: [PATCH RFC v2 1/8] bus: mhi: host: add
 mhi_power_down_no_destroy()
Message-ID: <20240122130947.GD3176@thinkpad>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-2-kvalo@kernel.org>
 <20231130054250.GC3043@thinkpad>
 <87v89cq1ci.fsf@kernel.org>
 <20231220163209.GJ3544@thinkpad>
 <20231220165113.GK3544@thinkpad>
 <7a31696b-cf2b-48c0-bad3-327e9ce47172@quicinc.com>
 <20240104060904.GB3031@thinkpad>
 <20240122062411.GA3176@thinkpad>
 <9ac258d7-8a57-4071-af8d-5b07d776135b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ac258d7-8a57-4071-af8d-5b07d776135b@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_050959_636771_C1669BAA 
X-CRM114-Status: GOOD (  34.87  )
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

On Mon, Jan 22, 2024 at 04:09:53PM +0800, Baochen Qiang wrote:
> 
> 
> On 1/22/2024 2:24 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jan 04, 2024 at 11:39:12AM +0530, Manivannan Sadhasivam wrote:
> > 
> > + Can, Qiang
> > 
> > [...]
> > 
> > > > > To me it all sounds like the probe deferral is not handled properly in mac80211
> > > > > stack. As you mentioned in the commit message that the dpm_prepare() blocks
> > > > > probing of devices. It gets unblocked and trigerred in dpm_complete():
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/power/main.c#n1131
> > > > > 
> > > > > So if mac80211/ath11k cannot probe the devices at the dpm_complete() stage, then
> > > > > it is definitely an issue that needs to be fixed properly.
> > > > To clarify, ath11k CAN probe the devices at dpm_complete() stage. The
> > > > problem is kernel does not wait for all probes to finish, and in that way we
> > > > will face the issue that user space applications are likely to fail because
> > > > they get thawed BEFORE WLAN is ready.
> > > > 
> > > 
> > > Hmm. Please give me some time to reproduce this issue locally. I will get back
> > > to this thread with my analysis.
> > > 
> > 
> > We reproduced the issue with the help of PCIe team (thanks Can). What we found
> > out was, during the resume from hibernation the faliure happens in
> > ath11k_core_resume(). Precisely here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/tree/drivers/net/wireless/ath/ath11k/core.c?h=ath11k-hibernation-support#n850
> > 
> > This code waits for the QMI messages to arrive and eventually timesout. But the
> > impression I got from the start was that the mhi_power_up() always fails during
> > resume. In our investigation, we confirmed that the failure is not happening at
> > the MHI level.No, mhi_power_up() never fails as it only downloads PBL,
> > SBL and waits
> for mission mode, no MHI device created hence not affected by the deferred
> probe. However in addition to PBL/SBL, ath11k also needs to download m3.bin,
> borad.bin and regdb.bin. Those files are part of WLAN firmware and are
> downloaded via QMI messages. After mhi_power_up() succeeds
> ath11k_core_resume() waits for QMI downloading those files. As you know QMI
> relies on MHI channels, these channels are managed by qcom_mhi_qrtr_driver.
> Since device probing is deferred, qcom_mhi_qrtr_driver has no chance to run
> at this stage. As a result ath11k_core_resume() times out.
> 

Thanks for the info, this clarifies the issue in detail.

> > 
> > I'm not pointing fingers here, but trying to understand why can't you fix
> > ath11k_core_resume() to not timeout? IMO this timeout should be handled as a
> > deferral case.
> Let's see what happens if we do it in a deferral way:
> 1. In ath11k_core_resume() we returns success directly without waiting for
> QMI downloading other firmware files.
> 2. Kernel unblocks device probe and schedules a work item to trigger all
> deferred probing. As a result MHI devices are probed by qcom_mhi_qrtr_driver
> and finally QMI is online.
> 3. kernel continues to resume and wake up userspace applications.
> 4. ath11k gets the message, either by kernel PM notification or something
> else, that QMI is ready and then downloads other firmware files.
> 
> What happens if userspace applications or network stack immediately initiate
> some WLAN request after resume back? Can ath11k handle such request? The
> answer is, most likely, no. Because there is no guarantee that QMI finishes
> downloading before those request.
> 

What will happen to userspace if ath11k returns an error like -EBUSY or
something? Will the netdev completely go away?

- Mani

> > 
> > - Mani
> > 

-- 
மணிவண்ணன் சதாசிவம்

