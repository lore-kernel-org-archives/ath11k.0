Return-Path: <SRS0=Uzv+=LM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DB8C48BDF
	for <ath11k@archiver.kernel.org>; Fri, 18 Jun 2021 06:53:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD2060BBB
	for <ath11k@archiver.kernel.org>; Fri, 18 Jun 2021 06:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD2060BBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cC3xm86Z76coGED7vKi1Jxt6BFEAiG8IAMALbcggDk=; b=AFCOp4C8dPrF4+
	RLDTaprWzlch61O5Nss4F/tQoPKUTVCwA8SIdD93wuIFMImClXzSIGtLTss5I+lOk4+06zqbVWGMB
	NgDRxn03c1aHRqOCcVG2zNYsK+2m12xdr81KDzwlnoxsBHQy18WGX+giwD1co6ICYRqPKnVyj3Vs2
	RqC34d8mc/FuXMAXZkIRZLyCOCc3XOljk9m8wwGfCAUWk0H0OurCbuZRA1UYVyd4b0xu2DA/3WEm7
	+OURXvMAPnFtldvQmjk8LzEdvHNJjOJRqnf8BATempKl0fI9eL6DPhLsIN2icNPetBeauhZCYd9lw
	FlEXB6bctTVTMZGhPsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu8Na-00CyBp-MK; Fri, 18 Jun 2021 06:53:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu8Fn-00CuFj-MD
 for ath11k@lists.infradead.org; Fri, 18 Jun 2021 06:45:25 +0000
Received: by mail-pl1-x62d.google.com with SMTP id h1so4193535plt.1
 for <ath11k@lists.infradead.org>; Thu, 17 Jun 2021 23:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=okAyK8M7Z6Ptw0beX4Y2yCnZuEPisK0I1+muMAhoiXg=;
 b=zvf795snOW2u51TXtNSz7v4xK9goLJUViwWj0aEGNbsut7dP75ADSDlQh6oE7mcJ2S
 KQxOAl4vPgYZpTfVuyt6MAnzP/7BgRrJu2/GVYEyZJwUT5IRHxkdr7Isvudt85dQ9zzh
 xHAjB4fCPwghogU+JREfrotPHVsyLiXqyXfaCgPnWBYoF6vwyzckE1Odm7FiE+eEXMzO
 TlsmJskTiSwW8U36LJKco/Ex63OSmZa/KZ5/IVsFNdhIdsGZdtLBTPaWEuUmPlyrW4Gc
 X9XjDC3nw93l03ofs0zegJI5k8Wc2bWf1ivyX0i4zRjgUB7CVKGOqekAYHqlj3hFr3NL
 PlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=okAyK8M7Z6Ptw0beX4Y2yCnZuEPisK0I1+muMAhoiXg=;
 b=uZQNBFcgFZtaWoK5nfkbIIwQH2VhLI4eEpC3eWCimjp1ot6YTpTXnVa40giQIRtP+R
 HoBJc/DLktWASQv/hnttQk6JA1hy+QYbu2A6dU51E/060wUPO+Wt4UafbBoZiC9RK49O
 sQBgPHTSLS6kPEpUF0O8vxVww/ac0lryz2+PyxtWA8Me1fHvdSRdeRBaiJBCFTrKbrFf
 NvMsHfB5yEt+MAJNremlTrGEvn0skG8Rsia31+AznUqs3ZzsItO226xPMEDe32fUTe5F
 TbKYfOqn2p4B4nqZxja0ii7hqQ9XURsV11gzMHR3aAiAeKCNM+gDu23MniI9LmWPWMDn
 iafg==
X-Gm-Message-State: AOAM533AKjLTfMzYdP0HvWKpMT83KYCKXQka9VPuzqcpOlEm6RFmwkS5
 lQnl/KkNKKYW5o7r+StACSM1
X-Google-Smtp-Source: ABdhPJw7hiGjytMs5xdZLxzGMXIBTPSrji65dpHP37DcFsR16C6/rcqV4IZNtVQLqLewkCrdfqATzw==
X-Received: by 2002:a17:902:b188:b029:11b:1549:da31 with SMTP id
 s8-20020a170902b188b029011b1549da31mr3431833plr.7.1623998719794; 
 Thu, 17 Jun 2021 23:45:19 -0700 (PDT)
