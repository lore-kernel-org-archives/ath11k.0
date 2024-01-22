Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BB5C4725D
	for <ath11k@archiver.kernel.org>; Mon, 22 Jan 2024 07:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B02ta25AWF8fD2tp55WVILWNvaFECYM6A7W4agU39gc=; b=QxHLV9opibh4FzVFycme5I/NDY
	yN6KuNm1ABIqypCZE1xMuAt3Y+M9Kepiq31F86kLDUjnQOBp6bAiOaklU/JKmMquZo+Tbl2/jMrtn
	mTXkzuUY0R0OY4A8No1nqpfToPe0ho/Dz/JJ6onPc/DX30KDaJPzOkNt2gDGMrywixdSRB3agUwfV
	fglH61MdoDCVo5gVfbBOyXY0ror+1Xl40gOgl/hBV/exo6tA305ecs1LJkZaOd0kIxTO4GhI46dJA
	jgMANTqEpjuKVG6/waaYIJZ2XYf6JyPuaX/hwvPCEreikR4ZLfQwpuM4I/5mYjzGxmyKqPdGLXsr2
	jV/ZpAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRor0-00AsLI-2t;
	Mon, 22 Jan 2024 07:36:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRoqw-00AsHz-1s
	for ath11k@lists.infradead.org;
	Mon, 22 Jan 2024 07:36:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 313A5CE28E8
	for <ath11k@lists.infradead.org>; Mon, 22 Jan 2024 07:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA07C433C7;
	Mon, 22 Jan 2024 07:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705908972;
	bh=SrTp3PRpdblpdcnQdNS+rwPFtdOvVuJC8W/HbbUn+nk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VcOR1R2y6rJWJCNmM6ZDa6R8IR9TayybDUsbDEdtDackdY0aDMnEZWvm7Znu621To
	 7RNBVFztI8H93etVqGE7lUzCBERKj8ZeOMJSmhHPGkZ+kcDUpHbTxYfVa7aaHYOcor
	 4ybqqi6S5shb0D8pchutI6dDi/A6jvtjPtEvs4JV4pYWST1y+1JmuZzShnOEg3C65g
	 ER2sZi7xIF9O+GXc/hAJ4wpluVIw3+UvhzlEFSbblGSNWsyjb7ML3YJ0bx8+9v2lfb
	 IaDmPalmLKHe782zFgjR3aHG0eG0Bh++VbRHcvemFyfTN9M/Yo2vB1YHqet5Gja9lH
	 22Kgyo1EGsieA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,  regressions@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [regression] ath11k broken in v6.7
References: <874jfjiolh.fsf@kernel.org> <87frytg7b8.fsf@kernel.org>
	<878r4lg3t8.fsf@kernel.org>
Date: Mon, 22 Jan 2024 09:36:08 +0200
In-Reply-To: <878r4lg3t8.fsf@kernel.org> (Kalle Valo's message of "Fri, 19 Jan
	2024 09:50:11 +0200")
Message-ID: <87jzo13jmf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_233618_813513_1C88F501 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
>> Kalle Valo <kvalo@kernel.org> writes:
>>
>>> Just trying to make everyone aware because I suspect this will affect
>>> quite a few people: ath11k is crashing during suspend on v6.7 due to a
>>> mac80211 patch, more info:
>>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=218364
>>>
>>> Proposed fix:
>>>
>>> https://patchwork.kernel.org/project/linux-wireless/patch/20240111170629.1257217-1-benjamin@sipsolutions.net/
>>
>> The fix is now applied:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/commit/?id=556857aa1d0855aba02b1c63bc52b91ec63fc2cc
>>
>> I'll try to use regzbot for the first time, let's see how it goes:
>>
>> #regzbot introduced: 0a3d898ee9a8 ^
>
> Forgot to include the bug report:
>
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218364

#regzbot fix: 556857aa1d0855aba02b1c63bc52b91ec63fc2cc

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

