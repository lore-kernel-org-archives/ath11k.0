Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C15C4167B
	for <ath11k@archiver.kernel.org>; Tue,  5 Dec 2023 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20F5HDo9VlH/Xgzp1imLHac5pJQj5SrKTjwVyhK8Ha0=; b=juCcyjnjwNe6pBSS7AbHK260W7
	D3HHnXH+fwzuqijDPoiqqLt1Y4CtzxH0bA/7OqCsh8tH0zYNLzTV3K7Yidu71Rs6/WcUR4aTcNwI1
	z+uFa05BqrCGkezBKnFSIh7WmzyBcRjecRE+o2bR9JlfzsIx30SPx6xcZ8XbL0/iod1FVeEVP2LaF
	Z46cWYp5ucclTzsMPP6OS0deHTna+Gp8Y2FeFx2l4F9r90ke3uUVJeAej40gDPG/ggQH0vJuIiMDG
	ABc4J4PZ8DMcqRQc4m3K4FWAqRzQ7p8FRmrJw849rFlvC5SbqEkgw+cb7xRRNdDQQHWrX5RSfFoCy
	6Dl7I8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYqs-007zCl-0J;
	Tue, 05 Dec 2023 17:04:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYqp-007zCC-0l
	for ath11k@lists.infradead.org;
	Tue, 05 Dec 2023 17:04:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D1C83B81BC1;
	Tue,  5 Dec 2023 17:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D18C433C7;
	Tue,  5 Dec 2023 17:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701795889;
	bh=hEbmKgk634INm9A0VV3WRxXIHdipXZhJ0zexlB7AVlo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bIXN7vhpzXjN0397BMjGFr9Fa74yoZuOdov5749K+7OAi9sR66Cr/KfbwJJ0owkO6
	 bWRHDTKdLI6Jfysn6CvqstKcArsPAgJmFyGuELohY6pm2HqSIcBWbCVONYO+zaYpmd
	 uEkCzVEYIdTF6IkZYLWX8WzWNT/tIhAcFjEKekI9LshiXimNImIWXurcDhWVGDl79f
	 3u+O+gTfks40Sc6qUCfvvSwGE372wZQumf/OD9qu1bD/C0q8QQv9X0nB/1h818Vyyb
	 az+fkfGwvCrHQ1Yk15QZEBYoPnuSf4HMjUzSfLuiXyNYl6ADcdRXpTilcNFfHpGemo
	 vmVMCk0OYbP/w==
From: Kalle Valo <kvalo@kernel.org>
To: Fourhundred Thecat <400thecat@ik.me>
Cc: ath11k@lists.infradead.org
Subject: Re: bizarre network problem on kernel 6.6.4
References: <39e47336-79f6-5465-7768-a405e2ee3b0a@ik.me>
	<87zfyoq25t.fsf@kernel.org>
	<3730972c-15fd-04ea-8335-16518bea56e3@ik.me>
Date: Tue, 05 Dec 2023 19:04:46 +0200
In-Reply-To: <3730972c-15fd-04ea-8335-16518bea56e3@ik.me> (Fourhundred
	Thecat's message of "Tue, 5 Dec 2023 17:43:21 +0100")
Message-ID: <87a5qopolt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_090451_414336_53461552 
X-CRM114-Status: GOOD (  17.89  )
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

Fourhundred Thecat <400thecat@ik.me> writes:

> On 05/12/2023 13.11, Kalle Valo wrote:
>> Fourhundred Thecat <400thecat@ik.me> writes:
>> 
>>> I have the most bizarre network problem on my laptop that I have ever
>>> seen, and I don't even know where to start:
>>>
>>> This is lenovo T14s Gen 4, using qualcomm driver ath11k_pci
>>>
>>> Previously I was using kernel 6.6.1 and wireless network was working fine.
>>>
>>> Now I compiled kernel 6.6.4 with identical config, and when I boot it,
>>> wireless network does not work:
>> 
>> Did you verify that booting back to 6.6.1 fixes the problem? That would
>> rule out that this isn't due to some external reasons (user space or
>> network)
>> 
>> If you can verify that 6.6.1 always works and 6.6.4 always fails I would
>> just try to git bisect the issue. It shouldn't take too long.
>
> yes. I verified multiple times that 6.6.1 works, and 6.6.4 has this problem.
>
> I am not really familiar with git bisect, and I am also not a kernel
> developer.

git bisect is a very useful tool, I recommend learning it as it makes so
much easier to find the culprit for regressions. You don't have to be a
kernel developer, it's enough that you know how to compile and install a
kernel.

Here's one doc I found with google, hopefully it helps:

https://wiki.gentoo.org/wiki/Kernel_git-bisect

Here's one from kernel documentation:

https://docs.kernel.org/admin-guide/bug-bisect.html

> But I tried checking out linux kernel git repository, switched to tag
> 6.6. and looked inside drivers/net/wireless/ath/ath11k trying to spot
> any change. But git log shows last change on 2023-08-30, whereas kernel
> 6.6.4 was released few days ago

I assume you were looking at Torvalds' tree only. The release 6.6.4
means that you are using a stable release which are in linux-stable
tree, the gentoo doc above should help more.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

