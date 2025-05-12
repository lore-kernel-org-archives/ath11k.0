Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14072C3ABBC
	for <ath11k@archiver.kernel.org>; Mon, 12 May 2025 05:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDIdytGZa+TGnfD8ojbFhhx3JcMFfliGzjTaJ8uqITM=; b=vUlDd7IfPZOar2t/243c+crctr
	KS1cFWJGG5eECBgBVDKiDes8Jyn78s/GYYlziXVNCMQszE+ThpyMTW9l0KRhuNySLJ2JmPptFPr78
	8Q7J2lrnyG/mgB/Lnmyco7le2iS3McLhgepGuaMVxlKdBV7e7oqXDxZtWQvcm4Lk0L4Ro81hdCDOd
	uXwp1+fCmxCLWBKA5PhN3eBj+JrropHLE/uQiqW2JDnVARzQN4mnlZJXxK/ap2pAP4CIs07uH4sbZ
	+KN/HiDOW2BOhAPNKdXD3lR9gwlDvxXvaj/WU/8D2PIpb3x60BkES67xMRh+5nmjcofBhMEo1ykLZ
	75cJfm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEM6B-00000008S4t-1eoG;
	Mon, 12 May 2025 05:53:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEM67-00000008S4N-3Vsy
	for ath11k@lists.infradead.org;
	Mon, 12 May 2025 05:53:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BNffZB022631;
	Mon, 12 May 2025 05:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDIdytGZa+TGnfD8ojbFhhx3JcMFfliGzjTaJ8uqITM=; b=b6Cw9+Ym/1w9oZ7b
	GE8yR6INQ3xFnJ15vZdqFl6gmwim7zWgrgK5qP40lTu8dNlhT3irTo3qwnWIp1ky
	em9irs0pCD2RCrqAJQAAPa+O0VWhCMLxXhEzZiwrPbn1MJqrLsfmPi2CMHAFdU7u
	mgWWiKsWFpZnQI3R+zEqsiUr0xmQxQ3yqLTZh7vmwkqtT5GlPf9XQ9S7QBCR/75g
	sJq+ZE6VnMbXSjYlAVntK09WgJF45JFpnvXQXQjrkYG37TdcXULgH+l3MYa9DJ0/
	K2Jz+7LsEmIXAmhS922PEznEMKJVNnaab+CYeA2y9/3MsTlolaAl45Og2MGsi+Ol
	B5h33g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwruu9km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:52:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C5qwqG023965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 05:52:58 GMT
