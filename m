Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC94C433ED
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 18:17:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B217C60C3E
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 18:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B217C60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5yIb1JT/KBVWonkei3dDN5FgSSqKoMcfR9eF7bEuhM=; b=epOcxI9P91o2FOBrGzDRLqMRnh
	MulPOpfx1meoZgYxJrEaZeTFw0QVQJItlQDj73nVHyiG1YJPlztn9MJrkSm5iGQv1nAinzyWrQ7/u
	kTnZEuUAL+TvMIC1dAMzNB7v184Pl9uDBUyL6NDlz/KtdHco33y+Gi+ziu8W1JKTAFj4NFtfmPQGh
	GtHPbjK96H4LYojHWQwAIZ8vKKTbdw3FY8cq+Vc7Ieft7womkCSHS+167B56WJhEoIZef6K0oD62m
	ZMW1pX7YNrT0dy6Wp9kHVFivU1+sEzpKo3ht3OnJT81r4SrWF9a3VdPyNd5raT4yRujZH06JH0H4k
	xQxTaw+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljnEr-002Efg-Nc; Thu, 20 May 2021 18:17:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljnEq-002EfX-3n
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 18:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Z+5jdautlBH8i9knDAqOolgMQ0vTlZVY/MWJpB2Gv10=; b=bHkqcYqfT3yb+37pZsWjGyP9KI
 5EWg/lOaTNIT1kIm+l0iEYKcyp9h2uBuXZN9uCQhn+fCpomq1NCY0dumWMPNQtC6seqIYLQRdi9Ap
 8UV8k2+/McUnIMe+tSJ01qXrZEO4TuFMEGu2mb/MzKmTK+4k1p8tR0KMgYEw7z9RUMhrJdTp4Lbo9
 oqMFsoKSLa2r7eCTIwYjI6JzYOZGFUH9srxWciGgna9jRBHgjXljCnvKPoumNbK3zVqwvbvxT7rba
 DSUnYsXx1VGG30LoKLxjyv6X8Kj/UChjDIrf5JxrtGu58DR3/8RKGsHnMj+8n1H3RId5bPhfehT/h
 IFDylH9w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljnEm-00GZLD-V1
 for ath11k@lists.infradead.org; Thu, 20 May 2021 18:17:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C7DA60C3E;
 Thu, 20 May 2021 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621534654;
 bh=wYrdjMb4Si9p5I1W2PD9OycnsQPlep2BsLRz4L9qzk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BEYcKjfkk+oR+MUFf08Rl1U+1Vep+4KR+08EfCBK7fna6RK7jkwhPKm4WOG3/HHAa
 eSwyEpc84AWXG76ds0dOffOPi7CCRK9ejkr3QCFytr8L2WaQ+ccIa2bnEQB1ZXH83D
 S3z1K3m1aPYRVbYilFtHxfNdJCTNr5soJVbJw8gE=
Date: Thu, 20 May 2021 20:17:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
Message-ID: <YKanuzzvDhztYxm/@kroah.com>
References: <87v97dhh2u.fsf@codeaurora.org> <YKYzwBJNTy4Czd1A@kroah.com>
 <20210520104313.GA128703@thinkpad> <87r1i1h9an.fsf@codeaurora.org>
 <3e8bac3b02e3549a55b7c9b78b699965@codeaurora.org>
 <YKajWVPUSTzNVVm8@kroah.com>
 <608474b9b9feae5bd0616ad16d6d6bbd@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <608474b9b9feae5bd0616ad16d6d6bbd@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_111737_060232_E67D01C0 
X-CRM114-Status: GOOD (  27.25  )
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

On Thu, May 20, 2021 at 11:04:05AM -0700, Bhaumik Bhatt wrote:
> On 2021-05-20 10:58 AM, Greg KH wrote:
> > On Thu, May 20, 2021 at 10:38:12AM -0700, Bhaumik Bhatt wrote:
> > > On 2021-05-20 05:36 AM, Kalle Valo wrote:
> > > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> > > >
> > > > > On Thu, May 20, 2021 at 12:02:40PM +0200, Greg KH wrote:
> > > > > > On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > I got several reports that this mhi commit broke ath11k in v5.12.3:
> > > > > > >
> > > > > > > commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
> > > > > > > Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > > > > Date:   Wed Feb 24 15:23:04 2021 -0800
> > > > > > >
> > > > > > >     bus: mhi: core: Process execution environment changes serially
> > > > > > >
> > > > > > >     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
> > > > > > >
> > > > > > > Here are the reports:
> > > > > > >
> > > > > > > https://bugzilla.kernel.org/show_bug.cgi?id=213055
> > > > > > >
> > > > > > > https://bugzilla.kernel.org/show_bug.cgi?id=212187
> > > > > > >
> > > > > > > https://bugs.archlinux.org/task/70849?project=1&string=linux
> > > > > > >
> > > > > > > Interestingly v5.13-rc1 seems to work fine, at least for me, though I
> > > > > > > have not tested v5.12.3 myself. Can someone revert this commit in the
> > > > > > > stable release so that people get their wifi working again, please?
> > > > > >
> > > > > > How does the mhi bus code relate to a ath11k driver?  What bus
> > > > > > is that
> > > > > > on?
> > > > > >
> > > > >
> > > > > MHI is the transport used by the ath11k driver to work with the WLAN
> > > > > devices
> > > > > over PCIe.
> > > > >
> > > > > Regarding the bug, I'd suggest to wait for Bhaumik (the author of
> > > > > 29b9829718c5)
> > > > > to comment on the possible commit which needs backporting from
> > > > > mainline.
> > > >
> > > > Ok, but if a quick fix is not available I think we should just revert
> > > > this in the stable releases. I also got a report that v5.11.21 is
> > > > broken:
> > > >
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=213055#c11
> > > 
> > > Please pick [1] as the dependency to [ Upstream commit
> > > ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ].
> > 
> > what is [1]???
> > 
> > What commit do I need to backport, a commit id would be nice...
> > 
> > thanks,
> > 
> > greg k-h
> Sure Greg. Commit id is: 4884362f6977fc05cbec736625665241c0e0732f
> 
> Title of patch:
> bus: mhi: core: Download AMSS image from appropriate function
> 
> It was supposed to be a link but not sure why it's not seen.

Text email doesn't have links :)

Anyway, thanks, now queued up.

Also note, it's nice to write kernel commit ids as 4884362f6977 ("bus:
mhi: core: Download AMSS image from appropriate function") which is the
preferred way to reference them in a emails and commit logs.

thanks,

greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
