Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5ADAC4167B
	for <ath11k@archiver.kernel.org>; Mon, 11 Dec 2023 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kA5efUcoTfG+S+FICyEJIe4k2Jt4pVbxEgLH/sWJU4g=; b=txPKBwqAkiKZ2yaDv3s2PEZe3I
	2ZAOM/vg/4n/garxyrVV+hkvtYto8kjNMQvF38RRYNstUYrzVxjVUWwx/B1x+D6Nn3N59VWZmyV/1
	viX/eoGnYRVkZN+zs81gUFR9kWXJZ4XWYD5M8MnrNHmWuZB/JIoCzP87KixFBBarBwyZfUJbJ29AS
	Y4t/CCbW74wDiwiW78nvFd1/mJKfZcZY7nseAcSmheXTSwRjz8+cbvOS1kXvQwH9MhUGJzIGECwtM
	SnzUQChmrdU8aIHC3goWWaq6zs2YUwnSZ8kp+c8EmbxUpCRfJzUWPZMRkLD2TBE4FCYRXq1jmfQeo
	8B8edVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgKW-004xs6-2P;
	Mon, 11 Dec 2023 13:28:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgKJ-004xpo-1q
	for ath11k@lists.infradead.org;
	Mon, 11 Dec 2023 13:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D97760FCB;
	Mon, 11 Dec 2023 13:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF21C433C7;
	Mon, 11 Dec 2023 13:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702301281;
	bh=n1+7TyAq6SMkuijY+70PCk9ZJG9l7ioEJZoWX4LWn6A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KILq5DEfdpOerTUsiVPB3Yn9fPToqSYL7OyDoeBhFMTwOD/zwISMwWxMYGCsicbdy
	 T90DIB/ic1gPYRICvKAwip8y15YST5Sv4Dot4o6JrI53xj1g2EUpjirAlezuJwYQdW
	 rcCcK4wbum86/QIrVpji7lcMH1hPG+ILe+jUl48MIEkgaVU1No1bBNRqAjKdJX2yLO
	 1cSFec5gT8cgv1uUhCtq6qBPCYiHlNQn2wWXKHzCd2uTz86a1NYAfGcCC3V0sKj6zZ
	 wmEseugRQWq9zay2qMRfxP0T/0hL/3MNYvxeyoLSkEQpGBlYyr09hlqNpWaciz03br
	 X74Aip/SGyimw==
From: Kalle Valo <kvalo@kernel.org>
To: Fourhundred Thecat <400thecat@ik.me>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath11k@lists.infradead.org
Subject: Re: bizarre network problem on kernel 6.6.4
References: <39e47336-79f6-5465-7768-a405e2ee3b0a@ik.me>
	<87zfyoq25t.fsf@kernel.org>
	<3730972c-15fd-04ea-8335-16518bea56e3@ik.me>
	<87a5qopolt.fsf@kernel.org>
	<5a48ce85-a24d-4fb7-acca-c34bab425617@quicinc.com>
	<446c5c32-01f0-fe0d-0596-254d73f86e6b@ik.me>
Date: Mon, 11 Dec 2023 15:27:58 +0200
In-Reply-To: <446c5c32-01f0-fe0d-0596-254d73f86e6b@ik.me> (Fourhundred
	Thecat's message of "Sat, 9 Dec 2023 06:30:46 +0100")
Message-ID: <875y14q36p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_052803_671926_4375E91B 
X-CRM114-Status: GOOD (  12.64  )
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

>>>> But I tried checking out linux kernel git repository, switched to tag
>>>> 6.6. and looked inside drivers/net/wireless/ath/ath11k trying to spot
>>>> any change. But git log shows last change on 2023-08-30, whereas kernel
>>>> 6.6.4 was released few days ago
>>>
>>> I assume you were looking at Torvalds' tree only. The release 6.6.4
>>> means that you are using a stable release which are in linux-stable
>>> tree, the gentoo doc above should help more.
>> 
>> FWIW it seems that the only changes to ath11k have been trivial:
>> 
>> % git log --oneline v6.6.1..v6.6.4 -- drivers/net/wireless/ath/ath11k/
>> e83246ecd3b1 wifi: ath11k: fix gtk offload status event locking
>> 69cede2a5a5f wifi: ath11k: fix htt pktlog locking
>> 21ebb0aba580 wifi: ath11k: fix dfs radar event locking
>> c5b914528e55 wifi: ath11k: fix temperature event locking
>> 2d88afdac295 wifi: ath11k: fix Tx power value during active CAC
>> d412d0ef300f wifi: ath11k: fix boot failure with one MSI vector
>> % git remote -v
>> origin  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> (fetch)
>> origin  git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> (push)
>> 
>> Suggest you follow the instructions at the following link and create a
>> kernel bug report:
>> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
>> 
>> Meanwhile I'll build and load 6.6.4 on my laptop.
>
> I have just tried new kernel 6.6.5 and everything works fine !!!
>
> so whatever was the cause, seems to have been fixed between 6.6.4 and 6.6.5
>
> any idea what was the issue?

Heh, for once something which is easy to answer :) The only change in
6.6.5 was this commit:

Revert "wifi: cfg80211: fix CQM for non-range use"

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=9099d0682462e8664c8cbbe8989de65e50f62b17

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

