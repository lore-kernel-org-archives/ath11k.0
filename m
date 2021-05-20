Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991F6C433B4
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 10:23:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D89461074
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 10:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D89461074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kk+7nzN2ApoA7dRYfLMCv401n30FR66qfJ84M3F4hk=; b=kBvr2WbFty8xt18L4KALcEYqJ6
	n3/ihqHe35wU43ejExsgE+GGBmyEWf3xjIkDew20cXxgXMoCaKdgz3t4FqIuCJXprND/AeJ481SQr
	UBc1o/+q4HVE0AwduG3kbYo3+0e/QYq45FkxKjwQzB0e/rAd4/sImE2x0G4LH7q0u4s/eTuQVG7QV
	H0XOkAge9f6x6HS491VFDac4NZ4KDtN8QlKjautTud0hrvC1RPg+Zpg9SZ2par4VaVGD22tUgbU+n
	3IBV7TymC4ldRa0Lgk7fIGjmQjl6TNGo3725u4+7yxFP1KfLsb4Rx17PzYs0dGEzSmj7ff3LMM8x6
	u/NJVA2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljfpu-0007Hs-Qk; Thu, 20 May 2021 10:23:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljfpi-0007Fz-RM
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 10:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=heIdpD+aApyuJblm3wZrCe7nyf0dmSW4nrLpRbVUjzM=; b=mc603PCjHI7X5uFxb1OgW71xuf
 uKjkTGrVfdYX5BMvSDl2DRjR3WRruMFnuCFECu4mljUy7wQDt2Bhi368e7+VpfFyAfdRHLbwjRJx8
 x+D1g89oQAcr8mzYH8oaWJ9r6VPQkcB1QdQyRoDdzZ9k8MlH2oGEX+qhPL1EhHYubwJBBT7n6GpU9
 RmOMFHtbmDlqI+BLzndTHgr4KCl1ORr8LhBzBb+9B8B2gu74ku6ASp8oghQT6s/jjHI3KivZocNwn
 S+Y89an55unzlPbNOZd3VC2IIa605BMphr6Rak2dg3pxRha+2yHvEQRvkmW5Vewv5Dr+FBYAi04C8
 y4dz8MKQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljfpg-00GADV-4I
 for ath11k@lists.infradead.org; Thu, 20 May 2021 10:23:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11C606109F;
 Thu, 20 May 2021 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621506191;
 bh=Ne8XWBjCjC7wMEdXnGePN5BGuqE/9UQF0eMVmwjZmgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HtYjcM9VChqKKpPfgLDpUZn56MOoNCY1C3QUQdtMNbLH22/6n+YCYMPx/ZL5MgbCX
 zKFTBcw5DfH5Kdw0pP9Ces1FmRO8A9XdQ88MxPm8ipZGgNd6AGy6QPat4jS6JYVp4S
 zbMVw6yN9c9vrB+H89nqbDNyi9adLX1rVGzeAvaE=
Date: Thu, 20 May 2021 12:02:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
Message-ID: <YKYzwBJNTy4Czd1A@kroah.com>
References: <87v97dhh2u.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v97dhh2u.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_032312_230433_562AF76C 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
> Hi,
> 
> I got several reports that this mhi commit broke ath11k in v5.12.3:
> 
> commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
> Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Date:   Wed Feb 24 15:23:04 2021 -0800
> 
>     bus: mhi: core: Process execution environment changes serially
>     
>     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
> 
> Here are the reports:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=213055
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=212187
> 
> https://bugs.archlinux.org/task/70849?project=1&string=linux
> 
> Interestingly v5.13-rc1 seems to work fine, at least for me, though I
> have not tested v5.12.3 myself. Can someone revert this commit in the
> stable release so that people get their wifi working again, please?

How does the mhi bus code relate to a ath11k driver?  What bus is that
on?

This seems odd...

greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
