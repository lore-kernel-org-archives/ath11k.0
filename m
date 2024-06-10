Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B050AC27C55
	for <ath11k@archiver.kernel.org>; Mon, 10 Jun 2024 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkHbXBxiSeQNJDoCrgVgVGRrwL7HlBe4Up1VjE9guEw=; b=ARzXf/mq1ByXPT3PVZiE2wRDVh
	AW3ZoP17gEk1LPhiikrFfooRQ8jZ6OzlFvlHOOyOUNToiC1ebEPs26oUMwRUquSkObhqKp26fVL1R
	QAWi7H2zHf0MAwF7wlbRGOmvX66liD/r7YCXWrok8Vo7I1FDhlDsI4DKk3ZTklMyaO/1XBbjOwFRe
	vGdlPXpLIb9wvm476Ok63uWNfXnHDO5bj/Wjp1iJFjbtSxvzfQjjyKmqUr7tlD5j5q3L7850wFaQ3
	bbwC/juLCXkpzBx078mSlFeKcFOOU47GV0zL0WTs+EbGMxyCv0ncLkLH1NXLsigYiBMmuVuk09tbu
	hTaRnlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGiV4-00000005wCu-2BYi;
	Mon, 10 Jun 2024 17:08:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGiV1-00000005wC7-0yIc
	for ath11k@lists.infradead.org;
	Mon, 10 Jun 2024 17:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51946CE104C;
	Mon, 10 Jun 2024 17:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F72C2BBFC;
	Mon, 10 Jun 2024 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718039280;
	bh=NpVa99PNMxyd2qle9TyoOVLTKSLJ+nVkeuskWbVwSlA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=V52NgtLyxHzH1un4QwAzSah1lWV5B9pmgy7NkyuOxgQ1o6uOnfbUr/Yv6nRJ19C8L
	 J9+FUU33AKjoLmcjy1gTcpUm3Qu+YtsNcCcXdddP7tjkhaQyPY9A5MMdL67OndN5l1
	 iKApYwe2dIyzELy3zo6TdCf8+buKsObjVwsMe0XvKf5ULDoAEprCfLR8zA4kt6vVks
	 Fd1WoYYBeFkWISbXtUlgfo0WZEIqsjuXUXYCuiiCmGBDGhTWfDJDAT2CQSaahxPSYL
	 JczHrg9KHJSeo+RWhdg0sIB58KloUXHdkS/M5a+FTMdQjRBfhEXztrSXrPZs9XhMrm
	 5L14IDvvriWcw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath11k: fix wrong handling of CCMP256 and GCMP
 ciphers
References: <20240605014826.22498-1-quic_bqiang@quicinc.com>
Date: Mon, 10 Jun 2024 20:07:57 +0300
In-Reply-To: <20240605014826.22498-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Wed, 5 Jun 2024 09:48:26 +0800")
Message-ID: <87zfrsohea.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_100803_655856_4DB75F7D 
X-CRM114-Status: GOOD (  13.63  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> Currently for CCMP256, GCMP128 and GCMP256 ciphers, in ath11k_install_key()
> IEEE80211_KEY_FLAG_GENERATE_IV_MGMT is not set. And in ath11k_mac_mgmt_tx_wmi()
> a length of IEEE80211_CCMP_MIC_LEN is reserved for all ciphers.
>
> This results in unexpected management frame drop in case either of above 3 ciphers
> is used. The reason is, without IEEE80211_KEY_FLAG_GENERATE_IV_MGMT set, mac80211
> will not generate CCMP/GCMP headers in frame for ath11k. Also MIC length reserved
> is wrong. Such frame is dropped later by hardware:
>
> ath11k_pci 0000:5a:00.0: mac tx mgmt frame, buf id 0
> ath11k_pci 0000:5a:00.0: mgmt tx compl ev pdev_id 1, desc_id 0, status 1
>
>>From user point of view, we have observed very low throughput due to this issue:
> action frames are all dropped so ADDBA response from DUT never reaches AP. AP
> can not use aggregation thus throughput is low.
>
> Fix this by setting IEEE80211_KEY_FLAG_GENERATE_IV_MGMT flag and by reserving proper
> MIC length for those ciphers.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Reported-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>
> Tested-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>
> Closes:
> https://lore.kernel.org/all/CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

[...]

> @@ -5927,7 +5929,10 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
>  		     ieee80211_is_deauth(hdr->frame_control) ||
>  		     ieee80211_is_disassoc(hdr->frame_control)) &&
>  		     ieee80211_has_protected(hdr->frame_control)) {
> -			skb_put(skb, IEEE80211_CCMP_MIC_LEN);
> +			WARN_ON(!(skb_cb->flags & ATH11K_SKB_CIPHER_SET));

Using WARN_ON() in the data path is not advisable as it's not rate
limited and quite spammy, in the worst case it can lead to kernel
crashing (I have experienced this even myself). ath11k_warn() is safer
in this regard so I changed it to this:

			if (!(skb_cb->flags & ATH11K_SKB_CIPHER_SET))
				ath11k_warn(ab, "WMI management tx frame without ATH11K_SKB_CIPHER_SET");

Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=aeadb08d7b4acced84a45812f1285c8cd3ed853a

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

