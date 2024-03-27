Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866D8C47DD9
	for <ath11k@archiver.kernel.org>; Wed, 27 Mar 2024 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Go75WFpQ11JIbQ6GcC+LxZIYbIddhsA7jBFd1k3Sj98=; b=j59o1SkONFu2C/s2Yf3dSiB37A
	79vO76mjI0fWHeEPZFDkClL3fFddhmb67pAsCOfvab2QLSolzLv89DwWK95PEvORk6im99hh49CbF
	KK2m2ZV6R7LTCkSJf1ulkvDORY5zDLcTL0FGbrFNH7rIV1y2RuNBbCidXh8jCpDcF8ZUmOnYyd94r
	lbXi0vnugoW5A/90zQkCuvmxOsdc+gcfso3Unzk1Lqk7kPRmtSBc8dyqycxcKJFSuPmR+Bm+ctdNI
	dE5vJ8/BbeVVZMGm43LEHryk8lR20bbm49I8tFytsppilaagt2mExBVObRtBxFa+Zj0F3ikkKrTj8
	+eADE3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQE2-00000008LeS-2dhG;
	Wed, 27 Mar 2024 10:09:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQDy-00000008Lbu-3omR
	for ath11k@lists.infradead.org;
	Wed, 27 Mar 2024 10:09:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42R8NGCP020977;
	Wed, 27 Mar 2024 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Go75WFpQ11JIbQ6GcC+LxZIYbIddhsA7jBFd1k3Sj98=; b=cP
	NelnD8pY0gBjmCArU8Uhd2EcTaCH6kbV/M1lowtszrW1uPyBnZTls2SbcHC5lj38
	B5aew8bOE5roaBTMawMQ1AHr+/pEQ+tBLtCYZDEv9GdqBMFrWDw+96AiQsY03x1A
	WbgpcD4PZNxzFOFBlinel59lvvHiKH1v8ozmNHTOWw1sTlszpgg+agObQS+ffa+4
	JxHD85VOzoY8w6FTEH1xB94OCk4uDPBMmBhjR1dN73j5TG9vP4d4y2+NdfzHKxqi
	vUrvH15nrQNUHUMgfc6/FUjkakg1CIKhFhBLwdF9rsDxIG0xFCzSUHpRMWAj8Gnp
	F3WJI6Hq1B8Rvsiow/9g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x47839bxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 10:09:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42RA9YII005676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 10:09:34 GMT
Received: from [10.216.7.159] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 27 Mar
 2024 03:09:32 -0700
Message-ID: <14699537-99b2-e468-6a7b-7b721193400e@quicinc.com>
Date: Wed, 27 Mar 2024 15:39:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] wifi: cfg80211/mac80211: Add support to rx retry
 stats
To: Johannes Berg <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
 <20240319134522.4021062-2-quic_haric@quicinc.com>
 <d364e872eb29f03236630bab49a3243e2118ab22.camel@sipsolutions.net>
Content-Language: en-US
From: Hari Chandrakanthan <quic_haric@quicinc.com>
In-Reply-To: <d364e872eb29f03236630bab49a3243e2118ab22.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hj9cwXoew0W_bsJq_vZz1QfFVDOD03oK
X-Proofpoint-ORIG-GUID: Hj9cwXoew0W_bsJq_vZz1QfFVDOD03oK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_05,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=647 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_030939_108978_84976D62 
X-CRM114-Status: GOOD (  15.32  )
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


On 3/25/2024 9:13 PM, Johannes Berg wrote:
> On Tue, 2024-03-19 at 19:15 +0530, Hari Chandrakanthan wrote:
>> Add support to count station level rx retries.
> Should the subject say "for ... stats"?
>
>> +++ b/net/mac80211/sta_info.c
>> @@ -2653,6 +2653,11 @@ void sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
>>   		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
>>   	}
>>   
>> +	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_RX_RETRIES))) {
>> +		sinfo->rx_retries = sta->deflink.rx_stats.rx_retries;
>> +		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_RETRIES);
>> +	}
> The use of deflink here seems ... questionable?
>
> I know we've not really done any stats properly here for link STA
> (patches welcome), but I guess this could be a first one that at least
> sums up all the links like all of these should, and then find a way to
> expose per-link as well?
>
> Although possibly we should just expose per-link to cfg80211, and then
> have cfg80211 sum up for the MLD representation...
>
>
> Either way, seems odd to add something now that absolutely cannot work
> for MLO?
>
ok.

Fields such packet count, retries etc can be summed up for the MLD 
representation and the existing NL
attribute can be used for exposing the summed up value.

But there are fields such as signal avg, bitrate etc which cannot be 
summed up.
Should we expose such fields of each link STA through NL?

Sample station dump log for reference:
         inactive time:  271110 ms
         rx bytes:       1129
         rx packets:     13
         tx bytes:       219
         tx packets:     3
         tx retries:     38
         tx failed:      0
         rx drop misc:   0
         signal:         -16 dBm
         signal avg:     -20 dBm
         tx bitrate:     6.0 MBit/s
         tx duration:    452 us
         rx bitrate:     260.0 MBit/s VHT-MCS 6 short GI VHT-NSS 4
         rx duration:    792 us
         last ack signal:0 dBm
         avg ack signal: 0 dBm
         authorized:     yes
         authenticated:  yes
         associated:     yes
         preamble:       long
         WMM/WME:        yes
         MFP:            no
         TDLS peer:      no
         DTIM period:    2
         beacon interval:100
         short slot time:yes
         connected time: 869 seconds
         associated at [boottime]:       1040062.600s
         associated at:  1695979678173 ms
         current time:   1695980547138 ms

> johannes

