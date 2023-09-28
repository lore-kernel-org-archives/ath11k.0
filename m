Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECBAE732E3
	for <ath11k@archiver.kernel.org>; Thu, 28 Sep 2023 15:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aSQzZZRocsYOpfp6JAbXu2qtN8Lze/Eg5SupwFG3Eg=; b=yfPjoJuf2BHFff
	ylSJjqvuLwbOy17f+gb0oj86/M0ivJbRFhjdjXdNxAkOLzaS3Pr5X+XoJzp5OdYEbMmQdsYqjBbUe
	zT31s3SmUF9k/whlGyoz5fC6Lz5HKNNx8SMHbvo8kJRFe3JxHEl47nlxw56gI6rF4eFWOJ6k1fHpm
	Tp0xV3vDZipObPAQwCz1jos26qg2CcKs2hiXrfFcVLiJywxrQDBkktN0zDgCCkRN03CIum8sRUmVk
	jboyv+QruWAlQm18G8FGa0qFlaycv+fzZyDvc4IdWoaNdWsrAazrbfnnHXKXziEPZQ+f7QeQq6ATd
	+wmECZji55qtcRmnspoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlskC-005KIR-0J;
	Thu, 28 Sep 2023 15:16:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsjy-005K6c-2O
	for ath11k@lists.infradead.org;
	Thu, 28 Sep 2023 15:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1BD97B81C55
	for <ath11k@lists.infradead.org>; Thu, 28 Sep 2023 15:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B1BC433C7;
	Thu, 28 Sep 2023 15:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695914144;
	bh=XOhBYn/JHHhfAw/p/+BQBzEcxPWQepN23p/3A8jF5aY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kIJMKyLGP8czi/FsD3bViZ8B8OSpGrvB01SnA1BHWrNlzNePGrS2cCyQpCmYULvu8
	 sh4TPZWekcNvRbfGE/fTXYs4c6Co3JHxGSDqNyX5IFpU7IF299tCtvjzf8IoOt2aG6
	 +GViy5wYKkDMeaXJ/xjdsyV7nI3956vtN0LNBfLorxAa0JchlWBmT7r/XaPhvsnim1
	 lW/0Ed4OE1Ow6HoRz8qlGTkdIOEWtzuG5W7aa4+rr5oABlc4MCl/vGyWpUx0JPLITg
	 I/n6p5NS3KGGwEY+l1S86hn7PzIVKd4w+XeysJaWMXip/JmwaAbMyvyitVqEkUV4j6
	 9ZQwH+1mi8yMQ==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/1] wifi: ath11k: mac: fix struct
 ieee80211_sband_iftype_data handling
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230927142708.2897504-2-kvalo@kernel.org>
References: <20230927142708.2897504-2-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591414195.3019228.2015665207547569831.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:15:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_081546_943932_D6F7B108 
X-CRM114-Status: UNSURE (   8.02  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> Commit e8c1841278a7 ("wifi: cfg80211: annotate iftype_data pointer with
> sparse") added sparse checks for struct ieee80211_sband_iftype_data handling
> which immediately found an issue in ath11k:
> 
> drivers/net/wireless/ath/ath11k/mac.c:7952:22: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wireless/ath/ath11k/mac.c:7952:22:    expected struct ieee80211_sta_he_cap const *he_cap
> drivers/net/wireless/ath/ath11k/mac.c:7952:22:    got struct ieee80211_sta_he_cap const [noderef] __iftype_data *
> 
> The problem here is that we are accessing sband->iftype_data directly even
> though we should use for_each_sband_iftype_data() or similar. Fortunately
> there's ieee80211_get_he_iftype_cap_vif() which is just what we need here so
> use it to get HE capabilities.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Reported-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9e61589ac3c2 wifi: ath11k: mac: fix struct ieee80211_sband_iftype_data handling

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230927142708.2897504-2-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
