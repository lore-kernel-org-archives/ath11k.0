Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E385DF506E2
	for <ath11k@archiver.kernel.org>; Mon, 16 Mar 2026 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlEzqxK2YEl3SXEgkPbUbfs0P9bQP+Yj8HFphhFYGSg=; b=EoxCcvgi84F0qPNtcD9gSxXp7c
	aMxZGhQo0lVfkVZtlkN9dsLO8PBzaplBrYq5jY2HMZgiBWRF4WprWZ+ORKC+srJZFu6Q8BcuCRrYF
	CtlXgw8EO+cVaYR5Fe8l0e0bTCG9+acMnGAsgICh2hJ4NhCe509n6B9UPHfrU0Ki4o9L/IpdNNsRT
	fPDxumkje2RVtKZlMV/AZ4HhDqTzwM2TNaGOHlaO1HoaO/xtEFgkqkZ27dp3Sf2MkUkv9komYQt9r
	QIzJYQ7EKRNZGiILK6OobdXNWcDtfak9+FpmrDSVHuGnN3mELIYgD+z5nwz1jdYOYJpMcLlyXa1Ir
	4g1E5HhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29PO-00000004GqI-0mLS;
	Mon, 16 Mar 2026 14:59:06 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29PL-00000004Gpi-1Y5m
	for ath11k@lists.infradead.org;
	Mon, 16 Mar 2026 14:59:04 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8cd8576a512so596917485a.0
        for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 07:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773673142; x=1774277942; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlEzqxK2YEl3SXEgkPbUbfs0P9bQP+Yj8HFphhFYGSg=;
        b=f2MAz4929tToc/iX8vxrAWP2VQ+TYyBG9bD0NYw02Otwfj+kqI1DMSZixRB+BWGqW0
         m7er3DGXv0QIpqUS3W7RPFKE0In1q00yh9iTiwBsDiA4NGcZ5nh8E+nXFWzUUd9Oljh7
         lWX/94KF6c8eLm8cuiCdwZyuNuBwJKFSVbiVbaSjjUOt0vm6+cjNpjiNksApvtjmbSOq
         R2ZbNGQ3dkeNuc6fZnn/Wapn/yvhvsQTXONXZGne+UT+zwo4vmWUyKvh97elxRuwt8A3
         tXSgfiWXrolt1WcJhkxK7kSshYYw29Iqwpa0u1wwweitN69RvBtg0bEbhkNQBoVxdvze
         VDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673142; x=1774277942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlEzqxK2YEl3SXEgkPbUbfs0P9bQP+Yj8HFphhFYGSg=;
        b=NLh/9Lo5fB7py8dC4+8fOfBsUw6Ol3GZY4mkp8KkmMyTk/369iNpHurYf1PZCmwNg0
         nzrxB3laRP3JlBfU1EzLHPq6H3ulfasjD3/Y+EMPNYwHloZ2jBc4Cw0a4cmz1vTUg6Us
         APkFYZTzYxYoAjIqBZ39eWKy76/xQ+CPLoKaay5zJn7uxWOEZK/5lon6EboFyZfx+U7Q
         XElImQZX+mEQM03cd8CBIfI9qtoSszMxqwrPXezPJpy1mmJPu5kD9D00NFC9g7VnDPgY
         /Hid1fnGbmNHUCMfS1azLN1e9HwL64LPiesmitFkLv55m7eJLb4sXEGuKsC+JGDe2C/5
         vm6g==
X-Forwarded-Encrypted: i=1; AJvYcCUYmuiiFwc0j2fJL6tDFAsVaZCe9t3k91PIcE7zcVbZKB65YigEqEHai8PQTa9Rz9BNIbAm0sc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCGIWckJDYhVb9Tu5EpXw2DFXy4TlrvaN5k0HeQIMQk2XOz9DK
	Yod6vIKRTZ89sLGOFViZl3mPTWVn2e5gM+/xPXWUoU2u5w2Crw6RFc87
X-Gm-Gg: ATEYQzxtF5/6B62Ny6BBmWF+76znffJ/l0gWRsWYNZBZ1uvzf2o+TYKh1j5sqjpsbmq
	7sH5l9sedba0BmM3Cz8G2wLWCVueMy6ZbwS6CUyFlVQU8USueKz6SW/SmKtqMLuh/g1hcR2MhnN
	Q7CXn3p24WkbXyQ5yl3ExiLPzNqCNzS+QjMDA35pYaEovGa6a8E01CZslwlUjtHFRAddbz7Q4sn
	iU+ApocuCeSZO+TDj+Sp7wT6rh+JYLgk6TIToINcGeHXdccwApqDeLQNS518WCWUVg3Ambnjw96
	M4qcbvyh6R7Y++btEJRs72GUaPiBrIjlUHcxbZmVtQxs+dTUrx3CELcTkTsvhkRNSm1CaKMM6b1
	D09wSIOcqX/K9PTc7ZrmjTKbrcic/sL4e25cfJdU10FQJgQOt3xRssNHDf7qh884ZT0i/Cb0+2Y
	JxacrPgQWfE0nOP+WoKGsHHtV+G5DT560aZS5rmPhrqa8J0xFSjfI58zL3TQ==
