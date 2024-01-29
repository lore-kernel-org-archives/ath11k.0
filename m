Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85797C47DA9
	for <ath11k@archiver.kernel.org>; Mon, 29 Jan 2024 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfxVZGBO2elM4LjfAIdn0JHDYBLz4fMAbQvHTMC82Zg=; b=WEsGzrmbcDYxWg2jNBrPKSUXBV
	POl+yXq3gezgEu+vnfsQh98VsIEqvxbVe9MzrA0xoHphLn5xdcAqxC4+C3ropTwrwmHWDn058T7kB
	oUkMIYJN5zOyoDnfI6AifKF5yhAYcC13S/y42J19l8hKc1TNuPFfvSXfhXgoiwkz1gV3KqKphjgyK
	f0tEzI6gWEpkd/dtlKsx4WCLDf0Q7NdK6eePKtxcCPqCcyZfa6Ktte0stLemYUwpF9OoCDhYGXS3A
	8VBkwKt1XlkeGwFoR8jEphbP+2U4P3VPSfMh7CWzUuQA/mnTVSoLsHj/PSQDrwXDYnLBQtfXjsuTF
	PtCiDBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR37-0000000CfDQ-3Y7x;
	Mon, 29 Jan 2024 12:47:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR2u-0000000CezM-1Vpo
	for ath11k@lists.infradead.org;
	Mon, 29 Jan 2024 12:47:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9180DCE128E;
	Mon, 29 Jan 2024 12:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3407FC433C7;
	Mon, 29 Jan 2024 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706532446;
	bh=3JzJSW2pU8i2DuptDPIdT+UpVU1FI/nRHQavuMC8qRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8wP8fSedPwAXPkhD3w3QMyjhrHeiH+rOpFcbj6CvcZvISYU9ug5e0jfx8yBU2a8i
	 dYn+qzm8t3oDCoKTbx7aSAyUxItXDwLJQsvP5c8hI5oTvIRBgdRT+cKlW648kDK4rW
	 ellVr9c9HY3XhHiQbOZ60AY1sUklblmfzsO81cRoWcGgPBbA8zD75DWOJoezuVBCAk
	 U7IOrkElbac7VgWq0E2+neSqS22lWGDf8IIPk0HtXBV6A6zE/wSAMQv5LkNMOL25wz
	 XKhFL6oUMR4cpnQ40A+5dihDeSly9zvgLCKQmzCpM1d/D96IbkmZij0I2pMmwHl0i3
	 Crw9IxmzAZYlQ==
Date: Mon, 29 Jan 2024 18:17:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>, pavel@ucw.cz,
	"Kalle Valo (QUIC)" <quic_kvalo@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>, linux-pm@vger.kernel.org,
	"kernel@quicinc.com" <kernel@quicinc.com>,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: ath11k resume fails due to kernel blocks probing MHI virtual
 devices
Message-ID: <20240129124711.GC22617@thinkpad>
References: <21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com>
 <CAJZ5v0inw7pZR3-fNz9H4BdAXtVawN8m7dsDi6CeBxK2tnNGVg@mail.gmail.com>
 <20240129123112.GA22617@thinkpad>
 <CAJZ5v0jQOgK==fpYjoQ3+=1oOzPHCasYeTyKW9NniwYUpXZE=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jQOgK==fpYjoQ3+=1oOzPHCasYeTyKW9NniwYUpXZE=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_044728_802967_7D5836AE 
X-CRM114-Status: GOOD (  32.05  )
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

On Mon, Jan 29, 2024 at 01:37:41PM +0100, Rafael J. Wysocki wrote:
> On Mon, Jan 29, 2024 at 1:31 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Mon, Jan 29, 2024 at 01:22:27PM +0100, Rafael J. Wysocki wrote:
> > > On Mon, Jan 29, 2024 at 11:10 AM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
> > > >
> > > > Hi Rafael and Pavel,
> > > >
> > > > Currently I am facing an ath11k (a kernel WLAN driver) resume issue
> > > > related with kernel PM framework and MHI module.
> > > >
> > > > Before introducing the issue details, I'd like to summarize how ath11k
> > > > interacts with MHI stack to download WLAN firmware to hardware target:
> > > > 1. when booting/restarting, ath11k powers on MHI module and waits for
> > > > MHI channels to be ready.
> > > > 2. When power on, MHI stack creates some virtual MHI devices, which
> > > > represents MHI hardware channels, and adds them to MHI bus. This
> > > > triggers MHI client driver, named QRTR, to get matched and probe those
> > > > MHI devices. In probe, QRTR initializes MHI channels and finally move
> > > > them to ready state.
> > > > 3. Once MHI channels ready, ath11k downloads WLAN firmware to hardware
> > > > target, then WLAN is working.
> > > >
> > > > Such an flow works well in general, but introduces issues in hibernation
> > > > cycle: when preparing for hibernation, ath11k powers down MHI, this
> > > > results in MHI devices being destroyed thus QRTR resets MHI channels.
> > > > When resuming back from hibernation, ath11k powers on MHI and waits for
> > > > MHI channels to be ready in its resume callback. As said above, MHI
> > > > creates and adds MHI devices to MHI bus, but they can't be probed at
> > > > that time because device probe is prohibited in device_block_probing(),
> > > > finally this results in ath11k resume timeout.
> > > >
> > > > Now there is an potential fix to this issue which would needs changes in
> > > > MHI stack, i.e., don't destroy MHI devices while hibernating.
> > >
> > > Exactly.
> > >
> >
> > During hibernation, the power to ath11k could be lost and in that case, there
> > will be no channels available from the device. So keeping the "struct dev" when
> > there is no real device attached to the system, goes against the driver model
> > IMO since we would be messing with the refcount.
> 
> But this is system hibernation or suspend and the reason for the power
> loss is quite different from device removal at run time.
> 
> The device is going to be back during resume (or at least it is not
> expected to go away in the meantime), so it is pointless to destroy
> its representation in memory.
> 
> > For instance in the case of USB, if the device get's unplugged, would it make
> > sense to keep the "struct dev" for the device in kernel in a hope that it would
> > come back again?
> 
> At run time - no, during system suspend - yes.
> 
> It is not even recommended to free IRQs during system suspend.
> 

Hmm, okay. Thanks for clearing it up.

> > The driver model as I understood is, once the actual physical device gets
> > removed, the refcount for "struct dev" should be decremented and it should be
> > destroyed.
> 
> Not really.
> 

Okay. My undestanding seem to be wrong then. I will move forward with the
proposal to keep the devices.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

