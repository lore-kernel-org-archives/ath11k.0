Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8091C433B4
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 17:59:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9015B60C3F
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 17:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9015B60C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gm0H2VFoUIg/e2OBM4F61r5Fb6M4T1YhKpHFpl+lR1Q=; b=SBW5yFdzRZgo4wgxjDh5I0vho2
	jWnE2On3tf5W4jUdG8vbJdz5pZ+Nbn0d8RDI1MlXS4tXGaLzpTeFlOT/iEu7SZRADbl/O10BAA+6i
	WnLkZYEv2agWmFmMaL4LCy6tpRiBH+JIJcEWfaDaeNo54KuBEfMyhRPeG6To2bwz/vEfHAPDHvS0F
	g1rxzeZYILPm8da2ksJyTBiwwgsQ55wX4nzo3xFfmLKtDDR9bRanZGfQU28qlZiLUo6fhd2es+slJ
	LoCDQbPSE5NXuX6XzMbrNWtt7I6dW36m09Fd7jZ817uv51S+3WL3MimNfSRfebW1oE8CwA35Oj1X8
	pSYeRrKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljmwl-002C3h-0d; Thu, 20 May 2021 17:58:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljmwj-002C3L-JL
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 17:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=x6V5dkQ1UuYOUsnlBxtbDFKyxU3nZlr2NdwidNwCgNo=; b=vQRDyf36TOGD9d/5aIrLUCeX7a
 5E7wnD7I15YRqk7VOAxySCHE+25jIa5/iYZsetPHEtcakWA7pUp4tKU+BevmZPU6vm4gwB2duB2t+
 EUCNMZgkJE/SqfYotcWpo9h1nTj3pMOGEV9r8mBoX4dje9GI/igSsRWksX4UrA3XzYvEZwE+2gBD3
 MObCL5Vqw15ypOZmLmGm4yDM3ahSty+BgV/wJgDQVjoRYki1pP8szRD8MxpBOv6xB+0LjKCFPEo2F
 xCgvB9l0QBbGSRBf4Q6feCk222vA+h2U29R1E3YEnr+VxhMlknKMTGIk3K7crD2AJKjQWU7t9LcwQ
 g5Rx66LA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljmwg-00GYk6-Mk
 for ath11k@lists.infradead.org; Thu, 20 May 2021 17:58:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DCA960C3F;
 Thu, 20 May 2021 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621533533;
 bh=XsfOuPt63fmIg+N8ZtNu+v8I5jpBSf8W7VEdPtvFqFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x27KGaKhlad12cvdKHDnCjcU7PggBmhEQcYxItnrX3bW4uefszeNP7+h6RR60dkOI
 5jWpX7ygXj1290jeaI8atjJm1/EP4pNzv2usjM6ZTAAux2GznbQipwgarKAI+5Ngel
 YGtJI8rLxKYVVLC4+aws4LuPzaZvvH1lNNGZ59Zo=
Date: Thu, 20 May 2021 19:58:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
Message-ID: <YKajWVPUSTzNVVm8@kroah.com>
References: <87v97dhh2u.fsf@codeaurora.org> <YKYzwBJNTy4Czd1A@kroah.com>
 <20210520104313.GA128703@thinkpad> <87r1i1h9an.fsf@codeaurora.org>
 <3e8bac3b02e3549a55b7c9b78b699965@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e8bac3b02e3549a55b7c9b78b699965@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_105854_786511_84D274D7 
X-CRM114-Status: GOOD (  22.95  )
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

On Thu, May 20, 2021 at 10:38:12AM -0700, Bhaumik Bhatt wrote:
> On 2021-05-20 05:36 AM, Kalle Valo wrote:
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> > 
> > > On Thu, May 20, 2021 at 12:02:40PM +0200, Greg KH wrote:
> > > > On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
> > > > > Hi,
> > > > >
> > > > > I got several reports that this mhi commit broke ath11k in v5.12.3:
> > > > >
> > > > > commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
> > > > > Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > > Date:   Wed Feb 24 15:23:04 2021 -0800
> > > > >
> > > > >     bus: mhi: core: Process execution environment changes serially
> > > > >
> > > > >     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
> > > > >
> > > > > Here are the reports:
> > > > >
> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=213055
> > > > >
> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=212187
> > > > >
> > > > > https://bugs.archlinux.org/task/70849?project=1&string=linux
> > > > >
> > > > > Interestingly v5.13-rc1 seems to work fine, at least for me, though I
> > > > > have not tested v5.12.3 myself. Can someone revert this commit in the
> > > > > stable release so that people get their wifi working again, please?
> > > > 
> > > > How does the mhi bus code relate to a ath11k driver?  What bus
> > > > is that
> > > > on?
> > > > 
> > > 
> > > MHI is the transport used by the ath11k driver to work with the WLAN
> > > devices
> > > over PCIe.
> > > 
> > > Regarding the bug, I'd suggest to wait for Bhaumik (the author of
> > > 29b9829718c5)
> > > to comment on the possible commit which needs backporting from
> > > mainline.
> > 
> > Ok, but if a quick fix is not available I think we should just revert
> > this in the stable releases. I also got a report that v5.11.21 is
> > broken:
> > 
> > https://bugzilla.kernel.org/show_bug.cgi?id=213055#c11
> 
> Please pick [1] as the dependency to [ Upstream commit
> ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ].

what is [1]???

What commit do I need to backport, a commit id would be nice...

thanks,

greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
