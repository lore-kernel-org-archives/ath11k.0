Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D3FC38145
	for <ath11k@archiver.kernel.org>; Thu,  8 Sep 2022 15:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1TFEAsG2oPDa+WPSEmlhXtCzmc/ukDKkyHXrpcHjtc=; b=VvtBHPV7Q/pjAU
	Ej/FJognY7lgJRKNXEWWEgipDzVtMkSuxJ3iXeWrfp7PCVUQwVZJF6gLXBWuaMVwyo+zT1ofylylm
	gA1LKXuRmy8U7wTXLmXH68NJmu+fVgxzlLap1JzrBuVeK1ubK7F89WWN03X0WMfDCnQGjMMRByIxA
	AZE15FTSsGcnYs6E71TC0Y7kmPsgnAi3c69PBfDAydrkMX9KrQZLwyvJkS7caYyO3CDDj1fSIuhwL
	VUDaZJHmx8dH+zD6sImJNGs9yEG5brcuAT8pb+/gatEJIZSHHA+GAg65pb/mhdCoF1aiBgsavaNXd
	7wa7MXhc+QoGTL2r8vvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJYr-005H5s-1Z; Thu, 08 Sep 2022 15:35:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJNw-005AGw-LK
	for ath11k@lists.infradead.org; Thu, 08 Sep 2022 15:24:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288EF04T009254;
	Thu, 8 Sep 2022 15:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GnuPK1Lxn/06hIMVMFoy2tDsZ3AtCIX6OTwMkcY2R5c=;
 b=AaK8ktsTg3VpR70hO2mk3Wlk/0f7o2oN9IifjcogzrlSK456IdTuKRzwqKi+Q2yfigUl
 HURHYpaE48I/sqz11kpIT04D0z7bdzRVbJR7vRxNwzPu2Imz6OZtfbNoxkRH/7J0iJCP
 i/oCclUH9nBrfChmgWaREw8kWwNrhWYNBIEEkN2CgWOE+eEjYBb3LEYQ0XtrfeBXpOcd
 vsloSAq8y0wS/3EnmnSjbLAXmc17bN6DN/PCnmbEbRLIbpn6QgLAb32TtMpA45urSOWn
 yUxDXM0H6Psr/zXNExpL6gbEmQ6Z7xznUwxzOjGddACpQwsxmZaPWbbyRLhNaZ/bWbi2 Ug== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jer1x51eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Sep 2022 15:24:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 288FO04O001003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Sep 2022 15:24:00 GMT
Received: from [10.253.74.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 8 Sep 2022
 08:23:59 -0700
Message-ID: <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
Date: Thu, 8 Sep 2022 23:23:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes.berg@intel.com>, <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: e_WaemDkP_sYNHFSYPTBPm7vcpxKDbGT
X-Proofpoint-GUID: e_WaemDkP_sYNHFSYPTBPm7vcpxKDbGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_10,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209080056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_082408_754276_FF323B29 
X-CRM114-Status: GOOD (  29.52  )
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

On 9/2/2022 10:12 PM, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
>
> In order to let the driver select active links and properly
> make multi-link connections, as a first step isolate the
> driver from inactive links, and set the active links to be
> only the association link for client-side interfaces. For
> AP side nothing changes since APs always have to have all
> their links active.
>
> To simplify things, update the for_each_sta_active_link()
> API to include the appropriate vif pointer.
>
> This also implies not allocating a chanctx for an inactive
> link, which requires a few more changes.
>
> Since we now no longer try to program multiple links to the
> driver, remove the check in the MLME code.
>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>   include/net/mac80211.h    |  30 +++----
>   net/mac80211/chan.c       |   6 ++
>   net/mac80211/driver-ops.c | 172 ++++++++++++++++++++++++++++++++++++++
>   net/mac80211/driver-ops.h | 165 ++++++------------------------------
>   net/mac80211/key.c        |   8 ++
>   net/mac80211/link.c       |  66 ++++++++++++---
>   net/mac80211/mlme.c       |  25 ++----
>   net/mac80211/util.c       |   2 +-
>   8 files changed, 286 insertions(+), 188 deletions(-)
>
> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
> index d4e1d73d88cc..20a2f25a38fa 100644
> --- a/include/net/mac80211.h
> +++ b/include/net/mac80211.h
> @@ -1799,6 +1799,9 @@ struct ieee80211_vif_cfg {
>    * @link_conf: in case of MLD, the per-link BSS configuration,
>    *	indexed by link ID
>    * @valid_links: bitmap of valid links, or 0 for non-MLO.
> + * @active_links: The bitmap of active links, or 0 for non-MLO.
> + *	The driver shouldn't change this directly, but use the
> + *	API calls meant for that purpose.
>    * @addr: address of this interface
>    * @p2p: indicates whether this AP or STA interface is a p2p
>    *	interface, i.e. a GO or p2p-sta respectively
> @@ -1834,7 +1837,7 @@ struct ieee80211_vif {
>   	struct ieee80211_vif_cfg cfg;
>   	struct ieee80211_bss_conf bss_conf;
>   	struct ieee80211_bss_conf __rcu *link_conf[IEEE80211_MLD_MAX_NUM_LINKS];
> -	u16 valid_links;
> +	u16 valid_links, active_links;
>   	u8 addr[ETH_ALEN] __aligned(2);
>   	bool p2p;
>   
...
> @@ -123,11 +132,38 @@ static int ieee80211_check_dup_link_addrs(struct ieee80211_sub_if_data *sdata)
>   	return 0;
>   }
>   
> +static void ieee80211_set_vif_links_bitmaps(struct ieee80211_sub_if_data *sdata,
> +					    u16 links)
> +{
> +	sdata->vif.valid_links = links;
> +
> +	if (!links) {
> +		sdata->vif.active_links = 0;
> +		return;
> +	}
> +
> +	switch (sdata->vif.type) {
> +	case NL80211_IFTYPE_AP:
> +		/* in an AP all links are always active */
> +		sdata->vif.active_links = links;
> +		break;
> +	case NL80211_IFTYPE_STATION:
> +		if (sdata->vif.active_links)
> +			break;
> +		WARN_ON(hweight16(links) > 1);
> +		sdata->vif.active_links = links;
> +		break;
> +	default:
> +		WARN_ON(1);
> +	}
> +}
> +
Now I found it only active the primay link(the link for 
authentication/assoc request) in my station MLO test,
change_vif_links of struct ieee80211_ops *ops of driver will only be 
called one time for the primary link.
it means only one link for MLO.
I plan to revert this patch in my local test now.

Will you implement muti-links later?
> ...

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
