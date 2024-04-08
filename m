Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6EBC67861
	for <ath11k@archiver.kernel.org>; Mon,  8 Apr 2024 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+df3KZS7e6XYAnaWh9fWGUkdnHcCqEkIpNVuIL0CIs=; b=OABszkmlsWtovLbwoNBWIp0Ebg
	MS1rRiRNRPsWzilcRhw1tlCSTCjGgFZYX+o1Z0jSIEEdoHSlAHidRDUB3ZWgnecFdbDkRnZ/WJLan
	NTSaYxuA7lZmjX94LljUTnOjl5ajrg16TrYG8DXKP6jXm4kNK8N4uDDxHqu0PhbuGj6BYR4bwpLSf
	FuPz+hCiVa6EFVmktki2voDoQj1jz3WiBZDcH0GfsefwnLFZ2krILUIn0xLblkS+oOCsOKSwm2O2d
	oBi/kGsuVPVDSFAVA0XMj5ClcdEbzb7xVGG2rXCKMBUOzUxC/t++ZPy4KIjm5QunMhBp0oMQzQGrw
	gIPKCfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rts67-0000000GEeA-1w9X;
	Mon, 08 Apr 2024 16:43:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rts63-0000000GEbl-1AU6;
	Mon, 08 Apr 2024 16:43:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 450C9CE11D0;
	Mon,  8 Apr 2024 16:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917E9C433F1;
	Mon,  8 Apr 2024 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712594626;
	bh=GxSn5Dg+E+RmqcRAj1lrGgjD7usuAbhQ8PYEXM7ou9g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uJ6UPBrYDRX64lzJjnzYDk2dG7dGz66e0Kjkj3DhPYIhov5Cbu3a8bv5NOlBOxV0i
	 ZbxNxh/2qy/gKrHkqfwCDSpWbeyPuF4Dvg2qmFObpMbgx725MaqI+boXwK492Vc/Yu
	 Ei4orRw1hSzNT3BMXch7zz9+y8lhsmG+tnA3tOt/+SWnXalqgYR2jvc5SyrOuyU4Q+
	 jJMRerXFKzKnA18oD/mnvjCJkgGzc0dFkIib/OsvqYtX0sBNcIU+XRBk++Be+8jKO9
	 T71DVZH25KdQHwLPglR99BeQYDP4BlcHHOBVIcQ/uhYo0Pdrc2BI5Gf3Atw9iwFEcA
	 yNcPxsfHyeF+A==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: kuba@kernel.org,  ath11k@lists.infradead.org,
  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  imitsyanko@quantenna.com,  geomatsi@gmail.com,
  linux-kernel@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] wifi: Un-embed ath10k and ath11k dummy netdev
References: <20240405122123.4156104-1-leitao@debian.org>
	<87y19r264m.fsf@kernel.org> <ZhPyRHHlVot+a8Xq@gmail.com>
Date: Mon, 08 Apr 2024 19:43:42 +0300
In-Reply-To: <ZhPyRHHlVot+a8Xq@gmail.com> (Breno Leitao's message of "Mon, 8
	Apr 2024 06:33:56 -0700")
Message-ID: <87pluz24ap.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_094351_714658_E74A4072 
X-CRM114-Status: GOOD (  24.17  )
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

Breno Leitao <leitao@debian.org> writes:

> Hello Kalle,
>
> On Fri, Apr 05, 2024 at 06:15:05PM +0300, Kalle Valo wrote:
>> Breno Leitao <leitao@debian.org> writes:
>> 
>> > struct net_device shouldn't be embedded into any structure, instead,
>> > the owner should use the private space to embed their state into
>> > net_device.
>> >
>> > This patch set fixes the problem above for ath10k and ath11k. This also
>> > fixes the conversion of qtnfmac driver to the new helper.
>> >
>> > This patch set depends on a series that is still under review:
>> > https://lore.kernel.org/all/20240404114854.2498663-1-leitao@debian.org/#t
>> >
>> > If it helps, I've pushed the tree to
>> > https://github.com/leitao/linux/tree/wireless-dummy
>> >
>> > PS: Due to lack of hardware, unfortunately all these patches are
>> > compiled tested only.
>> >
>> > Breno Leitao (3):
>> >   wifi: qtnfmac: Use netdev dummy allocator helper
>> >   wifi: ath10k: allocate dummy net_device dynamically
>> >   wifi: ath11k: allocate dummy net_device dynamically
>> 
>> Thanks for setting up the branch, that makes the testing very easy. I
>> now tested the branch using the commit below with ath11k WCN6855 hw2.0
>> on an x86 box:
>> 
>> 5be9a125d8e7 wifi: ath11k: allocate dummy net_device dynamically
>> 
>> But unfortunately it crashes, the stack trace below. I can easily test
>> your branches, just let me know what to test. A direct 'git pull'
>> command is the best.
>
> Thanks for the test.
>
> Reading the issue, I am afraid that freeing netdev explicitly
> (free_netdev()) might not be the best approach at the exit path.
>
> I would like to try to leverage the ->needs_free_netdev netdev
> mechanism to do the clean-up, if that makes sense. I've updated the
> ath11k patch, and I am curious if that is what we want.
>
> Would you mind testing a net patch I have, please?
>
>   https://github.com/leitao/linux/tree/wireless-dummy_v2

I tested this again with my WCN6855 hw2.0 x86 test box on this commit:

a87674ac820e wifi: ath11k: allocate dummy net_device dynamically

It passes my tests and doesn't crash, but I see this kmemleak warning a
lot:

unreferenced object 0xffff888127109400 (size 128):
  comm "insmod", pid 2813, jiffies 4294926528
  hex dump (first 32 bytes):
    d0 93 d5 0a 81 88 ff ff d0 93 d5 0a 81 88 ff ff  ................
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 870e4f12):
    [<ffffffff99bcd375>] kmemleak_alloc+0x45/0x80
    [<ffffffff975707a8>] kmalloc_trace+0x278/0x2c0
    [<ffffffff992904c5>] __hw_addr_create+0x55/0x260
    [<ffffffff992909cb>] __hw_addr_add_ex+0x2fb/0x6d0
    [<ffffffff99294004>] dev_addr_init+0x144/0x230
    [<ffffffff992629ee>] alloc_netdev_mqs+0x12e/0xfe0
    [<ffffffff992638c5>] alloc_netdev_dummy+0x25/0x30
    [<ffffffffc0b6b0cd>] ath11k_pcic_ext_irq_config+0x1ad/0xc10 [ath11k]
    [<ffffffffc0b6c431>] ath11k_pcic_config_irq+0x2f1/0x4b0 [ath11k]
    [<ffffffffc0cb8314>] ath11k_pci_probe+0x874/0x1210 [ath11k_pci]
    [<ffffffff97febf06>] local_pci_probe+0xd6/0x180
    [<ffffffff97feefaa>] pci_call_probe+0x15a/0x400
    [<ffffffff97ff03d6>] pci_device_probe+0xa6/0x100
    [<ffffffff98abe315>] really_probe+0x1d5/0x920
    [<ffffffff98abed48>] __driver_probe_device+0x2e8/0x3f0
    [<ffffffff98abee9a>] driver_probe_device+0x4a/0x140


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

