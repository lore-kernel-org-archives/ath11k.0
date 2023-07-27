Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36C6C001E0
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H78sAfP6OETSC0FVL8Vih8jNe14LzQ8GmX66fQBMHLw=; b=2RJqwVZ5M3BmVt
	M8mm5MF4aERZy63nNPBmlJpGqUtD+vlUlYnJ5P4+8TOJ12bax9dqaHcZaBTSzGRBqqHikVPvh/a9c
	smGx0kGJ+KlFLrmT9LO/DuC81F1I7p8cU1XNNe0vdAyLORoG5uhKiEUFBLwRHksQ2j5SnT2epj+7k
	SQiwbUcJBGIigwTYcN7ba/Jh0gW6iOWlLeXk5sXt9iFhxICRXDe8L2sRVfxzMYGUw/pXf9GKKOc35
	kac5yFMCmoYNXYS+EtIHJ8SgcYWFAsmEzWXpEBYwWZRk1TXwNQP2IhWhbEhR0GDENx3bDmGlp/BlE
	vBshNXzClNx/6W7zoQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3s4-00GaAO-0U;
	Thu, 27 Jul 2023 16:29:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3s0-00Ga7u-2p
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 16:29:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E33261EC6;
	Thu, 27 Jul 2023 16:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE05C433C7;
	Thu, 27 Jul 2023 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690475383;
	bh=kVFC99jJRlmdXMNhJFcFYfviubIHE7J5Ygi42v1zFfs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uvzWOlDcRpwUgAChG0NrvR78czcPDKMVIYWIkfVOVd/zBbHEqZxfkZbSzhRAdL4f+
	 KQktQUMBlR2cPeJr6lOBV5+fktc9/tBdpxw6dTm7obyytz4wPT1tFKmrkQKc1JgdAN
	 J0LmwAa6KvoGqETcJDbREP0szaKzXr+C6VcHAwG4zKm4mOOEZ3SOmOgkFpysUSCFIW
	 fLGWGK2DcNmc/72/mpsgI9Os9rihbzDobK3J2oZU084gcY/TNPOYi75H69WH/uk1Uq
	 5I0GGcwvzGMsnLTMQjOGR+i+35Wcnap1XhkcKz4iU9CUzrJTCKTpdusgFzXels6m7i
	 RbWfQPPcDIL0w==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  <johannes@sipsolutions.net>
Subject: Re: [PATCH 1/3] wifi: cfg80211: export DFS CAC time and usable
 state helper functions
References: <20230607124647.27682-1-quic_adisi@quicinc.com>
	<20230607124647.27682-2-quic_adisi@quicinc.com>
	<5e45705e-b1d1-a0dc-2c3d-455fb433e93f@quicinc.com>
Date: Thu, 27 Jul 2023 19:29:40 +0300
In-Reply-To: <5e45705e-b1d1-a0dc-2c3d-455fb433e93f@quicinc.com> (Aditya Kumar
	Singh's message of "Thu, 27 Jul 2023 17:35:28 +0530")
Message-ID: <87lef1z5aj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_092944_962872_0B03FD7D 
X-CRM114-Status: GOOD (  13.36  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> On 6/7/2023 18:16, Aditya Kumar Singh wrote:
>> cfg80211 has cfg80211_chandef_dfs_usable() function to know whether
>> at least one channel in the chandef is in usable state or not. Also,
>> cfg80211_chandef_dfs_cac_time() function is there which tells the CAC
>> time required for the given chandef.
>> Make these two functions visible to drivers by exporting their
>> symbol
>> to global list of kernel symbols.
>> Lower level drivers can make use of these two functions to be aware
>> if CAC is required on the given chandef and for how long. For example
>> drivers which maintains the CAC state internally can make use of these.
>> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
>> ---
> Hi Johannes,
>
> Do you have any comments for this patch?

The wireless trees are closed for July:

https://lore.kernel.org/all/87y1kncuh4.fsf@kernel.org/

Though I changed my plans and came back earlier.

And honestly these kind of emails don't really help. If a maintainer is
busy (and they usually are) sending more mails will do the opposite. If
you want to speed up your review help the maintainer somehow, for
example by reviewing or testing other patches etc which can reduce the
load of the maintainer.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
