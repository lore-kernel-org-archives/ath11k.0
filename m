Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857E5CA0EE0
	for <ath11k@archiver.kernel.org>; Tue, 12 Aug 2025 19:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIht0DK3JR52/6lmie7XeP7aJevZcNP/dKkbqxENEKk=; b=PQna+YIzZuXx5QODRRESjASy7Y
	JJSczZOjlb1r5Emu/nCM5DcJ4y5oo5/SY2KDjqzKGJtKHTQXoHlw2XiSIVThx0P+WTwXOsq1R9Cjl
	pvM+G2Mk6t/zmSXZ9KyscuijmM192tZXZcKlfhNNIkcMsw1MzcLUyC4IgoO82Fh7dg46zq3mwzlMW
	HI1QpVZO+LVLaDhvbL0MUWpkvLTCYNekNLlwxF3W1nBcGsCwI6kziyt8LKJ2QSFjVevZMnsRcC2dD
	9i49fpPTrKn6Eo1XHglQyb3BXhSkIidyeAOzoFL2lBGATDRaBxaeNqCrhneJuQfBE/z7jVgikGxAa
	63769mwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulucC-0000000BpIg-3OtD;
	Tue, 12 Aug 2025 19:24:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uls6W-0000000BSVQ-02zt
	for ath11k@bombadil.infradead.org;
	Tue, 12 Aug 2025 16:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oIht0DK3JR52/6lmie7XeP7aJevZcNP/dKkbqxENEKk=; b=IRWbogLEsGRDi1PT1ODz3xQgPY
	gG4bXuc+OIWMAjh9Q4FSrwlNuTht+yoGla5csVQbbC1oa3l0LDLxRBO6LkjZ9lkAU+Nq28xFhqdTm
	TjfQIpOZFrTaoInJXtqoGyXq/DacU7ysAFxY0KjC3G7y6QU4sIgYr09dj6iRUx8aonEdJdRMgIyeU
	I/Ue+qmVpuLsEPIhTOQlIng343f1mU3I+LPpVDiWd+s5QtX9cFXVDESof2FYdf3LM9u4Mh7LjllSo
	J+0ynDwJWVHZYfqdwXVakcWhhuwO5oRoU1guZQEekx4PCuYC+wrKS/HroOs+p+hnwVmzmx73b826m
	diXYDiEg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uls6S-0000000FrQx-33by
	for ath11k@lists.infradead.org;
	Tue, 12 Aug 2025 16:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 829FDA576F5;
	Tue, 12 Aug 2025 16:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6B1C4CEF1;
	Tue, 12 Aug 2025 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755017037;
	bh=AAG3OKaWicsbt/OyMFmGSnBXL0juwmhtawXjWSgR1/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bs7GHP/zuzsqtlCcIJpSXRwExwMr58CJ+BMrS0SN2juA30n2B8IU/NRqaOSx/zEiy
	 2N1nVGTyAmMu9AWE0aE95H/h2irS3N1uLmDWRAH3rEb/flh0lHTC0MEC4GFRZPxz2l
	 ansDfnZAh/jcIqQFfb/yKJOkOuvzylC0FCVnSRkMI7ZBmqsccbMwSOGG9tfsBJb3vE
	 rJenh0FjLvkiGm7857w0+yyk+D8OuQRUmCs9jR03c03Vn6uQZkIcO37b0+1/tSiQdi
	 3gu/EUHclTSMGe97NJTOREJlk9icMeaShCJzRUDGmUKIY4jF844xcufsUKfyQ0zedw
	 RRvwtlgZXQksA==
Date: Tue, 12 Aug 2025 22:13:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	mhi@lists.linux.dev, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com, 
	quic_mrana@quicinc.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
Message-ID: <ycbh6zfwae3q4s6lfxepmxoq32jaqu5i7csa2ayuqaanwbvzvi@id4prmhl3yvh>
References: <20250711213602.GA2307197@bhelgaas>
 <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
 <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
 <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_174401_037319_8B6FC502 
X-CRM114-Status: GOOD (  44.67  )
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