Received: from [10.253.79.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 11 May
 2025 22:52:56 -0700
Message-ID: <31e80294-5202-4210-ac22-842b08250c16@quicinc.com>
Date: Mon, 12 May 2025 13:52:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: support DBS and DFS compatibility
To: Baochen Qiang <quic_bqiang@quicinc.com>, <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, Mihai Moldovan <ionic@ionic.de>
References: <20241127022742.4016870-1-quic_yuzha@quicinc.com>
 <e8eb20ec-d022-45e4-82d9-00a4ab575676@quicinc.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <e8eb20ec-d022-45e4-82d9-00a4ab575676@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RrLFLDmK c=1 sm=1 tr=0 ts=68218cbb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=bC-a23v3AAAA:8
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=OHXgzxh2ditkStPoQuUA:9
 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yXY3iXaC4oxdcMXEl4naHe70_GtbY26v
X-Proofpoint-ORIG-GUID: yXY3iXaC4oxdcMXEl4naHe70_GtbY26v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA2MSBTYWx0ZWRfX+yTheCrvinzd
 Cn2fZuwGvEI6wcH33dGetOI7JbWx5oJn3eyQY1ek1bOifsSwOYxHv3WB2t/3E/r9/HgsLJ43/Nz
 ZAgfHuRVoLou6I3YOONWedXGd7N8xAYk2pBXxGTLKH6pHWn7+GJYKAWgbiJbHWZXBvjkbyC7jCj
 9ZE8DTOWZvyedSX9lxdUw/ca7EWw49qxaFn0gJUmzfZqkETfvgnx67dkCl8Cv0OcI2o65N26v1P
 MhQIX1uF+bzd/yFJ0LeBN0Veo9SI2+J7YRB6U5EVnkv0RADz9CedyEvF4gCOQYWphY+R5H3nPcm
 yCUReCDm8nkj+XB09cEQSok92S9+hLq0N4xC0ZrCzx9pJYgmdS49Mq3H939R8/S5UcEjmKJJys9
 pJWhCmbvW8p2O9f+odZ6KMShNpTD9ymblzMCEaPntAyodrs3XU7T0VMSwWcvy8582eU9Vx4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_225308_048079_EA3E4B69 
X-CRM114-Status: GOOD (  17.72  )
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



On 5/12/2025 10:56 AM, Baochen Qiang wrote:
> 
> 
> On 11/27/2024 10:27 AM, Yu Zhang(Yuriy) wrote:
>> Now some chips which support 'support_dual_stations' will enable DBS,
>> but will disable DFS. Restructure the ath11k_mac_setup_iface_combinations
>> function to support DBS and DFS compatibility.
>>
>> About 'support_dual_station' feature can refer:
>> https://msgid.link/20230714023801.2621802-2-quic_cjhuang@quicinc.com
>>
>> Add a ieee80211_iface_combination to support DBS and DFS compatibility,
>> one combination can support DFS(same with non dual sta), another
>> combination can support DBS. When running different scenarios that will
>> use different ieee80211_iface_combination due to mac80211 will go through
>> all of possible interface combinations.
>>
>> In addition, maximum number of interfaces of these types should be total
>> allowed in this group.
>>
>> The chips affected are:
>>
>>   QCA6390 hw2.0
>>   WCN6855 hw2.0
>>   WCN6855 hw2.1
>>
>> Other chips are not affected.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-00410-QCAHKSWPL_SILICONZ-2
>> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.1.0.1-01161-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1.
>> Tested-by: Mihai Moldovan <ionic@ionic.de>
>> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
>>
>> Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>
>> ---
>> v2:
>>   - Add tested-on IPQ8074 and IPQ6018.
>> v3:
>>   - Add tested-on QCA6390.
>> ---
>>   drivers/net/wireless/ath/ath11k/mac.c | 42 +++++++++++++++------------
>>   1 file changed, 24 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>> index 31ae9b384a29..aa63f5e20f2b 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -9911,12 +9911,17 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
>>   	struct ath11k_base *ab = ar->ab;
>>   	struct ieee80211_iface_combination *combinations;
>>   	struct ieee80211_iface_limit *limits;
>> -	int n_limits;
>> +	int n_limits, n_combos;
>>   	bool p2p;
>>   
>>   	p2p = ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_P2P_DEVICE);
>>   
>> -	combinations = kzalloc(sizeof(*combinations), GFP_KERNEL);
>> +	if (ab->hw_params.support_dual_stations)
>> +		n_combos = 2;
>> +	else
>> +		n_combos = 1;
>> +
>> +	combinations = kcalloc(n_combos, sizeof(*combinations), GFP_KERNEL);
>>   	if (!combinations)
>>   		return -ENOMEM;
>>   
>> @@ -9931,7 +9936,9 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
>>   		return -ENOMEM;
>>   	}
>>   
>> +	limits[0].max = 1;
>>   	limits[0].types |= BIT(NL80211_IFTYPE_STATION);
>> +	limits[1].max = 16;
>>   	limits[1].types |= BIT(NL80211_IFTYPE_AP);
>>   	if (IS_ENABLED(CONFIG_MAC80211_MESH) &&
>>   	    ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_MESH_POINT))
>> @@ -9941,25 +9948,24 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
>>   	combinations[0].n_limits = n_limits;
>>   	combinations[0].beacon_int_infra_match = true;
>>   	combinations[0].beacon_int_min_gcd = 100;
>> +	combinations[0].max_interfaces = 16;
>> +	combinations[0].num_different_channels = 1;
>> +	combinations[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
>> +						BIT(NL80211_CHAN_WIDTH_20) |
>> +						BIT(NL80211_CHAN_WIDTH_40) |
>> +						BIT(NL80211_CHAN_WIDTH_80) |
>> +						BIT(NL80211_CHAN_WIDTH_80P80) |
>> +						BIT(NL80211_CHAN_WIDTH_160);
>>   
>>   	if (ab->hw_params.support_dual_stations) {
>>   		limits[0].max = 2;
> 
> as this limits array is assigned to combinations[0], don't you need another array that
> would be assigned to combinations[1]?
This limits array just for AP and STA iftypes that can be shared.
> 
>> -		limits[1].max = 1;
> 
> why is this removed?
AP interface shouldn't be limited to only 1.
As Jose Ignacio Tornos Martinez <jtornosm@redhat.com> issues "[PATCH] 
wifi: ath11k: allow APs combination when dual stations are supported" 
https://lore.kernel.org/all/20241202091858.200773-1-jtornosm@redhat.com/
> 
>> -
>> -		combinations[0].max_interfaces = ab->hw_params.num_vdevs;
>> -		combinations[0].num_different_channels = 2;
>> -	} else {
>> -		limits[0].max = 1;
>> -		limits[1].max = 16;
>>   
>> -		combinations[0].max_interfaces = 16;
>> -		combinations[0].num_different_channels = 1;
>> -		combinations[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
>> -							BIT(NL80211_CHAN_WIDTH_20) |
>> -							BIT(NL80211_CHAN_WIDTH_40) |
>> -							BIT(NL80211_CHAN_WIDTH_80) |
>> -							BIT(NL80211_CHAN_WIDTH_80P80) |
>> -							BIT(NL80211_CHAN_WIDTH_160);
>> +		combinations[1].limits = limits;
>> +		combinations[1].n_limits = n_limits;
>> +		combinations[1].beacon_int_infra_match = true;
>> +		combinations[1].beacon_int_min_gcd = 100;
>> +		combinations[1].max_interfaces = ab->hw_params.num_vdevs;
>> +		combinations[1].num_different_channels = 2;
>>   	}
>>   
>>   	if (p2p) {
>> @@ -9970,7 +9976,7 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
>>   	}
>>   
>>   	ar->hw->wiphy->iface_combinations = combinations;
>> -	ar->hw->wiphy->n_iface_combinations = 1;
>> +	ar->hw->wiphy->n_iface_combinations = n_combos;
>>   
>>   	return 0;
>>   }
> 


