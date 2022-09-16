Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CD8C54EE9
	for <ath11k@archiver.kernel.org>; Fri, 16 Sep 2022 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkR9x67yLpyd0UTf009dud2d12k4H5z9w2Nbt84e3uE=; b=wTWb5ZVoULJ7dc
	072TfMevgElfzT3QzGQBW5dg2B5gVZsNH4fYacBCk3ZVnt6uPTKek613B52E8kXp83lM5rcSalNHz
	Jg9cqn2DEfTqnTmY4W1AaWmk6ilJH908wBuVunwNCfrRq/TYHS9M4QqE8LGN6Ln8ySa8Jt9SZwuUa
	UimibMAhZkZlzSbLCUmDordE3fqZXhnqME0iJYxOglD4J80VXzuav062KQYp3cedlKn5KH9Gw40bx
	piHB3PPWI4JirXWETOx/j6bwum9o/6WCGExULkI9VTGgp/Z5/MevQz/YAGtE0VoKwcpdBlPYcrhVo
	k3b8t0USl2nwQGP73jVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7VQ-00Bcwx-1A; Fri, 16 Sep 2022 09:19:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7VN-00BcvI-Co
	for ath11k@lists.infradead.org; Fri, 16 Sep 2022 09:19:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD62362972;
	Fri, 16 Sep 2022 09:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400A7C433D6;
	Fri, 16 Sep 2022 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663319964;
	bh=pN2OW3EORLXqVnkTRzakv6rscjLGxA/+z976k8wEY8Q=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Z3SLybas6VHvRutUEUDe5zDYTXg2rVJ/ejUmCooO3HJlmHy3ML2NF2F2+XuYDyTs8
	 0v+HKXFMzwtumXHyyIPf6L0pC6v7rjor9+1tUn6ma//YM6bN7mKi4mNBsrs+FxDPHR
	 4g5OfuZ9ZHtJcHEeRbITH14uxQWqRSOfR7kqHMO7MMomtR5YkeHIrGABXfLTLXIrzz
	 0LTShhzqDJWIcezjepg7KnIaJ/qD1Ir8I0eJwPzTjyhZwEzLXwIhEf1qCiZwQw4DFN
	 qi245dSghp7f/3WGkcxuo6ISsP+qJ6UCE1vseREO3sumAbLlLjttG1PhCvf+5pImbR
	 /Sal6PShMcrEQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Fix miscellaneous spelling errors
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220909145535.20437-1-quic_jjohnson@quicinc.com>
References: <20220909145535.20437-1-quic_jjohnson@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166331996035.3127.11557394788042015674.kvalo@kernel.org>
Date: Fri, 16 Sep 2022 09:19:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_021925_494292_3C19D7CA 
X-CRM114-Status: UNSURE (   6.05  )
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

> Fix misspellings flagged by 'codespell'.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3fecca0e7de8 wifi: ath11k: Fix miscellaneous spelling errors

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220909145535.20437-1-quic_jjohnson@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
