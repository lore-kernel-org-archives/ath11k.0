Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFAAECAAD1
	for <ath11k@archiver.kernel.org>; Thu,  1 Sep 2022 16:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9RfFGFmff1XwFiM80FoOfXDRT35QLwKX4+n4stNYFo=; b=RIzSL98rZbHNoB
	OOCbBEP4NCq3nLVW9AR8ERkAL83E3YCKKZjRwUz3NceiaMAKh7pY/gA1maL/1mjuO8upy6wvjsZbp
	f+3bd09lM81zwRArpLBIYNq74PD4YM7PQHYs8nE6zsjDqNW0+I3NTaQ0XDwj15TExFag4A7aYyYQP
	mgQoA7Riw8QtCwQKSKpa15g4EJGknWrGe1w2UtEygxoydhPqT14HncmnS9ceIRAljArlkvK4A0x6q
	mzYWGAQNlenbTdMfyae71IaXLXK44UKu94zm1SuligmSAaTguYKO/drFfnn/IAZg6jPgR48Kptiwi
	dDKHeQ9vZDBnazQINt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmlX-00DAgy-6o; Thu, 01 Sep 2022 16:10:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmlU-00DAeV-47
	for ath11k@lists.infradead.org; Thu, 01 Sep 2022 16:10:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DB922B827EE;
	Thu,  1 Sep 2022 16:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4DCC433D7;
	Thu,  1 Sep 2022 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662048596;
	bh=6hvdDiook25zvx8FoPSAj5qTF9HrsRKDM9Y/2TDoYV4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=NbmacAaAnj69JGErJtjcFHE/aNsumMpMz+pdiUWUU6gjD3b048InSFT+we4Ug6m9b
	 vyL0smTaZzmlKtoFWDzWQ3ywdEGmhBROQE8H3nUhgi0qi2aQZe+8md6xACk7pMlD6d
	 0+KXpdLvM9TRTaKQhqxlVFR8xRhk/5zilKTBdeEnYrdbmj0SFedbhFU7E0Mlqoi4T2
	 8Qtx8sFhVXlJ3LuyclfPmkt+kkjzO4pzDvu9FNq7hgAYYGuX4sk1DfDgJGHdaOsR0u
	 rVmxIGiiKU37XL3tOh296JQbmlP/kZCxljEunPvV37+Dv+uRCxjI9DLs7FSlfQjLYD
	 gye0BFbFh3syg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Register shutdown handler for WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220720134710.15523-1-quic_mpubbise@quicinc.com>
References: <20220720134710.15523-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166204857927.15293.15300946292599236513.kvalo@kernel.org>
Date: Thu,  1 Sep 2022 16:09:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_091000_355022_6564732B 
X-CRM114-Status: GOOD (  10.89  )
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

> When the system shuts down, SMMU driver will be stopped and
> will not assist in IOVA translations. SMMU driver expects all
> of its consumers to shutdown before shutting down itself.
> WCN6750 being one of the consumer device should not perform any
> DMA operations after the SMMU has shutdown which will otherwise
> result in SMMU faults.
> 
> SMMU driver will call the shutdown() callback of all its
> consumer devices and the consumers shall stop further DMA
> activity after the invocation of their respective shutdown()
> callbacks.
> 
> Register the shutdown() callback to the platform core for WCN6750.
> Change will not impact other AHB ath11k devices.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ac41c2b642b1 wifi: ath11k: Register shutdown handler for WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220720134710.15523-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
