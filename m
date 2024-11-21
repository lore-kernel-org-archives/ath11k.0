Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4CBD6ED01
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 11:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovMgl7ny9VshYV+DQLhxWPBMjubV3Hzau69h7Ocp8Lw=; b=TC1G70P0Zmemjv7WglIp0myUuD
	FYhXgtMm13sygeUjUIDoFWwxEvzJgh9LkPZZpgANaczMSlnYzAAGJ3+R7HsvBRkmWa4TxkbQ2ryhi
	RSERqdK27YqnxpyuWvJIhLsU3+ZsmF7M2bzZkTWLB+pXYtYqMmVJnfUlRFnQkpKj3TC8EXbxzD12j
	futy+4wYsPKQ+4a54QsS/CbKLHXehADgFyD3Mr7M3ZTDmH+/Ersfp5I9RRanqXZZTP62XkQ/CllDP
	qZMbvl400UA9XuyvdQlAZn3mCX6ZyjfR16Cc6qkwV/sfpPjmYDuTAQmEdCgiID6W588lP0+yYVVZh
	UqZe/KJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4vf-0000000HPw0-1z1S;
	Thu, 21 Nov 2024 11:00:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4vc-0000000HPuV-2Q3A
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 11:00:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B1E95C56AE;
	Thu, 21 Nov 2024 11:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB14EC4CECC;
	Thu, 21 Nov 2024 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732186851;
	bh=vkK7dhEzDZlHSoKxdWBYT5h9qXJXR4t0Gs/plAHsc+4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JaNOzGy68FJSCeakcLg0/xTX7H5o1PLXCVEsE0Eq0C1wZKyxCKnHz/cn99/FZtg++
	 8dtR+FWGXRMit3tCvbY0fvKtbc1G+MQGI3XQp+pGRrV9tOT0GE7ftjU1UYZ3OZv33n
	 8ATdjxdF0/zmF3QP2ADVGz8wIpS4UO5DELiEYvosMtsLZ+lHh6AAWZqeStcnmNS5wx
	 e5kzJOr4gOR8WiXgVgm78FThBaJaHS2emnHWSTmcJiQUb1TuGbXbrPjy0ykMXNbRyO
	 i+9SDjAp6scaLh1vrNaq94uoX0HIo5iOab7RKv9JbUDg5eHOifrrdu3dfxmQJQz1j7
	 uKwFCFKNXwWig==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <jjohnson@kernel.org>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 4/4] wifi: ath11k: miscellaneous spelling fixes
References: <20241111070152.85140-1-dmantipov@yandex.ru>
	<20241111070152.85140-4-dmantipov@yandex.ru>
Date: Thu, 21 Nov 2024 13:00:49 +0200
In-Reply-To: <20241111070152.85140-4-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Mon, 11 Nov 2024 10:01:52 +0300")
Message-ID: <87bjy8yhpa.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_030052_654107_C199E0B6 
X-CRM114-Status: UNSURE (   6.44  )
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

Dmitry Antipov <dmantipov@yandex.ru> writes:

> Correct spelling here and there as suggested by codespell.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

