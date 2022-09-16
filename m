Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE75ECAAD8
	for <ath11k@archiver.kernel.org>; Fri, 16 Sep 2022 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dCK10KMvKVwrDerLovxajXyRMICFHGu6AP9CHSGyew=; b=bmCqMofvpNx4C1
	Hi9IL70OKF9mDLwC4FY9czkgduWjkBhBDIXMpc215E/6RVWLuSQteV92JdzzBKCaX6aqFi4taGStY
	RZ4s8CCqNUBhebHshNji7xJA8wRwYkC+SS+CQKtUwy72xMhZYYAXxkddl9lbnEfKBfWu6fU/MJVZh
	7trtXxOHfzSUsehk4KCjUNqNycZVap5vMXY9V0kb06ILZWzlkcV8k6tG/aVcZli+g+Skd2u+qNGgD
	Me8Y3imqC9rOvzQIH9OoeS4X5kYSlBwUpP4mLvaM/dAUn5j6ezUf8Q3L/nwt6eXogCUoHhT7l533Q
	ZNRfhpElCbvU8hv6nXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7Wk-00Bdr3-A5; Fri, 16 Sep 2022 09:20:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7Wg-00BdmA-4Y
	for ath11k@lists.infradead.org; Fri, 16 Sep 2022 09:20:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BDCECB810F7;
	Fri, 16 Sep 2022 09:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1A4C433D6;
	Fri, 16 Sep 2022 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663320043;
	bh=DedkR12MGDILhlqL2Fcg9L71pkbsanV0/p9k6dJkPw8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YrHnKB9aCuyOlStG87qHn2vgKmhB8f/lOLDwdOlecy9wqckxXEOYcYC8qvslx5Da0
	 +mHdd1njdWesH2eDQmIFf1FbmOMdzB98kutUvtwJR2/KqaThjt4evOD0AaaSQXwqZZ
	 82GtuSknC4PPmIk5rjjFh15R631ASoVUf0x1oa2UNuM8e8EzGDKq5JlX8sIJY3gA9T
	 M7fFxAv05VEnhReFRqjAooWJ3HxP1cile2rSmpXDQfvPwYR1ayjvRhIWaxLaUl3UMj
	 J5tdtD2E1D2wdDmb+pxbQLdYuN02hom3VKXVNEya+JKN40iNOZpQMgBMnRnKl+REkB
	 oJ8vdQ7Vg3O1Q==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Fix kernel-doc issues
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220909151246.22961-1-quic_jjohnson@quicinc.com>
References: <20220909151246.22961-1-quic_jjohnson@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166332003954.3127.7361037879109120019.kvalo@kernel.org>
Date: Fri, 16 Sep 2022 09:20:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_022046_368285_BB7D1BBA 
X-CRM114-Status: UNSURE (   6.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Fix documentation issues reported by kernel-doc:
> - Incorrect use of /** for non-kernel-doc comments
> - Mismatch between documented and actual identifiers
> - Incorrect identifier syntax
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3f505a30ea6b wifi: ath11k: Fix kernel-doc issues

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220909151246.22961-1-quic_jjohnson@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
