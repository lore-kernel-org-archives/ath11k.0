Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC2CC87FD1
	for <ath11k@archiver.kernel.org>; Tue,  5 Aug 2025 09:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8HRWiJq7Dzndb32tJ9cvojlFgcARb3t7Z9ZkNMvhLE=; b=DApAyI2iALguSrr9cZzoBf4awn
	ai7c5Ey5NiR0MCGVwqt8Xo35johyEc4eR1R7wWJ4bYYiiBirKfqWsun6iqozmrjHCs9dfVHQGsGdJ
	/2eTYFh7gNgcRiKSgeKFHi9zq8DaEv092pa3cwJzZlP3nM30LDrd4QJZywxW+lc0mZPQYJ6hf2wOL
	Y4ziD8+o7T1i8+8lMednX4FcM/qeV6/9lZJVsQQIzLupikuY07bLQwem0iL/5CkqqkUQZSNq7I9Wg
	Ngb0Ge60G8eHbqPXHBgss0UsUbXw2pU7cwFSXkNxGJt2kRHZ47h2KHJDX6enL6FzXhFMSTW6MpW7h
	d4neE78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujE5m-0000000CO3Q-25ce;
	Tue, 05 Aug 2025 09:36:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDvM-0000000CLY9-1myE
	for ath11k@lists.infradead.org;
	Tue, 05 Aug 2025 09:25:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5756EIiY031483
	for <ath11k@lists.infradead.org>; Tue, 5 Aug 2025 09:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X8HRWiJq7Dzndb32tJ9cvojlFgcARb3t7Z9ZkNMvhLE=; b=nUTibEQI7wmLsjVP
	73Z2AE671283cqdDLc+lSkbRIHHMD0w+L3FDzUU678T+ZedrJYVbbLTuuHQzYMKe
	3FlvwEwJWSezC8K5diHsWgdHEYmgr9+wDCWaxNUfTCu7ORKdzipkjGjYfb3alEkW
	s5BLzfkZxiUrgi2OYToUgAdQLOUMKUIuZw3k03Nm9F4kushl15hbLpv1bfqnNeeq
	r2PycLawj4hBMdwI1LTz30x3rhSP8BYVyNSy8VxPl1AcRTXT3HlyYRqjuf24buqT
	3VrIfB/5Jf2902gChHgRgKkAg/cNupYk09ImattHx2TMLWHGPkM2AUsus+lo5lAx
	Zeja3A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek7xts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 05 Aug 2025 09:25:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5759PYkh025567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 5 Aug 2025 09:25:34 GMT
