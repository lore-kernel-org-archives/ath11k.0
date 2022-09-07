Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D3FC54EE9
	for <ath11k@archiver.kernel.org>; Wed,  7 Sep 2022 08:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLjuKA7MR8TTHOxljtofn10Mr7clZFKrghCxz/8XAjM=; b=EbHXteehzubrrK
	PYwh5pJTRToPh4pDfTtmZiP3JvZvpihkk5Z/ZKF3nc2SrTGmXGp+H/IXBHgLzxB1St5VtHP7mCPqT
	YdEx/zbOZ7Kj6D0jpaAUCpKCHckMSa+coE6ypu+x+wQmzkmUzfgPrG2UfWpdxlYvSLc1VVYxU/DBX
	1ZgDh6HxXpFzGJp8kNWYNxHF0ZznV4IukdKMNIViYsKZ28WFKsYduRpRLvTBAhC/VemUHZHMY/WBO
	JDVefB+nuj6RRQ6/rmg9Z9tx7AH+/QrlAtMZ0ir/7aghQRI+xUnHaXfciFKw41OExfCgb6FG7w6x2
	QwdMDNU5ipg2vqiJEusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVqTZ-004IWZ-UN; Wed, 07 Sep 2022 08:32:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVqIF-004AT8-BP
	for ath11k@lists.infradead.org; Wed, 07 Sep 2022 08:20:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7639617AA;
	Wed,  7 Sep 2022 08:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D49CC433D6;
	Wed,  7 Sep 2022 08:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662538818;
	bh=vC1xo+f/KdGX8B0lKVlxVLXN+g1w016Xr/3R/zixVPo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gJvE3dXJYJOtsg/Mtkg1BHuJGOO3ZtWuUe2h3bqZu1VcJfIgQsZxhwM8YVzxRrIdl
	 plgWcPZxKCcx4/0hZAdyjbscZLQLM99BiIW6sq7X3zrXhVZ6r+ncMSPbIe2doBEXGg
	 YaU46pI00XlWcVI+pPcP2unVuE3XZD7KUtx2A3Qv2kANQkm8ANSwIRA9U/0NP0+jJ6
	 49G0en/VqvmmhSROw2NjNU9ULYcXXCz/1ANZ8ZuUpmrYedFU4RBT/zNR0sq9jCc9rj
	 1n2A7Jr65CJFLrZlxREA0qXG40CeETaM1cfTFPN503X0tsHmjoDOEKNgOIgJTcXlP4
	 K0I2nWrMjIWnQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Enable remain-on-channel support on WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220901080656.3450-1-quic_mpubbise@quicinc.com>
References: <20220901080656.3450-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166253881172.23728.9477056475033732029.kvalo@kernel.org>
Date: Wed,  7 Sep 2022 08:20:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_012019_511345_4CA8570A 
X-CRM114-Status: UNSURE (   6.88  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Enable remain on channel support on WCN6750 as it is needed for
> GAS, Passpoint.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

36893e45b192 ath11k: Enable remain-on-channel support on WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220901080656.3450-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
