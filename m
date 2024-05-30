Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C840C25B74
	for <ath11k@archiver.kernel.org>; Thu, 30 May 2024 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8QpyoJ1rMndblq1xIYwkNUjIfvvo0PKMazZnb2IxBg=; b=N2uHP428VdjZwbXeqNFv2xgNwb
	uW4Sf8K1aRPWjNa+ueiZks3g8YYa6dYBawswYeko4jqTfdSBFLXLAG5Yed4iEWOSLT9KAPvc6k8BV
	s8NrGJz+yfKDVCaLZrk+FGZhIWgfLshuwwQPDvnt03+GiGjBrZGSRNtksbJL3SBqW6774B0ccMWOG
	B+V6+hdUuScHTqL9s7HCKxjZY/L4neKn8xr4oFf2sC0BAp6Ta0uJn15PFGPdzEPZLKLAIThK0g0GX
	beY6S5kx1Sso30O9WCNi8OVQUQ9WA5HquY942/E1UXpWmSHVeI/D7E+ZvAWr/LFcdyZ+d1VUoflCL
	/Hta7zUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCZfM-00000006SJB-2IdG;
	Thu, 30 May 2024 06:53:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCZfJ-00000006SIl-1CKr
	for ath11k@lists.infradead.org;
	Thu, 30 May 2024 06:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FB6862418;
	Thu, 30 May 2024 06:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ACBC32782;
	Thu, 30 May 2024 06:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717052012;
	bh=YivRkEe7rYoBFKl0+BZR93LLEk9IpGONpZAKzglbHXs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=h1w9TYqLc+EMav3BOhfGxWUcC9ah2ZK/gIrpZw7dlayxFXTfzLiAs7mB7mojy82Wy
	 +JjpG8pjv/s9Qjfo9WkxaiDLVkg6lFKdSc1exbqRKXtLB9TEeUPsQR4WIzkAMKXbK4
	 hW2+I7t9G2SeXmL9aIAo46aiZpLeuhx/GlkIPfnCkgN924TRZSdAiK3JL9L/8Hhipt
	 JyYGtcSm0YEUgMEbmePfHq/IigYiEwH7O5y2Lb9RX4uBrFahCrkjb24Vzv6cKgYZtC
	 oFgA3k+KYvHpxTLQ0hbpimm43aoByP+sxqOFX28mqwn90h9dssQ0MR/mtjY+3v7J+J
	 W3c3rbzZ5ck4Q==
From: Kalle Valo <kvalo@kernel.org>
To: Dave Jiang <dave.jiang@intel.com>, Dan Williams
 <dan.j.williams@intel.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-wireless@vger.kernel.org,  ath11k@lists.infradead.org,
  regressions@lists.linux.dev,  Jeff Johnson <quic_jjohnson@quicinc.com>,
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [regression] BUG: KASAN: use-after-free in
 lockdep_register_key+0x755/0x8f0
References: <87v82y6wvi.fsf@kernel.org> <87wmncwqxf.fsf@kernel.org>
Date: Thu, 30 May 2024 09:53:28 +0300
In-Reply-To: <87wmncwqxf.fsf@kernel.org> (Kalle Valo's message of "Wed, 29 May
	2024 18:58:36 +0300")
Message-ID: <87sexzx02f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_235333_542816_4C4E2C90 
X-CRM114-Status: GOOD (  20.20  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Kalle Valo <kvalo@kernel.org> writes:
>
>> Yesterday I run our ath11k regression tests with v6.10-rc1 and our
>> simple ath11k module reload stress started failing reliably with various
>> KASAN errors. The test removes and inserts ath11k and other wireless
>> modules in a loop. Usually I run it at least 100 times, some times even
>> more, and no issues until yesterday.
>>
>> I have verified that the last wireless-next pull request (tag
>> wireless-next-2024-05-08) works without issues and v6.10-rc1 fails
>> always, usually within 50 module reload loops. From this I'm _guessing_
>> that we have a regression outside wireless, most probably introduced
>> between v6.9 and v6.10-rc1. But of course I cannot be sure of anything
>> yet.
>>
>> I see different KASAN warnings and lockdep seems to be always visible in
>> the stack traces. I think I can reproduce the issue within 15 minutes or
>> so. Before I start bisecting has anyone else seen anything similar? Or
>> any suggestions how to debug this further?
>>
>> I have included some crash logs below, they are retrieved using
>> netconsole. Here's a summary of the errors:
>>
>> [ 159.970765] KASAN: maybe wild-memory-access in range
>> [0xbbbbbbbbbbbbbbb8-0xbbbbbbbbbbbbbbbf]
>> [  700.017632] BUG: KASAN: use-after-free in lockdep_register_key+0x755/0x8f0
>> [  224.695821] BUG: KASAN: slab-out-of-bounds in lockdep_register_key+0x755/0x8f0
>> [  259.666542] BUG: KASAN: slab-use-after-free in lockdep_register_key+0x755/0x8f0
>
> I did a bisect and got this:
>
> cf29111d3e4a9ebe1cbe2b431274718506d69f10 is the first bad commit
> commit cf29111d3e4a9ebe1cbe2b431274718506d69f10
> Merge: ed11a28cb709 e6f7d27df5d2
> Author: Bjorn Helgaas <bhelgaas@google.com>
> Date:   Thu May 16 18:14:11 2024 -0500
>
>     Merge branch 'pci/of'
>     
>     - Check for kcalloc() failure and handle it gracefully (Duoming Zhou)
>     
>     * pci/of:
>       PCI: of_property: Return error for int_map allocation failure
>
>  drivers/pci/of_property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> But that doesn't make any sense to me, I don't even have
> CONFIG_PCI_DYNAMIC_OF_NODES enabled in my .config. I guess I did a
> mistake during bisect, I'm now testing the parents (e6f7d27df5d2 and
> ed11a28cb709) and trying to pinpoint where I did it wrong.

I found my mistake and was able to finish the bisect. This seems to be
the commit causing my problems:

# first bad commit: [7e89efc6e9e402839643cb297bab14055c547f07] PCI: Lock upstream bridge for pci_reset_function()

I verified by reverting that commit on top of v6.10-rc1 and I have not
seen any crashes so far, normally I would have seen it by now. But I
will continue testing the revert just to be sure.

Adding people and lists involved with that commit. Here is my original
report:

https://lore.kernel.org/all/87v82y6wvi.fsf@kernel.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

