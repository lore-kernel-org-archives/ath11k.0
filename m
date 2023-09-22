Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDADCD4F3F
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8np3Z7WJNcf9ufZuBoXC04Hw+D8jerSFGSM5kHb8P88=; b=FDMsqi7oXFEvCz
	Kp6Y2tRyh3UdZex6KqOBr6sSZwHBxXARO5LlQhOY4GcrlyvTJwL6tNAF1JyP58ZAzLjIPPKxS91yq
	W3YNkfbHdUQYBppVhTdclPzee9EwMwL4KeuBUW56eluCKPli3qf1QkVpzqkbx0tkdR6fyC79y7B0W
	OaHmBJ0WRI2Mnn/wrajnz1yvK97wUiATZOOhBBHMw866TtjrZ2J4GySjwYmVjEgQuk+IWvUg546ea
	PkDkbkLBmuxWBogw69dq/eOS50b9QMb1GjCuoEAyBg0o4dbmn+R0QQmo+y08hohrrH0YeZ/zWqIc+
	k/8f9sL1lw7OpZRY7EOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcOm-008Z6C-0j;
	Fri, 22 Sep 2023 09:24:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcOj-008Z5U-2K
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 09:24:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M90PQO010273;
	Fri, 22 Sep 2023 09:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/eKwPIz2gXZ4b63PmpgUAmyLWGcBGO8dMc3g3NXXtXc=;
 b=n+87IQ23QN7boezVPSvHEvhv2CF9u6Ots9gGqWGwlleLVoEhqkJIEHYA+JOfDmGSc+dl
 gPorWOlFwB9zj01OlM/9kwMzw75GlQM6ctflL9Mixsw+ZUNC1qXBK7inEBy1Db3U3WKp
 0Q7heRt4041WhdurqOif1tI9iUgbTEQ1hZxUdlJzIf6X33TdyIgqYV7tLL1L1n7yWKzx
 QG1dPBG/iDdiiHAaDLrKzH5yf8/Yr1AVDQ6SE/mOk1OpSXp15/AH+o9NOLBinhfUl20H
 Ao558J70f4499I6+JCmjuH6oWL7FatyrpE4wHskRzDOnFsQt4WOXzc9mDkmAff6W6Acf eQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u6rse3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:24:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38M9OPMM012809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:24:25 GMT
Received: from [10.216.13.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 02:24:22 -0700
Message-ID: <eb08e0f2-c932-4d79-b2ee-813c2999d1a5@quicinc.com>
Date: Fri, 22 Sep 2023 14:54:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] wifi: ath11k: send TPC power to firmware for 6
 GHz station
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-14-quic_wgong@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20230920082349.29111-14-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JguvL1PUYhKVDAg9hTNwREq6eKpVXBEj
X-Proofpoint-ORIG-GUID: JguvL1PUYhKVDAg9hTNwREq6eKpVXBEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309220077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_022429_877281_5422977A 
X-CRM114-Status: GOOD (  23.35  )
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

On 9/20/23 13:53, Wen Gong wrote:
> When station is connected to a 6 GHz AP, it has 2 way to configure
> the power limit to firmware. The first way is to send 2 wmi command
> WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
> firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
> firmware which include more parameters for power control.
> 
> The first way is disabled in previous patch
> "ath11k: discard BSS_CHANGED_TXPOWER when EXT_TPC_REG_SUPPORT for 6 GHz".
> 
> Prepare the parameter for wmi command WMI_VDEV_SET_TPC_POWER_CMDID and
> send the firmware after vdev start response success from firmware, it
> is for the second way of power control.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index a8ae281d2635..f8b907a758b1 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -7296,6 +7296,12 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
>   		return ret;
>   	}
>   
> +	if (ath11k_mac_supports_station_tpc(ar, arvif, chandef)) {
> +		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, &arvif->chanctx);
So we are passing local copy of channel context stored in 
arvif->chanctx. Do we need to update it when channel changes?

I see that during assignment time, we are copying/updating it and 
accordingly the command will be sent to firmware, but what about when 
STA moves channel? arvif->chanctx should be updated and tpc command 
should be sent again in that case?

> +		ath11k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
> +						   &arvif->reg_tpc_info);
> +	}
> +
>   	if (!restart)
>   		ar->num_started_vdevs++;
>   
> @@ -8108,7 +8114,7 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
>   		if (power_type == IEEE80211_REG_UNSET_AP)
>   			power_type = IEEE80211_REG_LPI_AP;
>   		ath11k_reg_handle_chan_list(ab, reg_info, power_type);
> -
> +		arvif->chanctx = *ctx;
>   		ath11k_mac_parse_tx_pwr_env(ar, vif, ctx);
>   	}
>   

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