X-Received: by 2002:a05:620a:2913:b0:8cd:94f9:1bbb with SMTP id af79cd13be357-8cdaa870dcamr2022355085a.29.1773673141041;
        Mon, 16 Mar 2026 07:59:01 -0700 (PDT)
Received: from [10.100.120.215] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21100b8sm1232308185a.29.2026.03.16.07.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:58:59 -0700 (PDT)
Message-ID: <fb53b8fd-5d36-4df3-a9e6-fba7c0457e55@gmail.com>
Date: Mon, 16 Mar 2026 07:58:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT] vfio/pci-quirks: Quirk for ath wireless
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, quic_bqiang@quicinc.com,
 kvalo@kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, dwmw2@infradead.org, iommu@lists.linux.dev,
 kernel@quicinc.com, johannes@sipsolutions.net, jtornosm@redhat.com
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170045.1584000-1-alex.williamson@redhat.com>
 <20240813164341.GL1985367@ziepe.ca>
 <20240813150320.73df43d7.alex.williamson@redhat.com>
 <20240813233724.GS1985367@ziepe.ca>
 <20240815105905.19d69576.alex.williamson@redhat.com>
 <20240815171935.GO3468552@ziepe.ca>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20240815171935.GO3468552@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_075903_429083_46935E8A 
X-CRM114-Status: GOOD (  33.03  )
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

On 8/15/24 10:19 AM, Jason Gunthorpe wrote:
> On Thu, Aug 15, 2024 at 10:59:05AM -0600, Alex Williamson wrote:
>
>>> This is probably the only way to approach this, trap and emulate the
>>> places in the device that program additional interrupt sources and do
>>> a full MSI-like flow to set them up in the kernel.
>> Your last sentence here seems to agree with this approach, but
>> everything else suggests disapproval, so I don't know where you're
>> going here.
> Trapping and emulating is fine.
>
> My concern is really only about skipping SET_IRQ.
>
> That works because of the assumption that the IMS sources are going to
> re-use addr/data pairs setup in the MSI CAP.
>
> That assumption is frail, and won't work at all under the proper IMS
> support Linux now has.
>
> I really don't want to go down the road and have someone tell Thomas
> he can't convert the Linux driver to use irq_domain IMS because it
> will break this stuff here.
>
>> I have no specs for this device, nor any involvement from the device
>> vendor, so the idea of creating a vfio-pci variant driver to setup an
>> irq_domain and augment a device specific SET_IRQs ioctls not only sounds
>> tremendously more complicated (host and VMM), it's simply not possible
>> with the knowledge we have at hand.
> It seems like you have reverse engineered alot of the necessary
> information though??
>
> Maybe there is a more generic approach than a variant driver. If you
> wanted to use IMS from userspace generically you could imagine some
> kind of IMS focused "SET_IRQ" in generic VFIO. Where we'd create the
> needed irq_domains and pass the addr/data pair back to userspace?
>
>> I observe that the device configures MSI vectors and then writes that
>> same vector address/data elsewhere into the device.  Whether the device
>> can trigger those vectors based only on the MSI capability programming
>> and a secondary source piggybacks on those vectors or if this is just a
>> hack by Qualcomm to use an MSI capability to acquire some vectors which
>> are exclusively used by the secondary hardware, I have no idea.
> Well at least that should be testable - but it seems crazy if the
> device has registers for an addr/data pair and then somehow doesn't
> use the values that get put in them??
>
> Copying from the MSI is almost certainly a SW hack because IMS support
> has never really existed in an OS until now. I think your guess for
> why it is like this is pretty good.
>
>> I do not believe that introducing a vfio device feature that disables
>> virtualization of the MSI address/data _only_ at the vfio interface
>> (not to a QEMU VM) provides some implicit support of this device
>> behavior.  These values are already available to a privileged user in
>> the host and the same is available for an MSI-X use case by directly
>> reading the MSI-X vector table.
> To be clear, I'm not really worried about showing the data to
> userspace.
>
> Userspace just shouldn't be using it to implement an IMS technique!
>
> Jason

I see this thread went stale. Wondering if there was ever a final 
conclusion if this could get fixed for ath11k or not. I tried again on a 
recent kernel, 6.17, and see the same behavior.

Thanks,

James


