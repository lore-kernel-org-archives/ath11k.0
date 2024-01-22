Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F7EC4725D
	for <ath11k@archiver.kernel.org>; Mon, 22 Jan 2024 06:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fWFb/CMMbk+zbwiuUZOAf7hLx0dO6RI2qXsAK29ZSY=; b=GMQdN7C6ojcSaLUeTY4N7VPrNc
	XiVTUjeYcVMteJPp/4ueBSTHYlSbIopegAQF7r04NKVNekK8RYF5eEWzjL88y1kdUzTiPJ9nD/zC+
	XxXEHgmWk5Yw8GqJwPamuooZebsRDz2nUiIIpJfj0FCA4XvnpqLC9V54jDGwx0eVNKI+PD6QCbTtQ
	zJ4AB32e3Yc8KMAYVCt7i87CNspIAA58tIb+VL1hpi0IgJimosUWKv16IK9mQ/qasZjOxWBkbjlON
	I73HTOnRnZ59z4FAeWJiF/WR5lPts+6m+EsvJ9DR/zf4XSd318EtlUcsVW9IJyVGW2qTISPTXtCYt
	bnYaWZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnjR-00AjEa-2W;
	Mon, 22 Jan 2024 06:24:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRnjP-00AjE7-2A
	for ath11k@lists.infradead.org;
	Mon, 22 Jan 2024 06:24:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A024DB80B71;
	Mon, 22 Jan 2024 06:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0572C433C7;
	Mon, 22 Jan 2024 06:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705904665;
	bh=ytQ70xzw9VFq0ngIprfNmliPx9LBkAoh27nHd5RHzYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CY1ZkjTDYIl7+UJ1dyUpfirvwdoVAMRbMoqr9lWpPih1UFj+oYhgembV47LZcvka3
	 ExmL9/w3jSOjXOu3sQ0hG9Sf0Wbmh5NvsZan+IxhCKH5c1c/dgYYV7fZ4aUkfWQ/ns
	 lV05TA9OP5gb+AY2XqshCbLZkEEjz+gO1nbmwIEOLc4qHzeBvNjl7CryfR/YPoShfD
	 Rn/yOP6PuRwBdNlvSkNkCno2V3Bs2xmxXq2LoAKI34rAoNH0Vcdsus0/IKMY9qvvGQ
	 GDd37K0EOtunAA/DH5lQE8Lj7IbOa5AbjU0aUEe4DYmUu/2JjkjGFnOp6ba5/zEvhs
	 Zq3Up7LuKcwPA==
Date: Mon, 22 Jan 2024 11:54:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	mhi@lists.linux.dev, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, quic_cang@quicinc.com,
	quic_qianyu@quicinc.com
Subject: Re: [PATCH RFC v2 1/8] bus: mhi: host: add
 mhi_power_down_no_destroy()
Message-ID: <20240122062411.GA3176@thinkpad>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-2-kvalo@kernel.org>
 <20231130054250.GC3043@thinkpad>
 <87v89cq1ci.fsf@kernel.org>
 <20231220163209.GJ3544@thinkpad>
 <20231220165113.GK3544@thinkpad>
 <7a31696b-cf2b-48c0-bad3-327e9ce47172@quicinc.com>
 <20240104060904.GB3031@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240104060904.GB3031@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_222427_872570_AA5D08E6 
X-CRM114-Status: GOOD (  17.88  )
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

On Thu, Jan 04, 2024 at 11:39:12AM +0530, Manivannan Sadhasivam wrote:

+ Can, Qiang

[...]

> > > To me it all sounds like the probe deferral is not handled properly in mac80211
> > > stack. As you mentioned in the commit message that the dpm_prepare() blocks
> > > probing of devices. It gets unblocked and trigerred in dpm_complete():
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/power/main.c#n1131
> > > 
> > > So if mac80211/ath11k cannot probe the devices at the dpm_complete() stage, then
> > > it is definitely an issue that needs to be fixed properly.
> > To clarify, ath11k CAN probe the devices at dpm_complete() stage. The
> > problem is kernel does not wait for all probes to finish, and in that way we
> > will face the issue that user space applications are likely to fail because
> > they get thawed BEFORE WLAN is ready.
> > 
> 
> Hmm. Please give me some time to reproduce this issue locally. I will get back
> to this thread with my analysis.
> 

We reproduced the issue with the help of PCIe team (thanks Can). What we found
out was, during the resume from hibernation the faliure happens in
ath11k_core_resume(). Precisely here:
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/tree/drivers/net/wireless/ath/ath11k/core.c?h=ath11k-hibernation-support#n850

This code waits for the QMI messages to arrive and eventually timesout. But the
impression I got from the start was that the mhi_power_up() always fails during
resume. In our investigation, we confirmed that the failure is not happening at
the MHI level.

I'm not pointing fingers here, but trying to understand why can't you fix
ath11k_core_resume() to not timeout? IMO this timeout should be handled as a
deferral case.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

