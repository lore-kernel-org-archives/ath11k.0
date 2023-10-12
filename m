Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4CDCDB482
	for <ath11k@archiver.kernel.org>; Thu, 12 Oct 2023 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jF+K4yossIiI+Qhb4x+7qoaJ3zm/CzVQj4aqyol3tvk=; b=HCZz2B8jSxLI7N
	e9bm7ZCDUktKsU7OMEAr1ICvm9vg5Kxm3sLlB5HETTzOHzuUjANXvvivbnyEBccBI/Ny4wxUaIK6E
	MhMb8mzyf2aIjeES/sW+G4mNjE2hmjU2XPgrjqIU7g7rRwhlNBW1x/Yw2s8N95KjD1gmtEfX3TDuI
	dmcytZRpAyP7PnOCBIgnrc+my3EpKrSZfHT5mEd8MUe/IeORtB56ZgNFtcw+vKyCRekweo9o604IM
	DHRQ+0P0Iy8/BoLvkWfhTkybUgtDoU611/e8bc+aPPkOv7h7xmUMTN8CEI9pEecee18eYtfibQ0P6
	ZZPC0/OMi1m4s7ifG/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyBi-001MCY-2Y;
	Thu, 12 Oct 2023 16:05:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyBf-001MBE-0m
	for ath11k@lists.infradead.org;
	Thu, 12 Oct 2023 16:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DC5B9B82536;
	Thu, 12 Oct 2023 16:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A22C433C8;
	Thu, 12 Oct 2023 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697126721;
	bh=dPq/9PG89TMNNnkHSr6IEMvTWzoUZUNyWBAewZJKpcU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LvBGyntd5PovfxlnjCb5wVi31wuW7U168pycNqp5oaH8mye6LWQbQy92JGOEDm+gx
	 y5EDyUiUq7gbIua4oI+YAE8GlPTUoDtjzTSHGMbPO0hK3/mFWXqpUIaIZcg8qVjDDL
	 qE7O66bt8IhjKU1E3AgYpCxTtLj9bRUB8cWS1CQFMVCcBhEa7R9MGakB0HVi5mIIwg
	 +rGs+iu/RrJqQoD0ffSBZS0nPsBdBm74oPUv2Rgp20g/7fp3LWYNdgpiZ+G1H6qGNB
	 OsNpfIALH6Ufc4NXjnSLFJld1ivVyvYvQGHC4QTrl0RZbzJkZKVp9qQo74gYj1wKQe
	 yWCGE9ws4kKmg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: add parsing of phy bitmap for reg rules
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231004092655.25020-1-quic_adisi@quicinc.com>
References: <20231004092655.25020-1-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169712671798.3501995.7550193627485871420.kvalo@kernel.org>
Date: Thu, 12 Oct 2023 16:05:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_090523_411061_BAD6E790 
X-CRM114-Status: UNSURE (   8.83  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Certain regulatory domains could put restrictions on phy mode operation.
> For example, in a few countries HE Operation is not allowed. For such
> countries, firmware indicates this via phy bitmap in each reg rule.
> 
> Currently, there is no logic to parse this info and then pass it on to the
> cfg80211/regulatory.
> 
> Add parsing of this phy bitmap from the regulatory channel change event and
> then accordingly map it to cfg80211/regulatory flags and pass it on to it.
> 
> While at it, correct typo in debug print s/dsf/dfs.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

534c2dd8099a wifi: ath11k: add parsing of phy bitmap for reg rules

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231004092655.25020-1-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
