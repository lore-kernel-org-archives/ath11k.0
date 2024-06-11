Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1C3C27C4F
	for <ath11k@archiver.kernel.org>; Tue, 11 Jun 2024 02:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaxdyLJOSU9K33iaqv0WYkGOGkicjs7rnfHNDSgICtI=; b=RLnzJEGU9ckYK3lT9CYna9ETit
	/CtBg09LoBaLcmgET9OxldI1PIaZlc3amSywP/6GGe7u9wxh2fEVXigFoo7rTcKEqRgcu6qwMTn1C
	qRWdeo99QutgeoMzpn4JDc85CIAY2mvhla1Wrr/37yYbUAYt08Zc4kKVF7nukM++JEZ2ybv2Qy3IL
	LAoWXGhj8Thk/o3vSHI4dO/hs9eMgdeRtb8QRpfdpSp+gN3OQb8Y6Rua7O2rsUMqm+noy1f6TucIu
	oKHadPMBhG4yc8Dfoib30qhgqEgHgrfY8FGLtBG6Lu6ddyewGa02fwt5cTeQxioJOGe7ox52Xjcoi
	2ncmL1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGqpK-000000076vy-28A2;
	Tue, 11 Jun 2024 02:01:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGqpG-000000076ux-1KRB
	for ath11k@lists.infradead.org;
	Tue, 11 Jun 2024 02:01:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AE6N9e008673;
	Tue, 11 Jun 2024 02:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaxdyLJOSU9K33iaqv0WYkGOGkicjs7rnfHNDSgICtI=; b=I7aYNu1oJW1HfSkd
	aqOsg4tKYeIdsOSOZBjNbPQhW8MANx8ibNFibwhPZ93DQAsIgkBtcGIzhpdtZwqO
	ZkHDmaar6mEZfI4MBLUm4mVtMyxExSThDxx9DmCOa5jux3H2Mhe6It1YTqEGOnLe
	4AbtoT9TwXya2zd2jtS8mxYwm88lCSOl7FnopHVX3Da9ZqXso1Z0IXkUWrNzaR51
	we4l6J7Br8D9jPW3C1k+lPMjwZRhdGpwCwL7Rj6MXCWDJMmCUQMu+8tSEX4ZiwYH
	A3wPyMPommIi4dcfgOs1TqgTu18Gm2UFC7tJqOZJQV2VAoI4TJEkCKHSkUyJPpjm
	n0iAuw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgfk5nb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 02:01:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B21K1T030284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 02:01:21 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 19:01:19 -0700
Message-ID: <d62d9e76-86ca-497f-bc34-e6dc104be896@quicinc.com>
Date: Tue, 11 Jun 2024 10:01:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix wrong handling of CCMP256 and GCMP
 ciphers
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240605014826.22498-1-quic_bqiang@quicinc.com>
 <87zfrsohea.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87zfrsohea.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4Q8QgA2ftCgQOitHXBTg3XsPfjzYi_H3
X-Proofpoint-ORIG-GUID: 4Q8QgA2ftCgQOitHXBTg3XsPfjzYi_H3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_08,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_190130_477625_F2716E4C 
X-CRM114-Status: GOOD (  12.91  )
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



On 6/11/2024 1:07 AM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> Currently for CCMP256, GCMP128 and GCMP256 ciphers, in ath11k_install_key()
>> IEEE80211_KEY_FLAG_GENERATE_IV_MGMT is not set. And in ath11k_mac_mgmt_tx_wmi()
>> a length of IEEE80211_CCMP_MIC_LEN is reserved for all ciphers.
>>
>> This results in unexpected management frame drop in case either of above 3 ciphers
>> is used. The reason is, without IEEE80211_KEY_FLAG_GENERATE_IV_MGMT set, mac80211
>> will not generate CCMP/GCMP headers in frame for ath11k. Also MIC length reserved
>> is wrong. Such frame is dropped later by hardware:
>>
>> ath11k_pci 0000:5a:00.0: mac tx mgmt frame, buf id 0
>> ath11k_pci 0000:5a:00.0: mgmt tx compl ev pdev_id 1, desc_id 0, status 1
>>
>> >From user point of view, we have observed very low throughput due to this issue:
>> action frames are all dropped so ADDBA response from DUT never reaches AP. AP
>> can not use aggregation thus throughput is low.
>>
>> Fix this by setting IEEE80211_KEY_FLAG_GENERATE_IV_MGMT flag and by reserving proper
>> MIC length for those ciphers.
>>
>> Tested-on: WCN6855 hw2.0 PCI
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Reported-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>
>> Tested-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>
>> Closes:
>> https://lore.kernel.org/all/CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> [...]
> 
>> @@ -5927,7 +5929,10 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
>>  		     ieee80211_is_deauth(hdr->frame_control) ||
>>  		     ieee80211_is_disassoc(hdr->frame_control)) &&
>>  		     ieee80211_has_protected(hdr->frame_control)) {
>> -			skb_put(skb, IEEE80211_CCMP_MIC_LEN);
>> +			WARN_ON(!(skb_cb->flags & ATH11K_SKB_CIPHER_SET));
> 
> Using WARN_ON() in the data path is not advisable as it's not rate
> limited and quite spammy, in the worst case it can lead to kernel
> crashing (I have experienced this even myself). ath11k_warn() is safer
> in this regard so I changed it to this:
> 
> 			if (!(skb_cb->flags & ATH11K_SKB_CIPHER_SET))
> 				ath11k_warn(ab, "WMI management tx frame without ATH11K_SKB_CIPHER_SET");
> 
> Please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=aeadb08d7b4acced84a45812f1285c8cd3ed853a\
LGTM, thanks.

> 

