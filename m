Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C46C433F5
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 10:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJB9o81Whsh2a00VmSA7FQGA7FL/id0E9DUXO8RpwYY=; b=s34OUQZb2ka7G0
	mCBs39Q0UA8+y23h8LbbFxOLPqc4p6Z3UWNynuAkeFuZyvtSHKFFNO5uJXncNdsB3SsA+n1JNGz8R
	v9SRDMCJ2UdXgGPO1JjxPOasDkt0SC+5m7Hsx4j5tdDjk+Rp/+jE15wIEtmXqPeWT80iq7HdWKadu
	nlh0rJXz2DrZY/TwB2PEQWtBs0KlQLA7FUwKtEmT+xNyMW4V0YWuuN3lb/VBLh4nxywIfnxeor2Ew
	VqFlYQ3D2ZXqPtBSzKBRqeQPpZlDqNaxqZF+Au/DhogNhzr1VPrmGAnw7Rxpgt8RWuWVdiPo7EppL
	g0S/nTGjN4fLH7CQ5L4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmYn4-00FHGE-65; Thu, 05 May 2022 10:32:58 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmYn1-00FHDN-1y
 for ath11k@lists.infradead.org; Thu, 05 May 2022 10:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651746774; x=1683282774;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AXkNIxUHdobK3HxEvZLobEfFAf4ivft2cnbtIyahqgM=;
 b=C4z2pH5U7tjP7wUZnzsmfjDsH0n3BWzi0WT8EMi61FTwJY0bRUR64ng8
 HwfrUIAc0vsY4o7WHUtoXBn1mYg5OgGqXWDUcN4rEe7p4qf22/XMo1Vbn
 9Ad5KdHxVbp5SK6MZrHIYJ4FM+/D500Efzcg4ar3ykTLQQ70xlZCXi8u7 Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 May 2022 03:32:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 03:32:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 5 May 2022 03:32:51 -0700
Received: from [10.253.37.208] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 5 May 2022
 03:32:50 -0700
Message-ID: <30bdad0a-4cbf-b800-5451-99bdda144555@quicinc.com>
Date: Thu, 5 May 2022 18:32:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [bug report] ath11k: report rssi of each chain to mac80211 for
 QCA6390/WCN6855
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: <ath11k@lists.infradead.org>
References: <YnOmHi3JhnFUc3YQ@kili>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <YnOmHi3JhnFUc3YQ@kili>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_033255_154254_14ADF756 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 5/5/2022 6:25 PM, Dan Carpenter wrote:
> Hello Wen Gong,
>
> The patch b488c766442f: "ath11k: report rssi of each chain to
> mac80211 for QCA6390/WCN6855" from Dec 17, 2021, leads to the
> following Smatch static checker warning:
>
> 	drivers/net/wireless/ath/ath11k/wmi.c:5800 ath11k_wmi_tlv_rssi_chain_parse()
> 	warn: missing error code here? 'ieee80211_find_sta_by_ifaddr()' failed. 'ret' = '0'

yes, it should return 0.

please see this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath11k?id=7330e1ec9748948177830c6e1a13379835d577f9

ath11k: fix warning of not found station for bssid in message

> drivers/net/wireless/ath/ath11k/wmi.c
>      5755 static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
>      5756                                            u16 tag, u16 len,
>      5757                                            const void *ptr, void *data)
>      5758 {
>      5759         struct wmi_tlv_fw_stats_parse *parse = data;
>      5760         const struct wmi_stats_event *ev = parse->ev;
>      5761         struct ath11k_fw_stats *stats = parse->stats;
>      5762         struct ath11k *ar;
>      5763         struct ath11k_vif *arvif;
>      5764         struct ieee80211_sta *sta;
>      5765         struct ath11k_sta *arsta;
>      5766         const struct wmi_rssi_stats *stats_rssi = (const struct wmi_rssi_stats *)ptr;
>      5767         int j, ret = 0;
>      5768
>      5769         if (tag != WMI_TAG_RSSI_STATS)
>      5770                 return -EPROTO;
>      5771
>      5772         rcu_read_lock();
>      5773
>      5774         ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
>      5775         stats->stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
>      5776
>      5777         ath11k_dbg(ab, ATH11K_DBG_WMI,
>      5778                    "wmi stats vdev id %d mac %pM\n",
>      5779                    stats_rssi->vdev_id, stats_rssi->peer_macaddr.addr);
>      5780
>      5781         arvif = ath11k_mac_get_arvif(ar, stats_rssi->vdev_id);
>      5782         if (!arvif) {
>      5783                 ath11k_warn(ab, "not found vif for vdev id %d\n",
>      5784                             stats_rssi->vdev_id);
>      5785                 ret = -EPROTO;
>      5786                 goto exit;
>      5787         }
>      5788
>      5789         ath11k_dbg(ab, ATH11K_DBG_WMI,
>      5790                    "wmi stats bssid %pM vif %pK\n",
>      5791                    arvif->bssid, arvif->vif);
>      5792
>      5793         sta = ieee80211_find_sta_by_ifaddr(ar->hw,
>      5794                                            arvif->bssid,
>      5795                                            NULL);
>      5796         if (!sta) {
>      5797                 ath11k_dbg(ab, ATH11K_DBG_WMI,
>      5798                            "not found station of bssid %pM for rssi chain\n",
>      5799                            arvif->bssid);
> --> 5800                 goto exit;
>
> Should this return an error code or zero?  It's hard for me to tell.
> If returning a zero is correct then doing the "ret = 0;" assignment
> within 4 (or 5?) lines of the "goto exit;" will silence the warning.
>
>      5801         }
>      5802
>      5803         arsta = (struct ath11k_sta *)sta->drv_priv;
>      5804
>      5805         BUILD_BUG_ON(ARRAY_SIZE(arsta->chain_signal) >
>      5806                      ARRAY_SIZE(stats_rssi->rssi_avg_beacon));
>      5807
>      5808         for (j = 0; j < ARRAY_SIZE(arsta->chain_signal); j++) {
>      5809                 arsta->chain_signal[j] = stats_rssi->rssi_avg_beacon[j];
>      5810                 ath11k_dbg(ab, ATH11K_DBG_WMI,
>      5811                            "wmi stats beacon rssi[%d] %d data rssi[%d] %d\n",
>      5812                            j,
>      5813                            stats_rssi->rssi_avg_beacon[j],
>      5814                            j,
>      5815                            stats_rssi->rssi_avg_data[j]);
>      5816         }
>      5817
>      5818 exit:
>      5819         rcu_read_unlock();
>      5820         return ret;
>      5821 }
>
> regards,
> dan carpenter

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
