Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2DBC433FE
	for <ath11k@archiver.kernel.org>; Thu, 16 Dec 2021 23:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz4Y/oXEmxvnLu3KgW0vkKT2p/8uGu+rinNB5PdUPO8=; b=IzvNtVRu6a+0NWrozNhCDGwuUn
	hQA6dFpkLji2II7djQuITk1lmyEMp8BlarobcgjIoYKY1P13VqftOBi2v92RTRfpieM1SpCx9YSj+
	4iLUQ55HQNNSAZHAw+Suw8DXYGX6WTsHZrQlhD0hqrFkQMOv33KudP4bmsb3JlUCMhC3rrM16LKh/
	75PyCqoJUmSccLON1KU8GC+5OeaxYnElml3+gL8CAiT8pB3fh8SoFaTmMXt45Rt9HJ8AXx/cF10EA
	dnrv8v+rU9rHmHGcBZVd6PknwAzsck02FljNSoo5hv9RRRDkjH1ELbfTWTbPJ9vg7FylKw/DheMRO
	NU8v15EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my0F8-007woj-7G; Thu, 16 Dec 2021 23:32:58 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my0Ej-007wb3-NX
 for ath11k@lists.infradead.org; Thu, 16 Dec 2021 23:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639697553; x=1671233553;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bjRRxBxha9SwOOPiJuFETqlh1ZPrUZruhgo0QK5bG5U=;
 b=p8B87SijmAaOGh94c9i7F4GhB8X2hK5Pk++owFmeOhAHxfii+5K4CYK2
 mJdS8E4X1PPPtqt/xLV9QYg8oOG8H7TxCWuZC4DDBBTGSn07g74Azez8U
 0iazXr++9pQJtV5UsJVQKHTcnt+z9tNPcocbK/c3rQT+b92zMFyy456H/ s=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Dec 2021 15:32:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:32:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 16 Dec 2021 15:32:32 -0800
Received: from [10.110.45.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 16 Dec
 2021 15:32:31 -0800
Message-ID: <34610fb9-d9ec-0cb8-f58f-fe82fe96002c@quicinc.com>
Date: Thu, 16 Dec 2021 15:32:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH v2] ath11k: add signal report to mac80211 for QCA6390 and
 WCN6855
Content-Language: en-US
To: <ath11k@lists.infradead.org>
References: <20211216070535.31732-1-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20211216070535.31732-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_153233_858713_9A089220 
X-CRM114-Status: GOOD (  24.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 12/15/2021 11:05 PM, Wen Gong wrote:
> IEEE80211_HW_USES_RSS is set in ath11k, then the device uses RSS and
> thus requires parallel RX which implies using per-CPU station statistics
> in sta_get_last_rx_stats() of mac80211. Currently signal is only set in
> ath11k_mgmt_rx_event(), and not set for RX data packet, then it show
> signal as 0 for iw command easily.
> 
> Change to get signal from firmware and report to mac80211.
> 
> For QCA6390 and WCN6855, the rssi value is already in dbm unit, so
> don't need to convert it again.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
> v2:
>      1. rebased to ath.git ath-202112141538
>      2. change commit log
> depends on patch "[v6] ath11k: report rssi of each chain to mac80211 for QCA6390/WCN6855"
> https://patchwork.kernel.org/project/linux-wireless/patch/20211215090944.19729-1-quic_wgong@quicinc.com/
> 
>   drivers/net/wireless/ath/ath11k/core.h |  1 +
>   drivers/net/wireless/ath/ath11k/mac.c  | 22 ++++++++++--
>   drivers/net/wireless/ath/ath11k/wmi.c  | 49 +++++++++++++++++++++-----
>   3 files changed, 61 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 170fc8e66c90..aa6d51d17e31 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -385,6 +385,7 @@ struct ath11k_sta {
>   	u64 rx_duration;
>   	u64 tx_duration;
>   	u8 rssi_comb;
> +	s8 rssi_beacon;
>   	s8 chain_signal[IEEE80211_MAX_CHAINS];
>   	struct ath11k_htt_tx_stats *tx_stats;
>   	struct ath11k_rx_peer_stats *rx_stats;
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index ef4859a5887b..f135a3dd2f4e 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -7811,6 +7811,9 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   {
>   	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
>   	struct ath11k *ar = arsta->arvif->ar;
> +	s8 signal;
> +	bool db2dbm = test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
> +			       ar->ab->wmi_ab.svc_map);
>   
>   	sinfo->rx_duration = arsta->rx_duration;
>   	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_DURATION);
> @@ -7843,9 +7846,22 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   		ath11k_mac_put_chain_rssi(sinfo, arsta, "fw stats", true);
>   	}
>   
> -	/* TODO: Use real NF instead of default one. */
> -	sinfo->signal = arsta->rssi_comb + ATH11K_DEFAULT_NOISE_FLOOR;
> -	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
> +	signal = arsta->rssi_comb;
> +	if (!signal &&
> +	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
> +	    ar->ab->hw_params.supports_rssi_stats &&
> +	    !(ath11k_debugfs_get_fw_stats(ar, ar->pdev->pdev_id, 0,
> +					WMI_REQUEST_VDEV_STAT)))

