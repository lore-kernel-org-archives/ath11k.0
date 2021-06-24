Return-Path: <SRS0=dRur=LS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7FDC48BDF
	for <ath11k@archiver.kernel.org>; Thu, 24 Jun 2021 06:09:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41011613B0
	for <ath11k@archiver.kernel.org>; Thu, 24 Jun 2021 06:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41011613B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dcUC1pFimedS9M6JzPYNf3CJus987ERmjKddfrJjjQ=; b=HTfWR51o7b7cMl
	qoZ7CLUFAhBoLTBqtT9cE2Unz7Icx9hOXyDEwQtnEuBP03Q1znG0YWMoIVXgsDJKWOdbXKWCIgwEb
	DThL557DeRV12fZZeopavIpl9JhZ/PQgv1uK7B7ItDSuSFFAbxVcbMzxfn247lFQsK+FtpGXXgzd3
	nIKu+JoQEUfk0W/9SwnpOOye6qVdjutz+enLpGiaujBlMu6X4YrqSCvxRo74bvZg69/bMBuK1ZCrd
	iCx4vlwHlM8Ndu0oy4onhX4B/9q7b/wF9T/WJ17lMMhpyZfqh7NFPw4dJO4x4syIVCIxudThtrj7T
	rlLMd32739fNrmzSbj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwIYI-00CuqE-36; Thu, 24 Jun 2021 06:09:26 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwIYF-00CupX-FO
 for ath11k@lists.infradead.org; Thu, 24 Jun 2021 06:09:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id u2so2403447plf.3
 for <ath11k@lists.infradead.org>; Wed, 23 Jun 2021 23:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Cdh5icP9dLkaJMWxCjq6qbLcVl8C1ZKeQk32n5oC1wo=;
 b=z6SQdKR+RQn8aHynhbgyRv9q7FC8CqOH8thaal7O3TNCa7l74z5Uq+O8ZFTZgQy6TH
 N2gRz/Q17SedgEoI6Z4XEL/3nTaSTfpmLF8aJsYEm0GbF1SLdgPMqalTlGUdvPn66Myk
 3Q3cRb2gONrYpgz9nqjJbvcw5lxekeat4SV3mHfsPgrU78dehklhUKBP6JEQMxYbTRjw
 KtV+kzBk4Yvy3VdKFSQcb7MfYKz2s8jPboNVM8+MknCuBXg+w+TOFtWyOxaejSkujHOX
 SijuHx/c91cIPd1l23ngc+xwcE9GAXlFQ0LcZh15Rp2tjtoJALoB0rcaSj+TgGun9dkU
 AORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Cdh5icP9dLkaJMWxCjq6qbLcVl8C1ZKeQk32n5oC1wo=;
 b=rBVOQPEJomv5QGftEz1W3uVr908b4junivf1L5tnNslTzqUyNUBzTRbbyFthsIxjgv
 0k1fFfae9wzFNG6ABiKPHXpXA6i/FzT1o+OdyNxsuOGKrq7MUL5/NVDSjUs+gR4CImTK
 Jpw8zoRxN/bEs5C3coSdZLHTc57zT8eAxPTWOYlyN/t3wohNvKXUFiuuWAyC4QDfIqeC
 gLjOF9U8uuUTDyKs9eySo1bWUqvUaDf2ytBRkbAzWelnPaW5z9BVwFBGND4mIugprcIk
 6PbOr/Qz+K3s0l/WjrFTqpatCeSKpU1WQ7xoXdfe0OfOoAUW7rQ4bzkTVGHD7GxVyn0Q
 hZHQ==
X-Gm-Message-State: AOAM5333Ri1NyrqvYXuUxcBl7VcVLI7lZrVAE699+zH8lmf4qpeiABpx
 OtAUGy2ptzqKUJTt/OF4Vewj
X-Google-Smtp-Source: ABdhPJxcrzf4frIXVJQwRNVsQ4gofsCEqvAUjZu1/mxoz4rbhnkZM1RWWFsDpWNO2YUUi/tRSrwQMQ==
X-Received: by 2002:a17:90a:bc89:: with SMTP id
 x9mr3644831pjr.228.1624514962040; 
 Wed, 23 Jun 2021 23:09:22 -0700 (PDT)
Received: from workstation ([120.138.12.173])
 by smtp.gmail.com with ESMTPSA id u7sm1325765pjd.55.2021.06.23.23.09.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Jun 2021 23:09:21 -0700 (PDT)
Date: Thu, 24 Jun 2021 11:39:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Bhaumik Bhatt <bbhatt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 hemantk@codeaurora.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 bbhatt=codeaurora.org@codeaurora.org, lilic@codeaurora.org,
 kangxu@codeaurora.org
Subject: Re: [PATCH v4 4/6] ath11k: set register access length for MHI driver
Message-ID: <20210624060916.GA21925@workstation>
References: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
 <1620330705-40192-5-git-send-email-bbhatt@codeaurora.org>
 <20210521135152.GL70095@thinkpad> <87h7i0juxt.fsf@codeaurora.org>
 <37184e28dcc952ba9ad5ed0dc2c1a6da@codeaurora.org>
 <6ed9fe90f40e5f8151d3a028abf0acd1@codeaurora.org>
 <20210618064514.GM3682@workstation> <87k0mkh4ll.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0mkh4ll.fsf@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_230923_591962_859D38AF 
X-CRM114-Status: GOOD (  17.61  )
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

On Wed, Jun 23, 2021 at 08:29:26PM +0300, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > On Wed, Jun 16, 2021 at 10:38:01AM -0700, Bhaumik Bhatt wrote:
> >> Hi Kalle/Mani,
> >> 
> >> On 2021-06-14 10:49 AM, Bhaumik Bhatt wrote:
> >> Just got confirmation that the whole patch series was tested for functional
> >> sanity on
> >> Dell E7590 + QCA6390 with Ubuntu18.04 and patch 4/6 is also good to go.
> >> 
> >> Can you please ACK and pick up this series?
> >> 
> >
> > I can pick the series but I need an Ack from Kalle since it contains
> > ath11k changes. Kalle, can you please Ack this patch?
> >
> > I'm planning to send the PR by this weekend.
> 
> Sorry for the late reply. Yes, as this now tested with ath11k driver
> please take this ath11k patch via the mhi tree:
> 
> Acked-by: Kalle Valo <kvalo@codeaurora.org>

Thanks for the Ack, Kalle. But I've sent the pull to Greg for 5.14. So
once the merge window closes, I'll apply this series for 5.15.

Thanks,
Mani

> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