Received: from [10.151.41.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 5 Aug
 2025 02:25:32 -0700
Message-ID: <efa2eb35-0058-4337-99c5-bd4489248360@quicinc.com>
Date: Tue, 5 Aug 2025 14:55:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath11k: fix group data packet drops
 during rekey
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        <ath11k@lists.infradead.org>
References: <20250804075344.3494691-1-rameshkumar.sundaram@oss.qualcomm.com>
 <aa09b524-a167-4d4d-8770-c3be019b13a1@oss.qualcomm.com>
Content-Language: en-US
From: Raja Mani <quic_rmani@quicinc.com>
In-Reply-To: <aa09b524-a167-4d4d-8770-c3be019b13a1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=6891ce0f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MSRH7pJRmv7Hdqy5xHcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA2NiBTYWx0ZWRfXxpFbSip3c3OU
 F/JeSDIOg/HdqAffI3xVaIdIrrWw338/NCuHQROot1ZJx5LnXKPFipn0PVHu1w3GERgEaqiboe6
 ycHFdGS6H9+RJa0ijd0lc34Xm7ekvHRHLyOHlkEpaR8v71O/D8/NuOW0KUH8KUTUCbA7vtx7c9M
 jz9JPjiIQV6Arl8G7s262UiWhjp6JNtMQCTuM3axQwv7UglilabxvlEoG7VTQi1gK7WjHUDFJce
 Bo8VPLNlhc1VwNpsMqnBvCg3znG43vsk4UJppQ4RoDWL0+kWhY6fosuxuOXxehltz1FSJbYvHXy
 lDB9wGoGDL8e1F9ojuOS0xLXznuKw53H6gP44FhnlMrI+tLgqDtWFlIn6BW3kPgRTZW9mj5CfPc
 kC4XGHa8IdH57lvvMq2FbCRv4TWL4WwRKYxN05JD1/xUwhkZ885epD6hamnfl+Oje2AW5I/I
X-Proofpoint-ORIG-GUID: rwi7z3I0-0s5Wpx3FQbOb4nYEKfqgQ3V
X-Proofpoint-GUID: rwi7z3I0-0s5Wpx3FQbOb4nYEKfqgQ3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_022536_500071_17CDBF55 
X-CRM114-Status: GOOD (  47.30  )
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


> During GTK rekey, mac80211 issues a clear key (if the old key exists)
> followed by an install key operation in the same context. This causes
> ath11k to send two WMI commands in quick succession: one to clear the
> old key and another to install the new key in the same slot.
> 
> Under certain conditions—especially under high load or time sensitive
> scenarios, firmware may process these commands asynchronously in a way
> that firmware assumes the key is cleared whereas hardware has a valid key.

IIUC, The firmware cleared the old key in the hardware but it missed
to install new key in the problematic condition.

The rest LGTM.

> This inconsistency between hardware and firmware leads to group addressed
> packet drops. Only setting the same key again can restore a valid key in
> firmware and allow packets to be transmitted.
> 
> This issue remained latent because the host's clear key commands were
> not effective in firmware until commit 436a4e886598 ("ath11k: clear the
> keys properly via DISABLE_KEY"). That commit enabled the host to
> explicitly clear group keys, which inadvertently exposed the race.
> 
> To mitigate this, restrict group key clearing across all modes (AP, STA,
> MESH). During rekey, the new key can simply be set on top of the previous
> one, avoiding the need for a clear followed by a set.
> 
> However, in AP mode specifically, permit group key clearing when no
> stations are associated. This exception supports transitions from secure
> modes (e.g., WPA2/WPA3) to open mode, during which all associated peers
> are removed and the group key is cleared as part of the transition.
> 
> Add a per-BSS station counter to track the presence of stations during
> set key operations. Also add a reset_group_keys flag to track the key
> re-installation state and avoid repeated installation of the same key
> when the number of connected stations transitions to non-zero within a
> rekey period.
> 
> Additionally, for AP and Mesh modes, when the first station associates,
> reinstall the same group key that was last set. This ensures that the
> firmware recovers from any race that may have occurred during a previous
> key clear when no stations were associated.
> 
> This change ensures that key clearing is permitted only when no clients
> are connected, avoiding packet loss while enabling dynamic security mode
> transitions.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125- 
> QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Reported-by: Steffen Moser <lists@steffen-moser.de>
> Closes: https://lore.kernel.org/linux-wireless/c6366409-9928-4dd7-bf7b- 
> ba7fcf20eabf@steffen-moser.de
> Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> ---
> v3:
>    - Allowed clear key strictly only for AP mode
>    - Rephrased the commit text and comment in ath11k_mac_op_set_key()
>      to explain that the race occures rarely under heavy load and
>      discrepancy of states between firmware and hardware
>    - Added newline (\n) at the end of warn log in ath11k_set_group_keys()
>    - Made addr varaible as const * in ath11k_set_group_keys()
> v2:
>    - Followed r-xmas style
>    - Removed vdev_type check before calling ath11k_set_group_keys()
>    - Removed lockdep assert in ath11k_set_group_keys()
>    - Removed flags variable and passed WMI_KEY_GROUP in 
> ath11k_set_group_keys()
>    - Changed the if condition to have positive cases in 
> ath11k_mac_op_set_key()
>    - Added code comments in ath11k_mac_op_set_key() to explain how clear 
> key and
>      set key are issue back to back by mac80211 and added high level 
> information
>      about the firmware race.
>    - Added comments in ath11k_mac_op_set_key() and 
> ath11k_mac_station_add() to
>      explain why a reinstall of same key is needed.
> ---
>   drivers/net/wireless/ath/ath11k/core.h |   2 +
>   drivers/net/wireless/ath/ath11k/mac.c  | 111 +++++++++++++++++++++++--
>   2 files changed, 104 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/ 
> wireless/ath/ath11k/core.h
> index 220d69a7a429..e8780b05ce11 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -411,6 +411,8 @@ struct ath11k_vif {
>       bool do_not_send_tmpl;
>       struct ath11k_arp_ns_offload arp_ns_offload;
>       struct ath11k_rekey_data rekey_data;
> +    u32 num_stations;
> +    bool reinstall_group_keys;
>        struct ath11k_reg_tpc_power_info reg_tpc_info;
>   diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/ 
> wireless/ath/ath11k/mac.c
> index 1fadf5faafb8..106e2530b64e 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -4317,6 +4317,40 @@ static int ath11k_clear_peer_keys(struct 
> ath11k_vif *arvif,
>       return first_errno;
>   }
>   +static int ath11k_set_group_keys(struct ath11k_vif *arvif)
> +{
> +    struct ath11k *ar = arvif->ar;
> +    struct ath11k_base *ab = ar->ab;
> +    const u8 *addr = arvif->bssid;
> +    int i, ret, first_errno = 0;
> +    struct ath11k_peer *peer;
> +
> +    spin_lock_bh(&ab->base_lock);
> +    peer = ath11k_peer_find(ab, arvif->vdev_id, addr);
> +    spin_unlock_bh(&ab->base_lock);
> +
> +    if (!peer)
> +        return -ENOENT;
> +
> +    for (i = 0; i < ARRAY_SIZE(peer->keys); i++) {
> +        struct ieee80211_key_conf *key = peer->keys[i];
> +
> +        if (!key || (key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
> +            continue;
> +
> +        ret = ath11k_install_key(arvif, key, SET_KEY, addr,
> +                     WMI_KEY_GROUP);
> +        if (ret < 0 && first_errno == 0)
> +            first_errno = ret;
> +
> +        if (ret < 0)
> +            ath11k_warn(ab, "failed to set group key of idx %d for vdev 
> %d: %d\n",
> +                    i, arvif->vdev_id, ret);
> +    }
> +
> +    return first_errno;
> +}
> +
>   static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum 
> set_key_cmd cmd,
>                    struct ieee80211_vif *vif, struct ieee80211_sta *sta,
>                    struct ieee80211_key_conf *key)
> @@ -4326,6 +4360,7 @@ static int ath11k_mac_op_set_key(struct 
> ieee80211_hw *hw, enum set_key_cmd cmd,
>       struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
>       struct ath11k_peer *peer;
>       struct ath11k_sta *arsta;
> +    bool is_ap_with_no_sta;
>       const u8 *peer_addr;
>       int ret = 0;
>       u32 flags = 0;
> @@ -4386,16 +4421,57 @@ static int ath11k_mac_op_set_key(struct 
> ieee80211_hw *hw, enum set_key_cmd cmd,
>       else
>           flags |= WMI_KEY_GROUP;
>   -    ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
> -    if (ret) {
> -        ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
> -        goto exit;
> -    }
> +    ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
> +           "%s for peer %pM on vdev %d flags 0x%X, type = %d, num_sta 
> %d\n",
> +           cmd == SET_KEY ? "SET_KEY" : "DEL_KEY", peer_addr, arvif- 
>  >vdev_id,
> +           flags, arvif->vdev_type, arvif->num_stations);
> +
> +    /* Allow group key clearing only in AP mode when no stations are
> +     * associated. There is a known race condition in firmware where
> +     * group addressed packets may be dropped if the key is cleared
> +     * and immediately set again during rekey.
> +     *
> +     * During GTK rekey, mac80211 issues a clear key (if the old key
> +     * exists) followed by an install key operation for same key
> +     * index. This causes ath11k to send two WMI commands in quick
> +     * succession: one to clear the old key and another to install the
> +     * new key in the same slot.
> +     *
> +     * Under certain conditions—especially under high load or time
> +     * sensitive scenarios, firmware may process these commands
> +     * asynchronously in a way that firmware assumes the key is
> +     * cleared whereas hardware has a valid key. This inconsistency
> +     * between hardware and firmware leads to group addressed packet
> +     * drops after rekey.
> +     * Only setting the same key again can restore a valid key in
> +     * firmware and allow packets to be transmitted.
> +     *
> +     * There is a use case where an AP can transition from Secure mode
> +     * to open mode without a vdev restart by just deleting all
> +     * associated peers and clearing key, Hence allow clear key for
> +     * that case alone. Mark arvif->reinstall_group_keys in such cases
> +     * and reinstall the same key when the first peer is added,
> +     * allowing firmware to recover from the race if it had occurred.
> +     */
>   -    ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, 
> key);
> -    if (ret) {
> -        ath11k_warn(ab, "failed to offload PN replay detection %d\n", 
> ret);
> -        goto exit;
> +    is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
> +                 !arvif->num_stations);
> +    if ((flags & WMI_KEY_PAIRWISE) || cmd == SET_KEY || 
> is_ap_with_no_sta) {
> +        ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
> +        if (ret) {
> +            ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
> +            goto exit;
> +        }
> +
> +        ret = ath11k_dp_peer_rx_pn_replay_config(arvif, peer_addr, cmd, 
> key);
> +        if (ret) {
> +            ath11k_warn(ab, "failed to offload PN replay detection %d\n",
> +                    ret);
> +            goto exit;
> +        }
> +
> +        if ((flags & WMI_KEY_GROUP) && cmd == SET_KEY && 
> is_ap_with_no_sta)
> +            arvif->reinstall_group_keys = true;
>       }
>        spin_lock_bh(&ab->base_lock);
> @@ -4994,6 +5070,7 @@ static int ath11k_mac_inc_num_stations(struct 
> ath11k_vif *arvif,
>           return -ENOBUFS;
>        ar->num_stations++;
> +    arvif->num_stations++;
>        return 0;
>   }
> @@ -5009,6 +5086,7 @@ static void ath11k_mac_dec_num_stations(struct 
> ath11k_vif *arvif,
>           return;
>        ar->num_stations--;
> +    arvif->num_stations--;
>   }
>    static u32 ath11k_mac_ieee80211_sta_bw_to_wmi(struct ath11k *ar,
> @@ -9540,6 +9618,21 @@ static int ath11k_mac_station_add(struct ath11k *ar,
>           goto exit;
>       }
>   +    /* Driver allows the DEL KEY followed by SET KEY sequence for
> +     * group keys for only when there is no clients associated, if at
> +     * all firmware has entered the race during that window,
> +     * reinstalling the same key when the first sta connects will allow
> +     * firmware to recover from the race.
> +     */
> +    if (arvif->num_stations == 1 && arvif->reinstall_group_keys) {
> +        ath11k_dbg(ab, ATH11K_DBG_MAC, "set group keys on 1st station 
> add for vdev %d\n",
> +               arvif->vdev_id);
> +        ret = ath11k_set_group_keys(arvif);
> +        if (ret)
> +            goto dec_num_station;
> +        arvif->reinstall_group_keys = false;
> +    }
> +
>       arsta->rx_stats = kzalloc(sizeof(*arsta->rx_stats), GFP_KERNEL);
>       if (!arsta->rx_stats) {
>           ret = -ENOMEM;
> 
> base-commit: 4cedae6335644a5858e1bc2c367aedc10482b654


