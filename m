Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87442C433EF
	for <ath11k@archiver.kernel.org>; Sat, 23 Apr 2022 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBgt8HUN549k4lOFvZqgqsZ/hRh4BggN6J9LxLpv3tc=; b=IT33fEfCPYWliA
	Ck369qErLbP+AhGTEfsbqR0Wr0K89w7MBmteTTBTXofpIHAN2Pj8N1NlSV0y92dfhRVVouDNqyUhG
	WoYAUJfR9Y61EKyuu+oRGcenBEXDmOvKHJJn1srP45q6POHWggd7KZ0itFNqDo93h1ryypLlxQrrm
	hu+0KJXrqJnZUToDXkGnb+wKX1ihgs9uA1/phivQxlSZXY5PofQLEmpS3o/7MFKm0AVLZZp974Nip
	MOHR90yTzRQGSevK9ylAIoDeyjAg4leTcXO8ewBwfEOqd9TWAQs8AEdmV6s/zIbw7hRSZ+1ZF89iF
	RqROi7ZmJeVVRJ5zadsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niC3x-003ugL-04; Sat, 23 Apr 2022 09:28:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niC3t-003ufw-Vh
 for ath11k@lists.infradead.org; Sat, 23 Apr 2022 09:28:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F1D060C8B;
 Sat, 23 Apr 2022 09:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E63C385A5;
 Sat, 23 Apr 2022 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650706096;
 bh=/+CKqgTbK9rNNHE8MCzIbx+SObxDR4c6qp5yN1sWSCA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=nsi8Z8QiLbKVacOfIA9KGhtcV9Xr7+bgaXaPA5pfwyoixWIoYFg0ur3QNd/zaT6UN
 KusmWz19YQwdUOJNJUyMBTP9kltY1bhpJDdnUjuYske192NBEENzUq6IMVlaDj4btF
 H2AMx/oxlw/jx5VyELmXrILkLhIs7nwPg/NBMpq5WgaZ/eNH2o1iO8dGk6hIHz6U8F
 mZQbEwMLeQa+UfpP1LwByasAfFc2EdgntqzQZBHwpQ9OhGK+/LWIx3mPSBRWoBQFX3
 WqHyuZm27sBpCVqY+jJjBr+h4UA3EKxiAjSvevqAbB3HGIZDGE/yAqzBaAiiHNacgr
 0vj6cys8g4+Jg==
MIME-Version: 1.0
Subject: Re: [PATCH -next] ath11k: fix missing unlock on error in
 ath11k_wow_op_resume()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220408030912.3087293-1-yangyingliang@huawei.com>
References: <20220408030912.3087293-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 <quic_kvalo@quicinc.com>, <quic_cjhuang@quicinc.com>, <davem@davemloft.net>,
 <kuba@kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165070609282.959.52286614356518398.kvalo@kernel.org>
Date: Sat, 23 Apr 2022 09:28:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_022818_104674_CFE692DA 
X-CRM114-Status: UNSURE (   5.83  )
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

Yang Yingliang <yangyingliang@huawei.com> wrote:

> Add the missing unlock before return from function ath11k_wow_op_resume()
> in the error handling case.
> 
> Fixes: 90bf5c8d0f7e ("ath11k: purge rx pktlog when entering WoW")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

605194411d73 ath11k: fix missing unlock on error in ath11k_wow_op_resume()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220408030912.3087293-1-yangyingliang@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
