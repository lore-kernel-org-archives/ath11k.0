Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66771C67861
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfY/DGL6uksdRTEmHOWyTkc7BhIqBesGw3QUMkCBq4w=; b=igYTob/0TzFtOfc49oYbjleaJR
	kxS4NlSnDeXK/PFLhuli69NPZMgbDtjvM4AJWZtytjVm/gL+vrPzSGMj63bkyDr3KUvh4tVyDAE1e
	rVf1KwGVtGig8MbpojZhKTm2Q4jDJ+VQojaPfDjHs1ZADzcIL4pm+NH4rajLjBLeDXTBVmhOR2h5x
	TkOpnwAr/RlBHv/vZQmcYFQXi5Xs7FlKH0pD9QbIUIQZeRvsn3SKjI5hFXEtHoA8CATg8EXYDdtgc
	7BMK9oTJPB+lyN149JQWKVmhmkNN/Gi2Y8773PUnq/51NaUyOQ/Z1Q0kDEGC9UuJ1ptKGCveys8SG
	weGhX17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9pu-00000001jta-3KH6;
	Tue, 09 Apr 2024 11:40:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9pp-00000001jqZ-01i3;
	Tue, 09 Apr 2024 11:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BF9FFCE1D6A;
	Tue,  9 Apr 2024 11:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C080C433C7;
	Tue,  9 Apr 2024 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712662814;
	bh=RW86VgmMfAcJkSsLpIIwkE6YL29bSdtmFPZKlRKZqL0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=cNNsbZnKiwP9ciyhq95bqBZiXTBTVFFgYSa0BH8/TOyoMtYsUYDOM8eGjT5kpXOyc
	 +WV5ZDL9ZbB6xUc9X/VydgYqxgFyGzi/W4wvyfn1o4Pf4sYEEc6LNpQn/wIr8z8+yL
	 yAUZPgv/kCrsUFZvNvgmsCsXJcUT5dlXakXCx3g7OW15HMdj5h1VRj4xo/PPkaXMKi
	 dxL2qEkqWFsd5aEhhRi5WCJEvDMlID4FvN7eMcvQ61i9uiAxgo2M3uGhfYgAcG+y7W
	 m9SolINR2DOwFgtfq079+zgmxQkVg1Y7DS3zIjow9jE+CweF+L3zZ7ExVChXTPfLqW
	 MElB5W1pVMrsA==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: kuba@kernel.org,  ath11k@lists.infradead.org,
  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  imitsyanko@quantenna.com,  geomatsi@gmail.com,
  linux-kernel@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] wifi: Un-embed ath10k and ath11k dummy netdev
References: <20240405122123.4156104-1-leitao@debian.org>
	<87y19r264m.fsf@kernel.org> <ZhPyRHHlVot+a8Xq@gmail.com>
	<87pluz24ap.fsf@kernel.org> <ZhRGo3I57rXxsMV/@gmail.com>
	<87edbe26qe.fsf@kernel.org> <ZhUdxpnC+nMkNp+U@gmail.com>
Date: Tue, 09 Apr 2024 14:40:10 +0300
In-Reply-To: <ZhUdxpnC+nMkNp+U@gmail.com> (Breno Leitao's message of "Tue, 9
	Apr 2024 03:51:50 -0700")
Message-ID: <875xwq2291.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044017_456489_400E647E 
X-CRM114-Status: GOOD (  20.27  )
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

> On Tue, Apr 09, 2024 at 01:03:21PM +0300, Kalle Valo wrote:
>
>> Breno Leitao <leitao@debian.org> writes:
>> 
>> >> > Reading the issue, I am afraid that freeing netdev explicitly
>> >> > (free_netdev()) might not be the best approach at the exit path.
>> >> >
>> >> > I would like to try to leverage the ->needs_free_netdev netdev
>> >> > mechanism to do the clean-up, if that makes sense. I've updated the
>> >> > ath11k patch, and I am curious if that is what we want.
>> >> >
>> >> > Would you mind testing a net patch I have, please?
>> >> >
>> >> >   https://github.com/leitao/linux/tree/wireless-dummy_v2
>> >> 
>> >> I tested this again with my WCN6855 hw2.0 x86 test box on this commit:
>> >> 
>> >> a87674ac820e wifi: ath11k: allocate dummy net_device dynamically
>> >> 
>> >> It passes my tests and doesn't crash, but I see this kmemleak warning a
>> >> lot:
>> >
>> > Thanks Kalle, that was helpful. The device is not being clean-up
>> > automatically.
>> >
>> > Chatting with Jakub, he suggested coming back to the original approach,
>> > but, adding a additional patch, at the free_netdev().
>> >
>> > Would you mind running another test, please?
>> >
>> > 	https://github.com/leitao/linux/tree/wireless-dummy_v3
>> >
>> > The branch above is basically the original branch (as in this patch
>> > series), with this additional patch:
>> >
>> > 	Author: Breno Leitao <leitao@debian.org>
>> > 	Date:   Mon Apr 8 11:37:32 2024 -0700
>> >
>> > 	    net: free_netdev: exit earlier if dummy
>> 
>> I tested with the same ath11k hardware and this one passes all my
>> (simple) ath11k tests, no issues found. I used this commit:
>> 
>> 1c10aebaa8ce net: free_netdev: exit earlier if dummy
>
> Thank you so much for the test.
>
> I will respin a v2 of this patchset with the additional patch included.

Sounds good. Feel free to add:

Tested-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