On Tue, Aug 12, 2025 at 09:35:46AM GMT, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
> > 
> > 
> > On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
> > > 
> > > 
> > > On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
> > > > On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya
> > > > Chundru wrote:
> > > > > If the driver wants to move to higher data rate/speed than
> > > > > the current data
> > > > > rate then the controller driver may need to change certain
> > > > > votes so that
> > > > > link may come up at requested data rate/speed like QCOM PCIe
> > > > > controllers
> > > > > need to change their RPMh (Resource Power Manager-hardened) state. Once
> > > > > link retraining is done controller drivers needs to adjust their votes
> > > > > based on the final data rate.
> > > > > 
> > > > > Some controllers also may need to update their bandwidth voting like
> > > > > ICC BW votings etc.
> > > > > 
> > > > > So, add pre_link_speed_change() & post_link_speed_change() op to call
> > > > > before & after the link re-train. There is no explicit
> > > > > locking mechanisms
> > > > > as these are called by a single client Endpoint driver.
> > > > > 
> > > > > In case of PCIe switch, if there is a request to change
> > > > > target speed for a
> > > > > downstream port then no need to call these function ops as these are
> > > > > outside the scope of the controller drivers.
> > > > 
> > > > > +++ b/include/linux/pci.h
> > > > > @@ -599,6 +599,24 @@ struct pci_host_bridge {
> > > > >       void (*release_fn)(struct pci_host_bridge *);
> > > > >       int (*enable_device)(struct pci_host_bridge *bridge,
> > > > > struct pci_dev *dev);
> > > > >       void (*disable_device)(struct pci_host_bridge *bridge,
> > > > > struct pci_dev *dev);
> > > > > +    /*
> > > > > +     * Callback to the host bridge drivers to update ICC BW
> > > > > votes, clock
> > > > > +     * frequencies etc.. for the link re-train to come up
> > > > > in targeted speed.
> > > > > +     * These are intended to be called by devices directly
> > > > > attached to the
> > > > > +     * Root Port. These are called by a single client
> > > > > Endpoint driver, so
> > > > > +     * there is no need for explicit locking mechanisms.
> > > > > +     */
> > > > > +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
> > > > > +                     struct pci_dev *dev, int speed);
> > > > > +    /*
> > > > > +     * Callback to the host bridge drivers to adjust ICC BW
> > > > > votes, clock
> > > > > +     * frequencies etc.. to the updated speed after link
> > > > > re-train. These
> > > > > +     * are intended to be called by devices directly attached to the
> > > > > +     * Root Port. These are called by a single client Endpoint driver,
> > > > > +     * so there is no need for explicit locking mechanisms.
> > > > 
> > > > No need to repeat the entire comment.  s/.././
> > > > 
> > > > These pointers feel awfully specific for being in struct
> > > > pci_host_bridge, since we only need them for a questionable QCOM
> > > > controller.  I think this needs to be pushed down into qcom somehow as
> > > > some kind of quirk.
> > > > 
> > > Currently these are needed by QCOM controllers, but it may also needed
> > > by other controllers may also need these for updating ICC votes, any
> > > system level votes, clock frequencies etc.
> > > QCOM controllers is also doing one extra step in these functions to
> > > disable and enable ASPM only as it cannot link speed change support
> > > with ASPM enabled.
> > > 
> > Bjorn, can you check this.
> > 
> > For QCOM devices we need to update the RPMh vote i.e a power source
> > votes for the link to come up in required speed. and also we need
> > to update interconnect votes also. This will be applicable for
> > other vendors also.
> > 
> > If this is not correct place I can add them in the pci_ops.
> Bjorn,
> 
> Can you please comment on this.
> 
> Is this fine to move these to the pci_ops of the bridge.
> Again these are not specific to QCOM, any controller driver which
> needs to change their clock rates, ICC bw votes etc needs to have
> these.
> 

No, moving to 'pci_ops' is terrible than having it in 'pci_host_bridge' IMO. If
we want to get rid of these ops, we can introduce a quirk flag in
'pci_host_bridge' and when set, the bwctrl code can disable/enable ASPM
before/after link retrain. This clearly states that the controller is quirky and
we need to disable/enable ASPM.

For setting OPP, you can have a separate callback in 'pci_host_bridge' that just
allows setting OPP *after* retrain, like 'pci_host_bridge:link_change_notify()'.
I don't think you really need to set OPP before retrain though. As even if you
do it pre and post link retrain, there is still a small window where the link
will operate without adequate vote.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

