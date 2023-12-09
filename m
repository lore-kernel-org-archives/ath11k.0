Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A54C4167B
	for <ath11k@archiver.kernel.org>; Sat,  9 Dec 2023 05:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0CVYLuGi85iA4GD8Api7S8Kt3fWGuB7P1kzmNg84jU=; b=rCYiRsvgD2qbz6Uczx7yzfXqn6
	82K4TG1Jo8Y1/Z9RpQZJgjdp0i1yQa363il2p9O9iDP3OrCwNsyDiqqP2Ewo9Se3pba1iJ8bnLK0i
	5jd/p4cdCzo74za6PM5rV1j3EWtxTxgU45v5ezwD0EeYmqO1fXh4lY3cifS1kDgtuATOc7NpPFJmZ
	SrqLj2a/PSyrxhIpJ9Pd2OAsnQs3jU6sfQv0ffkYeq11Ayrg8diprySP1SbYt73JzCQtldlDlWjKB
	Rd7zei0MKCSMaFw5Z+JCBIGybwe9/3MqBGJPvcbcj+IwCP5lhZRMZMO6B6pQ76ECt2P7IxurCQo1S
	BdCTaRlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBpvg-00H8vo-09;
	Sat, 09 Dec 2023 05:31:08 +0000
Received: from smtp-8fad.mail.infomaniak.ch ([83.166.143.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBpva-00H8ui-0P
	for ath11k@lists.infradead.org;
	Sat, 09 Dec 2023 05:31:06 +0000
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4SnGnM5rrvzMt4F7;
	Sat,  9 Dec 2023 05:30:47 +0000 (UTC)
Received: from unknown by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4SnGnM2whFzMpnPf;
	Sat,  9 Dec 2023 06:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me; s=20200325;
	t=1702099847; bh=hHjaWVXEONCCc15M1fNSHAVAIXdLUH1hAqG5W8iGqSM=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=jL6pbJL4vARgAjr51nhwGinlV50EYJjiVNqCxIS2wXLZjpZPPvbZbHRJoQAxmqWrx
	 FwPpS9rdhQLNSAko4kYy15jhXBsGZQ6in4NQ/jG+KxKY5y1p9XKn983t9jjwLgAu1q
	 UdHSRTvXCOIMZ6oA7yRSGtG6fDCWojb3b3g+Azh8=
Subject: Re: bizarre network problem on kernel 6.6.4
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
 ath11k@lists.infradead.org
References: <39e47336-79f6-5465-7768-a405e2ee3b0a@ik.me>
 <87zfyoq25t.fsf@kernel.org> <3730972c-15fd-04ea-8335-16518bea56e3@ik.me>
 <87a5qopolt.fsf@kernel.org>
 <5a48ce85-a24d-4fb7-acca-c34bab425617@quicinc.com>
From: Fourhundred Thecat <400thecat@ik.me>
Message-ID: <446c5c32-01f0-fe0d-0596-254d73f86e6b@ik.me>
Date: Sat, 9 Dec 2023 06:30:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5a48ce85-a24d-4fb7-acca-c34bab425617@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_213102_900699_3CC0AD6C 
X-CRM114-Status: GOOD (  20.42  )
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

On 06/12/2023 20.15, Jeff Johnson wrote:
> On 12/5/2023 9:04 AM, Kalle Valo wrote:
>> Fourhundred Thecat <400thecat@ik.me> writes:
>>
>>> On 05/12/2023 13.11, Kalle Valo wrote:
>>>> Fourhundred Thecat <400thecat@ik.me> writes:
>>>>
>>>>> I have the most bizarre network problem on my laptop that I have ever
>>>>> seen, and I don't even know where to start:
>>>>>
>>>>> This is lenovo T14s Gen 4, using qualcomm driver ath11k_pci
>>>>>
>>>>> Previously I was using kernel 6.6.1 and wireless network was working fine.
>>>>>
>>>>> Now I compiled kernel 6.6.4 with identical config, and when I boot it,
>>>>> wireless network does not work:
>>>>
>>>> Did you verify that booting back to 6.6.1 fixes the problem? That would
>>>> rule out that this isn't due to some external reasons (user space or
>>>> network)
>>>>
>>>> If you can verify that 6.6.1 always works and 6.6.4 always fails I would
>>>> just try to git bisect the issue. It shouldn't take too long.
>>>
>>> yes. I verified multiple times that 6.6.1 works, and 6.6.4 has this problem.
>>>
>>> I am not really familiar with git bisect, and I am also not a kernel
>>> developer.
>>
>> git bisect is a very useful tool, I recommend learning it as it makes so
>> much easier to find the culprit for regressions. You don't have to be a
>> kernel developer, it's enough that you know how to compile and install a
>> kernel.
>>
>> Here's one doc I found with google, hopefully it helps:
>>
>> https://wiki.gentoo.org/wiki/Kernel_git-bisect
>>
>> Here's one from kernel documentation:
>>
>> https://docs.kernel.org/admin-guide/bug-bisect.html
>>
>>> But I tried checking out linux kernel git repository, switched to tag
>>> 6.6. and looked inside drivers/net/wireless/ath/ath11k trying to spot
>>> any change. But git log shows last change on 2023-08-30, whereas kernel
>>> 6.6.4 was released few days ago
>>
>> I assume you were looking at Torvalds' tree only. The release 6.6.4
>> means that you are using a stable release which are in linux-stable
>> tree, the gentoo doc above should help more.
> 
> FWIW it seems that the only changes to ath11k have been trivial:
> 
> % git log --oneline v6.6.1..v6.6.4 -- drivers/net/wireless/ath/ath11k/
> e83246ecd3b1 wifi: ath11k: fix gtk offload status event locking
> 69cede2a5a5f wifi: ath11k: fix htt pktlog locking
> 21ebb0aba580 wifi: ath11k: fix dfs radar event locking
> c5b914528e55 wifi: ath11k: fix temperature event locking
> 2d88afdac295 wifi: ath11k: fix Tx power value during active CAC
> d412d0ef300f wifi: ath11k: fix boot failure with one MSI vector
> % git remote -v
> origin  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> (fetch)
> origin  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> (push)
> 
> Suggest you follow the instructions at the following link and create a
> kernel bug report:
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
> 
> Meanwhile I'll build and load 6.6.4 on my laptop.

I have just tried new kernel 6.6.5 and everything works fine !!!

so whatever was the cause, seems to have been fixed between 6.6.4 and 6.6.5

any idea what was the issue?






