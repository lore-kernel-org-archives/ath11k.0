Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6475EC04FF3
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 17:25:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0481461260
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 17:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0481461260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMNMRrRHoGtTGIzwz1Z5c7hy/I7Q2j0hN4lLQERHa9Y=; b=UtrdUs6SU6PyqK
	hMQbSFopzTCEIslx1bkia1YAAUHLxlUmbHYM5khyB4J5Z55mxSxXHxyMIgdq6bwGZ3PfFXk/Ss8LY
	rBqfkMVwPzI07kYWDlQ3y5d2FCO9sa4k+MdYpFdM6GOdwDL2S2sdb5RsjYZ1Eno0M3Fu5QORjG4Ai
	RKjNXMc6iffguPvSKRTvINMTKiXpytnMZf03d808GtAIwL+r4dlYWuXCTtdjGSBDkHrEDtmxGq40O
	JUoLRHmeNPa7g7kJZ5CV46jxGH2g63RAQ+DU62l4C6QbNwgJ/zR+eBDiIV8JzYPEdEl6WW3+K++uI
	2S8qJnvmJjBHsFfHfSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llEKI-001GZA-8S; Mon, 24 May 2021 17:25:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll3Zg-000hsA-Fy
 for ath11k@lists.infradead.org; Mon, 24 May 2021 05:56:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621835785; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=be4eKo2P5DdMYwKNrNDybOr8ySR6R9EZI7Dx3bWOIS4=;
 b=dAGWkr7CnqB3XkdzZpyA/pJApxJN4moqY/TOuFc+q8DR+Z0e+bq9ar1eo+rpL/7FFsQQO4+Y
 3BWX4RXT4PfmuJCR9EkSVgdTVLG2B+73nBS3AFuj31lNhkcc3XyMPyihLJmHnT9rXtcEBAha
 ynyFL+OtK883FYISiwdmFzjeoec=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60ab4004c229adfeff1085d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 05:56:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E45F4C43143; Mon, 24 May 2021 05:56:19 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 887CBC433D3;
 Mon, 24 May 2021 05:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 887CBC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
References: <87v97dhh2u.fsf@codeaurora.org> <YKYzwBJNTy4Czd1A@kroah.com>
 <20210520104313.GA128703@thinkpad> <87r1i1h9an.fsf@codeaurora.org>
 <3e8bac3b02e3549a55b7c9b78b699965@codeaurora.org>
 <YKajWVPUSTzNVVm8@kroah.com>
 <608474b9b9feae5bd0616ad16d6d6bbd@codeaurora.org>
 <YKanuzzvDhztYxm/@kroah.com>
Date: Mon, 24 May 2021 08:56:14 +0300
In-Reply-To: <YKanuzzvDhztYxm/@kroah.com> (Greg KH's message of "Thu, 20 May
 2021 20:17:31 +0200")
Message-ID: <87eedwhdz5.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_225625_530215_4050E2D1 
X-CRM114-Status: GOOD (  31.41  )
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

Greg KH <gregkh@linuxfoundation.org> writes:

> On Thu, May 20, 2021 at 11:04:05AM -0700, Bhaumik Bhatt wrote:
>> On 2021-05-20 10:58 AM, Greg KH wrote:
>> > On Thu, May 20, 2021 at 10:38:12AM -0700, Bhaumik Bhatt wrote:
>> > > On 2021-05-20 05:36 AM, Kalle Valo wrote:
>> > > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>> > > >
>> > > > > On Thu, May 20, 2021 at 12:02:40PM +0200, Greg KH wrote:
>> > > > > > On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
>> > > > > > > Hi,
>> > > > > > >
>> > > > > > > I got several reports that this mhi commit broke ath11k in v5.12.3:
>> > > > > > >
>> > > > > > > commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
>> > > > > > > Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > > > > > > Date:   Wed Feb 24 15:23:04 2021 -0800
>> > > > > > >
>> > > > > > >     bus: mhi: core: Process execution environment changes serially
>> > > > > > >
>> > > > > > >     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
>> > > > > > >
>> > > > > > > Here are the reports:
>> > > > > > >
>> > > > > > > https://bugzilla.kernel.org/show_bug.cgi?id=213055
>> > > > > > >
>> > > > > > > https://bugzilla.kernel.org/show_bug.cgi?id=212187
>> > > > > > >
>> > > > > > > https://bugs.archlinux.org/task/70849?project=1&string=linux
>> > > > > > >
>> > > > > > > Interestingly v5.13-rc1 seems to work fine, at least for me, though I
>> > > > > > > have not tested v5.12.3 myself. Can someone revert this commit in the
>> > > > > > > stable release so that people get their wifi working again, please?
>> > > > > >
>> > > > > > How does the mhi bus code relate to a ath11k driver?  What bus
>> > > > > > is that
>> > > > > > on?
>> > > > > >
>> > > > >
>> > > > > MHI is the transport used by the ath11k driver to work with the WLAN
>> > > > > devices
>> > > > > over PCIe.
>> > > > >
>> > > > > Regarding the bug, I'd suggest to wait for Bhaumik (the author of
>> > > > > 29b9829718c5)
>> > > > > to comment on the possible commit which needs backporting from
>> > > > > mainline.
>> > > >
>> > > > Ok, but if a quick fix is not available I think we should just revert
>> > > > this in the stable releases. I also got a report that v5.11.21 is
>> > > > broken:
>> > > >
>> > > > https://bugzilla.kernel.org/show_bug.cgi?id=213055#c11
>> > > 
>> > > Please pick [1] as the dependency to [ Upstream commit
>> > > ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ].
>> > 
>> > what is [1]???
>> > 
>> > What commit do I need to backport, a commit id would be nice...
>> > 
>> > thanks,
>> > 
>> > greg k-h
>> Sure Greg. Commit id is: 4884362f6977fc05cbec736625665241c0e0732f
>> 
>> Title of patch:
>> bus: mhi: core: Download AMSS image from appropriate function
>> 
>> It was supposed to be a link but not sure why it's not seen.
>
> Text email doesn't have links :)
>
> Anyway, thanks, now queued up.

I'm now getting confirmations that this issue is fixed in v5.12.6.
Thanks for the quick fix and the quick new release!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
