Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F182BCD1299
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztGZ5c30dWolo0WRD0gHUQRamj5xogDJS9xhQpq4DnI=; b=3s3TBj5qHNwhrR7alGxjqcl7xK
	M1LoN9RqkdivPkYnkMkqaj+yihFm9wS3/3n8e2FIf58PtERhUle85b9ElKuKCFf7olME7GXKt547R
	NMdRu29PV8qArQdlvXDfTD7Fy254ror2NiIAd1hre4abp5yfMMKqJGZI9isf4LwGHxdCpym7G5tyz
	aLz30kCBLYzhLYzuaDfWwmjwqA/9i1JRgZanupw4drSLAbwSeHIRouR4IQhCcR/pgSF9qND3b9fbS
	PRAWZDijXcHFYCeIk6iHIapWyt7ljS+k8OptjU0s7GsJ+w9zv68L0mVk+4rCyzBZk2pP0KJoo89EY
	r21wgMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8KD-00000001KyR-1oVY;
	Tue, 09 Apr 2024 10:03:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8K8-00000001Kvi-2ok1;
	Tue, 09 Apr 2024 10:03:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A903ECE1E0C;
	Tue,  9 Apr 2024 10:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C6CC433F1;
	Tue,  9 Apr 2024 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712657004;
	bh=iTNCMmIBrqKAd1ZLJrqU0oi+mUhYpPEw/iRl1+vEJFM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CaS3hDVH0ZSF6klcFqrO4Ey1bc/QKOA07ywyZGABJzEipRFSqFG8Lp9ZluAu+PVYW
	 msvEMtYrfeQIiDeSGp3iL/bvKf8pFCOh3gI2sz1/perPxta+N1ubLmp/MHXJH2EzZC
	 TlFDXjJ5KwjWkWEpA0HM7cMk7jywfJ8Ir0R4UuAOAQCshGgdg0HImae39J7aqZMxNG
	 MuGh0G5azU7jBbpQ2dRXDUXvrVKy16FCZXv18+ZR7Dh/vz3+0s9cOdzyTu1mENJ70C
	 EpwTbekjNbVRLfdBDrXml9uXi8G2zauJCrkdjYaI4qe5j0pvKeiZPcQUeSJ5vZ+xWH
	 LctGFMmx4zI9A==
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
Date: Tue, 09 Apr 2024 13:03:21 +0300
In-Reply-To: <ZhRGo3I57rXxsMV/@gmail.com> (Breno Leitao's message of "Mon, 8
	Apr 2024 12:33:55 -0700")
Message-ID: <87edbe26qe.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_030328_915341_17E92FA0 
X-CRM114-Status: GOOD (  17.49  )
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

>> > Reading the issue, I am afraid that freeing netdev explicitly
>> > (free_netdev()) might not be the best approach at the exit path.
>> >
>> > I would like to try to leverage the ->needs_free_netdev netdev
>> > mechanism to do the clean-up, if that makes sense. I've updated the
>> > ath11k patch, and I am curious if that is what we want.
>> >
>> > Would you mind testing a net patch I have, please?
>> >
>> >   https://github.com/leitao/linux/tree/wireless-dummy_v2
>> 
>> I tested this again with my WCN6855 hw2.0 x86 test box on this commit:
>> 
>> a87674ac820e wifi: ath11k: allocate dummy net_device dynamically
>> 
>> It passes my tests and doesn't crash, but I see this kmemleak warning a
>> lot:
>
> Thanks Kalle, that was helpful. The device is not being clean-up
> automatically.
>
> Chatting with Jakub, he suggested coming back to the original approach,
> but, adding a additional patch, at the free_netdev().
>
> Would you mind running another test, please?
>
> 	https://github.com/leitao/linux/tree/wireless-dummy_v3
>
> The branch above is basically the original branch (as in this patch
> series), with this additional patch:
>
> 	Author: Breno Leitao <leitao@debian.org>
> 	Date:   Mon Apr 8 11:37:32 2024 -0700
>
> 	    net: free_netdev: exit earlier if dummy

I tested with the same ath11k hardware and this one passes all my
(simple) ath11k tests, no issues found. I used this commit:

1c10aebaa8ce net: free_netdev: exit earlier if dummy

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

