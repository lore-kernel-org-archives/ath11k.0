Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76070C6379F
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 01:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcIlX75lNuHU+QGVl+bP9xSFsZEn1iRT5GEho8QVwNg=; b=LgVSAq4qdPKn9G
	EIuiR2RjohsjeWXklc3LJc8Wnybf3OBvLLyZwAiBUFhzpw9Bhn3GS0qaP8ss46E4RDvD+UZOVs+O1
	xr71Uet2KXMirLxYO6lZjHqQVQ21KnSoVauRizq7biZ+h/R9rdACphMU/Vkkd7VWvr5GVAWyu3ud8
	Og594+PUfM9S2SfB9wmiNJxOwnnDj/DfFABzzHU6Pjqlg0jnMMVZVPe1YPvcQm1mR8+7DZYEtUCxI
	EYhniyTMXtrPJZk2McPF0p6wfyMp/RdhxmsvWxnwyN+PRN/XRQVr3Xtx/zxpFxdI8WU4mxhF3umh9
	bL749kiDN3CCAvBBlhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS72U-004KhR-KA; Wed, 15 Feb 2023 01:56:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS72R-004KgR-SH
	for ath11k@lists.infradead.org; Wed, 15 Feb 2023 01:56:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31F0G79I026992;
	Wed, 15 Feb 2023 01:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IVxBmMXcZVXc0XwoF69Je4I7cIGhCAzg5IdYHqojbSY=;
 b=HE6lFM1+ohHkRC4Pc4rwhJzIXluLqCYZDwNuUFlZbcrhlxYoSkN45xMWtPK4dp33Jnht
 4FLLMi0tT9GYqcij3HdcBQg42kGGs59+dh8WQkTTHAg7Cl8IOWbjAHS0lMnzSPqANZgu
 QSJMeB5tRCP1h8KOMlUDNNxuZbmxDglsFrJlwgijYZUduFmuVhasiqzhd6Gtt8vpTXth
 KupJqZG4XDFn1XqEoH2fXQM55Im0Y9H6vwg7FnKmxZz/x2ztBfuSlwNcA7fBgbvZpS4Z
 xw5OAYmHBDWUNrgJG8sDanTIRWQnwLwH/8bQZvI08M+yMH17twxtoqhzK4UGnDPZrMAM HA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nrhx3rk29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 01:56:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31F1umg1005431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 01:56:48 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 14 Feb
 2023 17:56:45 -0800
Message-ID: <175755ef-e9b3-b039-0874-4a0bfb6eac2b@quicinc.com>
Date: Wed, 15 Feb 2023 09:56:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v10 3/5] cfg80211/mac80211: move interface counting for
 combination check to mac80211
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Luciano Coelho
	<luciano.coelho@intel.com>,
        <linux-wireless@vger.kernel.org>
CC: <michal.kazior@tieto.com>, <sw@simonwunderlich.de>,
        <andrei.otcheretianski@intel.com>, <eliad@wizery.com>,
        <ath11k@lists.infradead.org>
References: <1394547394-3910-1-git-send-email-luciano.coelho@intel.com>
 <1394547394-3910-4-git-send-email-luciano.coelho@intel.com>
 <4de1f964-b623-2b31-c044-60cc188fc134@quicinc.com>
 <6187b1566674ba2e0d7d5413af5475688d8421b3.camel@sipsolutions.net>
 <6c2b5e49-2cdc-b506-e3c8-0a51fccc294d@quicinc.com>
 <f5ffcc0b186cf9285e1dedebc8cf47c06d46bbd9.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <f5ffcc0b186cf9285e1dedebc8cf47c06d46bbd9.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1Fk_WXUaHJRlXnBdD-JDE2WlJf4A3vJa
X-Proofpoint-GUID: 1Fk_WXUaHJRlXnBdD-JDE2WlJf4A3vJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_17,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=766 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_175651_954356_62A89CD9 
X-CRM114-Status: GOOD (  17.49  )
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

On 2/14/2023 10:41 PM, Johannes Berg wrote:
> On Tue, 2023-01-10 at 15:23 +0800, Wen Gong wrote:
>> On 1/9/2023 6:05 PM, Johannes Berg wrote:
>>> On Mon, 2023-01-09 at 17:39 +0800, Wen Gong wrote:
>>>> On 3/11/2014 10:16 PM, Luciano Coelho wrote:
>>>>> ...
>>>>> +int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
>>>>> +				 const struct cfg80211_chan_def *chandef,
>>>>> +				 enum ieee80211_chanctx_mode chanmode,
>>>>> +				 u8 radar_detect)
>> ...
>>>>> +
>>>>> +	if (total == 1 && !radar_detect)
>>>>> +		return 0;
>>>>> +
>>>> should also check with cfg80211_check_combinations() when total == 1 and
>>>> num_different_channels > 1 ?
>>>>
>>>> When MLO is enabled, it could have 2 channels for one ieee80211_sub_if_data.
>>>>
>>> Heh. You're commenting on a patch from 2014, well before MLO :-)
>>>
>>> Not sure what happens in the code now?
>>>
>>> johannes
>> Yes, it is 2014. Each interface only has one channel at 2014.
>> I did not hit issue for the code.
>>
>> the story is like this:
>> When station interface and p2p device interface both running.
>> the station connect to MLO AP which has 2 links.
>> The ieee80211_link_use_channel()/ieee80211_check_combinations() call
>> cfg80211_check_combinations()
>> for the channel1 and channel2 because total==2.
>> When only station interface is running, not called for channel1/channel2
>> because total==1.
>> That is the little thing I hit.
>>
> So ... I guess you found a bug? Not sure what I'm supposed to say here.
> Send a fix?
I consider it NOT a bug. It is only the check is not strict here.
>
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
