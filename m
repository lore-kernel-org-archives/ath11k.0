Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C16C7619A
	for <ath11k@archiver.kernel.org>; Wed, 12 Apr 2023 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DZTKsobmSy2CwBwUxNG8n8YupbofoE4zYASOxF/r4w=; b=OCRaaAiTXCmEr2
	RsRbRS/pS+4joCIBRQ/mNPOMpYzidBPLKh7wCf6K2TowvUcnh1jFlaM5PfcQ7Ie3n/9KNhbBAbrXc
	E+wHcNqclPJGxHiRABJpaBhhWJOk+jWVB+sF+UGeg6gfUgNABNAcCvYsHR6u34JNz7duygeTzoeIa
	DkTlTrKIChcZqGUzaxQJuqeTuRQOUiZhdOeXbWIxN3lun29mYDzUz3+Svt3B357QXxclMHnQ1Otu6
	uFvA+BWWvyfY0/LBMFK03lBYYPTBSGZUbCA7kGeu5QjWGjKHgUF9YFaRhIKNdrJCJlgKaBj7lSl7h
	/6Qi1FP9qYhPz7xGwXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWuT-002Pqr-2l;
	Wed, 12 Apr 2023 09:37:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWuQ-002Ppg-25;
	Wed, 12 Apr 2023 09:37:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DB9362888;
	Wed, 12 Apr 2023 09:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676E3C4339C;
	Wed, 12 Apr 2023 09:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681292217;
	bh=59wVY3/LuZKY9TMD37GIsizY4kqoEg6quzbNKB7N/To=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=uv8HdqXLam4ULkTjp5ZhSnbMfwlERdPjID5oxeJATNWd1JWuXSeAYydT+ktCTml4H
	 LCXGPlUD/4uCFCahaS9GhVMXcQyvIAuC8f9ob2gSCeWmzcmlHAZIqWWRmjZAHzdFZR
	 /bT6pwppaX2o+i+j3ZPrCmdmgSW7cf7eiAmsGOqLY5RwXlvbHhiFIwUMl/WF2dlct5
	 pFXTBFW44EsSs/rtOKvBwpvH09uGirCNEkFyYKKR1V5UqlKhIkxF0/S50BaTw2O6IW
	 CQXtDWcCyTM+oHZJm4tR21xjE6Xss5pCvB33aW9DUhSIi0uGpgRRIuQoP7GRtkNWTu
	 zRyCU9Q7yQPiw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-firmware@kernel.org,  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,  ath11k@lists.infradead.org
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230405
References: <87cz4ia35m.fsf@kernel.org>
	<8ceeee1e-8828-69a9-facb-20c3787207bd@linaro.org>
Date: Wed, 12 Apr 2023 12:36:51 +0300
In-Reply-To: <8ceeee1e-8828-69a9-facb-20c3787207bd@linaro.org> (Dmitry
	Baryshkov's message of "Fri, 7 Apr 2023 16:35:08 +0300")
Message-ID: <87jzyh8mrw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_023658_722068_E7A8F64B 
X-CRM114-Status: GOOD (  12.62  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hi Kalle,
>
> On 05/04/2023 16:07, Kalle Valo wrote:
>> Hi,
>>
>> Here's a pull request for ath10k and ath11k. For ath10k we have lots of
>> board file updates in multiple hardware families. For ath11k we have new
>> firmware branches for QCN9074, IPQ6018 and IPQ8074. WCN6750 also got a
>> firmware update and WCN6855 has board file updates.
>>
>> Please let me know if there are any problems.
>>
>> Kalle
>
> Excuse me, a gentle reminder regarding WCN3990 board-2.bin. It was not
> included into this pull request.

Oh man, sorry about that. I guess my installation script was buggy and
missed it somehow, I'll look at it later and make sure WCN3990 is not
skipped anymore.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
