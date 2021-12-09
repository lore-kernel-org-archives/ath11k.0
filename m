Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0941BC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4stHyLTJjJo27SP1FsdenrzFUrnm4HDGu18MNnqKs3c=; b=b/hi6l/kbohywp
	qPSQm4i0STXmqwlZR2gGHz8sRLXwBBy4QPTYFNVjM7i5Ra4SzrkMxxJvwyHao1NYp1lA3/8Nvnhj7
	8AQkqfZ2PZaM3Ts0yCQ09i2cP1HnLnbeSBlV30Bes+04Js64nJOJ4gRlxjn0c4l101DZlL/7gE1bo
	0s/gv39Qm2F3z1yM/3dc+70Am9R39qP8RS6XEZm+fw6x80gf3bW6ZTpFVYd26fjtHzQI7syUpLLKJ
	e8TUqD3rYxv/HsjBuv4sKH7DY1tTM0//sifczrwd5mwSZ3EEEqHFj8+qzMqafoD6GkFP/eUvqux19
	3O5uXrG10PKSYaQtvKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvELF-00FCQH-3J; Thu, 09 Dec 2021 07:59:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvELC-00FCPO-6k
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 07:59:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF879B8235E;
 Thu,  9 Dec 2021 07:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9670FC004DD;
 Thu,  9 Dec 2021 07:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639036783;
 bh=WoVjR0nqruLg03DuWhldQrEKuCL7rIAtNryVwyrBO0o=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=ryz6krmdj+ukdYATa90s8QvYciG7Vffj9Gc2yOehBgxg6D1SQ0vVJtIJPnsrCuyXd
 eXZ9jhiIpdJ5YtpKFfoK0xV4hFsSnZOG8LQXZ0fptHcUn7ufs6rI5ty0TdzmsqijDS
 hSWYAwjiybKsIX68iZt/ITd7I7PMJXQ5VDg++jPW73u9C7PA5zQclvdXkuGFgwGR8b
 vXxnaI9QiOPmB49az1Rj9sdiM5EL7o+I6G4a+pqTCGeVPGYiLOhYdhC1LPHmate64n
 LkdEpyPEjMMP6xV4iHT0w/zjIp+dSRy6cH+N4ntvXRKUVUqV+x0RQlc4PVPUvSGH4B
 panvsj76fMXfQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for
 WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211129101309.2931-1-quic_wgong@quicinc.com>
References: <20211129101309.2931-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163903678099.20904.5958994960625549105.kvalo@kernel.org>
Date: Thu,  9 Dec 2021 07:59:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_235946_423753_E56FF11E 
X-CRM114-Status: GOOD (  11.11  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Currently mac80211 will send 3 scan request for each scan of WCN6855,
> they are 2.4 GHz/5 GHz/6 GHz band scan. Firmware of WCN6855 will
> cache the RNR IE(Reduced Neighbor Report element) which exist in the
> beacon of 2.4 GHz/5 GHz of the AP which is co-located with 6 GHz,
> and then use the cache to scan in 6 GHz band scan if the 6 GHz scan
> is in the same scan with the 2.4 GHz/5 GHz band, this will helpful to
> search more AP of 6 GHz. Also it will decrease the time cost of scan
> because firmware will use dual-band scan for the 2.4 GHz/5 GHz, it
> means the 2.4 GHz and 5 GHz scans are doing simultaneously.
> 
> Set the flag IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for WCN6855 since
> it supports 2.4 GHz/5 GHz/6 GHz and it is single pdev which means
> all the 2.4 GHz/5 GHz/6 GHz exist in the same wiphy/ieee80211_hw.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Tested-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9f6da09a5f6a ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211129101309.2931-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
