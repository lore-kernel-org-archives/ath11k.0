Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AA0E7E64E
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNugxlgjw5NAjgA8jZUiH625TDJ0/b8ma0oyvP5tcms=; b=lBCgE5eZztd8uT
	SKS0p3//90m3GE1f0C8D9m1F67f7rWjkgC/6PVEym/rokLYSzom7Yfri4yCrJYXKblCSPj38zJ1uH
	yJDU5hkv4NlhoZh3k2VmuX1WT8t9Pz+OgOywhMDFMAluAjTnwSwWsswaL99NdnJUiMjQOt7by9odJ
	mwAT5rLCdRhne5YZmxxJjq55KlTIrw6TTslWWQ626vbNfkHC95lAthTVltKS4leNiUR180kmKTv/z
	pOlTOelF9fpdN456h8uQv+M5bxmRT4ZgzVHfg69/SWKGR2Z/93f9g4HsEVykzbPzp+Nd6INeP0k7o
	6VNjVyGkqRdUGVjEID6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlB3G-00Gj6G-1G;
	Tue, 26 Sep 2023 16:36:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlB3D-00Gj5r-2B
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 16:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A699614E2
	for <ath11k@lists.infradead.org>; Tue, 26 Sep 2023 16:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B478C433C7;
	Tue, 26 Sep 2023 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695746202;
	bh=lP81uXoqChNq6ZrPgB/+WsvOkHx6EnfAUwM1LkqDnvU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CKbs5rJ0/RY2YSaDoBpcEwpN4FKzVMUIxuRpWOM+IJXQ2cARULamePKKGm69YBj3a
	 EXewJ2LBEsDebRZ/p+APfg3H/NPIH4iJEc+NXT6O7V+oHn2srYUvSKWZU4x/ImzxFP
	 0sjfxyn0KglrgfqEVzsS68gEsIucNYWuAnlxZJ0MiOdFfkdd6/Qxtlj1JiiThr/W9L
	 8XNCHKK5ImfQZfhNu0VjiBd49YM+mf1mRFKlc9Z5rQQw7xKCcgigYc7cVOTYpoKvAT
	 6mgw7agEBRGD1D7qtsHMGAxrrp699ETLX7Fv4DgqnK1ope7UamRWOWzKt8/FtpmsEs
	 T9HA6pryhJYAA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath11k: mac: fix struct
 ieee80211_sband_iftype_data handling
References: <20230926163350.2641064-1-kvalo@kernel.org>
Date: Tue, 26 Sep 2023 19:36:40 +0300
In-Reply-To: <20230926163350.2641064-1-kvalo@kernel.org> (Kalle Valo's message
	of "Tue, 26 Sep 2023 19:33:50 +0300")
Message-ID: <87jzsc99if.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_093643_756613_056CAB6C 
X-CRM114-Status: GOOD (  10.47  )
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

Kalle Valo <kvalo@kernel.org> writes:

> From: Kalle Valo <quic_kvalo@quicinc.com>
>
> Commit e8c1841278a7 ("wifi: cfg80211: annotate iftype_data pointer with
> sparse") added sparse checks for struct ieee80211_sband_iftype_data handling
> which immediately found an issue in ath11k:
>
> drivers/net/wireless/ath/ath11k/mac.c:7952:22: warning: incorrect type
> in argument 1 (different address spaces)
> drivers/net/wireless/ath/ath11k/mac.c:7952:22: expected struct
> ieee80211_sta_he_cap const *he_cap
> drivers/net/wireless/ath/ath11k/mac.c:7952:22: got struct
> ieee80211_sta_he_cap const [noderef] __iftype_data *
>
> The problem here is that we are accessing sband->iftype_data directly even
> though we should use for_each_sband_iftype_data() or similar. Fortunately
> there's ieee80211_get_he_iftype_cap_vif() which is just we need here so use it
> to get HE capabilities.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>
> Reported-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Changelog for v2:

* use ieee80211_get_he_iftype_cap_vif() instead of open coding it

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
