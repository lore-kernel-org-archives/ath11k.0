Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BE5C25B78
	for <ath11k@archiver.kernel.org>; Thu, 30 May 2024 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnzwdGI23KemHWcPj6PEvrNtcAc6pYJxSXZGSHRPhUE=; b=O5+2SOEDagmiTWLOJrjvOOpzBW
	/Ai0we0/tBP8cK8VMdVZflTc5NW2C/Vr1oaZGa3PQ0C4fHNufEYrUHm0OlIGepPSl41/nB4zLcC8e
	Qit11VAXojwXRGUs0ChEI3nCRKhISdQCBcwYE73eOfjdLJzxyQQfp9lWQ2HWhNrnW2FiRGtLF4pFW
	BJk59AmzilRv3Rx5HKUFnFBJh/v14tnjIVPBlntiyo/Ld+IQyojg5KAExAYjRsX+mF8c8zB7+7CfB
	kvu2lj80M3en5dWF2CJ4O8m3rWSX6tKDuNgwdzrw0el3bB9v5PjaYW1bQP6ScgHM/ixjwP6H6VJOa
	2m/hZX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCaWh-00000006Y4f-0ypG;
	Thu, 30 May 2024 07:48:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCaWd-00000006Y3y-4560
	for ath11k@lists.infradead.org;
	Thu, 30 May 2024 07:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 04438CE1754;
	Thu, 30 May 2024 07:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C5DC3277B;
	Thu, 30 May 2024 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717055316;
	bh=KrIXXGCyYoQepPvoPZ939b4c91CImdKHjnysOffQO0g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=a7KT9rvZi8dNyYFnxxT7cmUPUzHD+e1+BG+wsH0h1+uBaZYeG+zU7+Aa58/0PfXLF
	 zwExgtoyc41YtzO93xVOVvFBcnIB/XJ5QVn2nS+dBjb4fckSeit7HdYec88Aaipf5p
	 wB3k4JOnV0a8QG30hGeKRFvKVPjidCZB6AEeEgWya57b/3aDHgI3+Krn3WqbHrAGs1
	 A8mZoGQcmHtdOTSXzvojw7Ge63LZRYrKU8JkPcdrjPw8iCt23kMikf4m3jclJ6JAwv
	 AegyuNCXdSqh9/vSretBA9Nun7b1g7ASPxr3SdDfcwQgts5SEhWpdgEYZQ6HWOwGWR
	 yKPw4U52dAd3w==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>,  Bjorn Helgaas <bhelgaas@google.com>,
  <linux-wireless@vger.kernel.org>,  <ath11k@lists.infradead.org>,
  <regressions@lists.linux.dev>,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  <linux-kernel@vger.kernel.org>,  <linux-cxl@vger.kernel.org>,
  <linux-pci@vger.kernel.org>
Subject: Re: [regression] BUG: KASAN: use-after-free in
 lockdep_register_key+0x755/0x8f0
References: <87v82y6wvi.fsf@kernel.org> <87wmncwqxf.fsf@kernel.org>
	<87sexzx02f.fsf@kernel.org>
	<66582bee45da8_6ec329496@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Date: Thu, 30 May 2024 10:48:32 +0300
In-Reply-To: <66582bee45da8_6ec329496@dwillia2-mobl3.amr.corp.intel.com.notmuch>
	(Dan Williams's message of "Thu, 30 May 2024 00:34:06 -0700")
Message-ID: <87jzjbwxin.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_004840_220189_D0C97C2D 
X-CRM114-Status: GOOD (  15.18  )
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

Dan Williams <dan.j.williams@intel.com> writes:

> Kalle Valo wrote:
>
>> Kalle Valo <kvalo@kernel.org> writes:
>> 
>> > Kalle Valo <kvalo@kernel.org> writes:
>> >
>> >> Yesterday I run our ath11k regression tests with v6.10-rc1 and our
>> >> simple ath11k module reload stress started failing reliably with various
>> >> KASAN errors. The test removes and inserts ath11k and other wireless
>> >> modules in a loop. Usually I run it at least 100 times, some times even
>> >> more, and no issues until yesterday.
>> >>
>> >> I have verified that the last wireless-next pull request (tag
>> >> wireless-next-2024-05-08) works without issues and v6.10-rc1 fails
>> >> always, usually within 50 module reload loops. From this I'm _guessing_
>> >> that we have a regression outside wireless, most probably introduced
>> >> between v6.9 and v6.10-rc1. But of course I cannot be sure of anything
>> >> yet.
>> >>
>> >> I see different KASAN warnings and lockdep seems to be always visible in
>> >> the stack traces. I think I can reproduce the issue within 15 minutes or
>> >> so. Before I start bisecting has anyone else seen anything similar? Or
>> >> any suggestions how to debug this further?
>> >>
>> >> I have included some crash logs below, they are retrieved using
>> >> netconsole. Here's a summary of the errors:
>> >>
>> >> [ 159.970765] KASAN: maybe wild-memory-access in range
>> >> [0xbbbbbbbbbbbbbbb8-0xbbbbbbbbbbbbbbbf]
>> >> [  700.017632] BUG: KASAN: use-after-free in lockdep_register_key+0x755/0x8f0
>> >> [  224.695821] BUG: KASAN: slab-out-of-bounds in lockdep_register_key+0x755/0x8f0
>> >> [ 259.666542] BUG: KASAN: slab-use-after-free in
>> >> lockdep_register_key+0x755/0x8f0
>
> The proposed fix for that is here:
>
> http://lore.kernel.org/r/66560aa9dbedb_195e294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch

I get "Not Found" from that link, is there a typo?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

