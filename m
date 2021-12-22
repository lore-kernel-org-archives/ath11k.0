Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB73C433EF
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 05:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5UWOs9thjnmfj9ny+Q3KZdd4LmhaAgov+Y64mePUaA=; b=IeB+VhQJc1mQrm
	09WaJCUYsngHihp5LsimdINpYZtIeDS7xNiiA6jksXY5IVVuRS6YkvZruZ6Uj4tOvOjH73BXbB6be
	USZX/Pfa4eSsyGO86fZMTi6oml+vX3YOp9saMRCwvCQombpOnLaDcyhZVujFWMkUvDgswMGrBYRvd
	t5ZiDbl7Hy8xEHfokhGUkeoI2tXAzA5tnYy3xqqGkMwB0KM3ilDMyLSS3ofcJQmMNJjsyrPFkYclg
	PKYBDzg/9XcsO0onVjf03rdIabQ84rslQ4BKs8gnOS3oagptfYfyCq/nxlPa8nosBy3zDo9M+WuqS
	TSmDoG1zog0D5SxNTTmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzuZ7-009HBh-8c; Wed, 22 Dec 2021 05:53:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzuZ5-009HBA-5c
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 05:53:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF8DC617ED;
 Wed, 22 Dec 2021 05:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57ECDC36AE8;
 Wed, 22 Dec 2021 05:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640152405;
 bh=Y2yRLncS7O14hAfAAvQyzxVTklnF9i2NnKDzmruUtVU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=tnlH85zfQLavRCnMyr7jMXojazT6jGXYXqrmw2hf33xJGUqmw7FYOhlFgT0ScPENm
 7yGjgeZDcFxZf5baulmhMdgzDK+1lYmxPN9YVv53j4vulLP2UG2Cc69B58kABxC1FY
 1/2iQ0amBzs66m3xhDzuMaLYnECseVOWLrcrPEumov9l6wEXgACwFdJsxO04E68iLx
 mg8ovb1+On/ERfPlPSRB6csMeYJcoelItCzmZExHpIKZNdrj+/KyafHW0TkEUl0JMI
 lh+sHTG91knLI7vbuCORMmCC57gaPBxf2jKAp/5kH0V3bx/NBYgEjk79OLS9OnIyhS
 eBUBtZdAQZiPw==
From: Kalle Valo <kvalo@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,  ath11k@lists.infradead.org
Subject: Re: [bug report] ath11k: Fix pktlog lite rx events
References: <20211130104159.GD5827@kili>
 <725a45b8c05ebd508df3bfc6b1097b03@codeaurora.org>
 <87czlq6mdw.fsf@kernel.org>
 <e2df0d82a0ca520123c96e070cdabf56@codeaurora.org>
Date: Wed, 22 Dec 2021 07:53:22 +0200
In-Reply-To: <e2df0d82a0ca520123c96e070cdabf56@codeaurora.org> (Anilkumar
 Kolli's message of "Wed, 22 Dec 2021 08:59:06 +0530")
Message-ID: <87wnjx2njh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_215327_279759_1F25E403 
X-CRM114-Status: GOOD (  11.16  )
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

Anilkumar Kolli <akolli@codeaurora.org> writes:

> On 2021-12-21 20:22, Kalle Valo wrote:
>> Anilkumar Kolli <akolli@codeaurora.org> writes:
>>
>>> Thanks for reporting issue. Could you please help in reproducing the
>>> issue,
>>>
>>> I tried to reproduce the warnings using command, but could not
>>>     make C=1 CHECK="smatch -p=kernel" -C.
>>> drivers/net/wireless/ath/ath11k/ modules
>>
>> I don't see why you need to reproduce the error. rx_buf_sz is
>> uninitialised as there's no else statement, like Dan mentioned above.
>>
>
> I thought this script is useful for ath11k.

Ah, yes it would be useful for us to run smatch checks. I'm just more
concerned about getting the bug Dan reported fixed.

>> Anil, can you send a patch?
>
> Sure Kalle, I will submit a patch.

Great, thank you.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