Received: from workstation ([120.138.13.11])
 by smtp.gmail.com with ESMTPSA id b18sm7026451pfb.131.2021.06.17.23.45.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jun 2021 23:45:19 -0700 (PDT)
Date: Fri, 18 Jun 2021 12:15:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 hemantk@codeaurora.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 bbhatt=codeaurora.org@codeaurora.org, lilic@codeaurora.org,
 kangxu@codeaurora.org
Subject: Re: [PATCH v4 4/6] ath11k: set register access length for MHI driver
Message-ID: <20210618064514.GM3682@workstation>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-5-git-send-email-bbhatt@codeaurora.org>
 <20210521135152.GL70095@thinkpad> <87h7i0juxt.fsf@codeaurora.org>
 <37184e28dcc952ba9ad5ed0dc2c1a6da@codeaurora.org>
 <6ed9fe90f40e5f8151d3a028abf0acd1@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ed9fe90f40e5f8151d3a028abf0acd1@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_234523_864185_DC3D9941 
X-CRM114-Status: GOOD (  43.23  )
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

On Wed, Jun 16, 2021 at 10:38:01AM -0700, Bhaumik Bhatt wrote:
> Hi Kalle/Mani,
> 
> On 2021-06-14 10:49 AM, Bhaumik Bhatt wrote:
> > Hi Kalle,
> > 
> > On 2021-06-14 09:02 AM, Kalle Valo wrote:
> > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> > > 
> > > > On Thu, May 06, 2021 at 12:51:43PM -0700, Bhaumik Bhatt wrote:
> > > > > MHI driver requires register space length to add range checks and
> > > > > prevent memory region accesses outside of that for MMIO space.
> > > > > Set it before registering the MHI controller.
> > > > > 
> > > > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > > > 
> > > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > 
> > > > Kalle, should we do immutable branch for this patch or I can
> > > > pick it up via MHI
> > > > tree (if there are no other patches expected from ath11k for
> > > > this controller)?
> > > 
> > > I'm not expecting any conflicts with this, and if there are, they
> > > should
> > > be easy for Stephen or Linus to fix. So it's easiest to route this via
> > > your tree. But I'm not giving my ack yet, see below.
> > > 
> > > I'm worried that this patchset breaks bisect. Every patch in the
> > > patchset should not break existing functionality, what if only patches
> > > 1-3 are included in the tree but not patch 4? Wouldn't ath11k be
> > > broken
> > > then? I didn't review the whole patchset, but I suspect the fix is to
> > > include the ath11k change in the actual mhi patch which changes the
> > > functionality. So that way we would not have a separate ath11k patch
> > > at
> > > all.
> > > 
> > > Also I'm not able to test this patchset at the moment. Can someone
> > > else
> > > help and do a quick test with QCA6390 to verify these doesn't break
> > > ath11k?
> > 
> > I have requested someone to try and test this patch series with QCA6390.
> > 
> > I or the testers will get back to you with the test results when they
> > are
> > available.
> > 
> > As far as your concerns go, you can choose to pick patches 1-3 and that
> > would
> > be just fine.
> > 
> > Things will break if patchset 4 is _not_ in place with patchset 6 being
> > part of
> > the tree.
> > 
> > It would, however, be nice to pick the whole series instead and ensure
> > that
> > the functionality MHI introduces for boot-up sanity is in place for any
> > controllers such as ath11k.
> > 
> > Thanks,
> > Bhaumik
> > ---
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > Forum,
> > a Linux Foundation Collaborative Project
> 
> Just got confirmation that the whole patch series was tested for functional
> sanity on
> Dell E7590 + QCA6390 with Ubuntu18.04 and patch 4/6 is also good to go.
> 
> Can you please ACK and pick up this series?
> 

I can pick the series but I need an Ack from Kalle since it contains
ath11k changes. Kalle, can you please Ack this patch?

I'm planning to send the PR by this weekend.

Thanks,
Mani

> Thanks,
> Bhaumik
> ---
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