what happens when CONFIG_ATH11K_DEBUGFS is not enabled?
should the logic to get the stats be decoupled from DebugFS support?


> +		signal = arsta->rssi_beacon;
> +
> +	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
> +		   "mac sta statistics db2dbm %u rssi comb %d rssi beacon %d\n",
> +		   db2dbm, arsta->rssi_comb, arsta->rssi_beacon);
> +
> +	if (signal) {
> +		sinfo->signal = db2dbm ? signal : signal + ATH11K_DEFAULT_NOISE_FLOOR;
> +		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
> +	}
>   }
>   
>   static const struct ieee80211_ops ath11k_ops = {
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index b7bdc37f24fd..6d92bb9483be 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -5639,7 +5639,11 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
>   {
>   	struct ath11k_fw_stats *stats = parse->stats;
>   	const struct wmi_stats_event *ev = parse->ev;
> -	int i;
> +	struct ath11k *ar;
> +	struct ath11k_vif *arvif;
> +	struct ieee80211_sta *sta;
> +	struct ath11k_sta *arsta;
> +	int i, ret = 0;
>   	const void *data = ptr;
>   
>   	if (!ev) {
> @@ -5649,13 +5653,19 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
>   
>   	stats->stats_id = 0;
>   
> +	rcu_read_lock();
> +
> +	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
> +
>   	for (i = 0; i < ev->num_pdev_stats; i++) {
>   		const struct wmi_pdev_stats *src;
>   		struct ath11k_fw_stats_pdev *dst;
>   
>   		src = data;
> -		if (len < sizeof(*src))
> -			return -EPROTO;
> +		if (len < sizeof(*src)) {
> +			ret = -EPROTO;
> +			goto exit;
> +		}
>   
>   		stats->stats_id = WMI_REQUEST_PDEV_STAT;
>   
> @@ -5677,11 +5687,30 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
>   		struct ath11k_fw_stats_vdev *dst;
>   
>   		src = data;
> -		if (len < sizeof(*src))
> -			return -EPROTO;
> +		if (len < sizeof(*src)) {
> +			ret = -EPROTO;
> +			goto exit;
> +		}
>   
>   		stats->stats_id = WMI_REQUEST_VDEV_STAT;
>   
> +		arvif = ath11k_mac_get_arvif(ar, src->vdev_id);
> +		if (arvif) {
> +			sta = ieee80211_find_sta_by_ifaddr(ar->hw,
> +							   arvif->bssid,
> +							   NULL);
> +			if (sta) {
> +				arsta = (struct ath11k_sta *)sta->drv_priv;
> +				arsta->rssi_beacon = src->beacon_snr;
> +				ath11k_dbg(ab, ATH11K_DBG_WMI,
> +					   "wmi stats vdev id %d snr %d\n",
> +					   src->vdev_id, src->beacon_snr);
> +			} else {
> +				ath11k_warn(ab, "not found station for bssid %pM\n",
> +					    arvif->bssid);
> +			}
> +		}
> +
>   		data += sizeof(*src);
>   		len -= sizeof(*src);
>   
> @@ -5698,8 +5727,10 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
>   		struct ath11k_fw_stats_bcn *dst;
>   
>   		src = data;
> -		if (len < sizeof(*src))
> -			return -EPROTO;
> +		if (len < sizeof(*src)) {
> +			ret = -EPROTO;
> +			goto exit;
> +		}
>   
>   		stats->stats_id = WMI_REQUEST_BCN_STAT;
>   
> @@ -5714,7 +5745,9 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
>   		list_add_tail(&dst->list, &stats->bcn);
>   	}
>   
> -	return 0;
> +exit:
> +	rcu_read_unlock();
> +	return ret;
>   }
>   
>   static int ath11k_wmi_tlv_fw_stats_parse(struct ath11k_base *ab,
> 
> base-commit: f21e9b6adc354bfa274d4510df602f081a08194e
> prerequisite-patch-id: ea323ac33f40186a1950044c1997e9c4509c5725
> 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
