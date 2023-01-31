Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8A3C38142
	for <ath11k@archiver.kernel.org>; Tue, 31 Jan 2023 06:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7f06V6NAGmlz38SXfiE9iyK1ukbE5K72LDOGl6Bg4c=; b=UVPnrEbv4REc8T
	UfVtTnF7fp41+BDzIMdlv2jPnk8YjiMG39rgiJzemYdT/JtEygtwXl6ufIU6a0mufYhgohVFoGHDW
	rvmy9Y4oEiN0xp9YfYfK5NzqQ0HaxFO5jKxzCjUoyhj39lVGCgZ+NZx0FBrwzeX1gf0M7vxevPVC4
	loAatxhSY5LbZbeSiFoFCLvgG2Tqzpq2lV2rY/BuY1Id5V/EC7pOwPqS2QW85oHBKTRpE85fURaIx
	lxYsG6HXF5Cy3oGET9+j499SoyY55peg2CA6bTB8H80GedNrd5upQMARhVlREatWzgaBsszVlRkkz
	L766/5PNkyJ+YS/+QY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMjoN-006PKB-RA; Tue, 31 Jan 2023 06:08:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMjoI-006PHo-Vr
	for ath11k@lists.infradead.org; Tue, 31 Jan 2023 06:08:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V5icAf025132;
	Tue, 31 Jan 2023 06:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XMJoiiBkZrWgq7ODQivuLtwWniyOqHqty1RrK9u1XB4=;
 b=UOEn4RVvvgUNn4APLfT0f4JXEpIae1ISkNltkZxanp25rhKCMdwA/JyI0bYVooz4Rp0l
 yVL5TwwxcZJH0pGk2LFvjZTTAkKila6WNUXYLZGwDTEvkYaDI0qLyp8+0JAVgjd7Ui1L
 YsBO+hcQ3qBt6f3Z4i9A91HdtfXhJe9rx/Eqkx0bnPgxFYZjrX4vxL+9SwGeO/rJ7sDY
 AoouKK/PF1uETgKEFbDHwV8eG7d/Zudz9JtkqE46ENxz9Z/YqZeWivXK5SqkrSpyjXyf
 TK0cAdQrjKrK4rgs1igeOPr/2xL39tTl41lJL1I6GPtfW/4ZXl0ESb57FbUlI1DdRqsY fw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3new3u8153-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:08:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30V67x0j002208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 06:07:59 GMT
Received: from [10.253.72.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 22:07:58 -0800
Message-ID: <31632d31-8c98-081f-bcf4-0966efe1256a@quicinc.com>
Date: Tue, 31 Jan 2023 14:07:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] wifi: cfg80211: call reg_notifier for self managed wiphy
 from driver hint
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20221214093937.14987-1-quic_wgong@quicinc.com>
 <0881ee1d0ae43ae18ab4b71ec8b5fd62263bbb69.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <0881ee1d0ae43ae18ab4b71ec8b5fd62263bbb69.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: np1gvB8N_-_oCoX7BJRZQ5ViVe3SEQX1
X-Proofpoint-ORIG-GUID: np1gvB8N_-_oCoX7BJRZQ5ViVe3SEQX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_220803_197860_29D6AC86 
X-CRM114-Status: GOOD (  22.60  )
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

On 1/19/2023 9:52 PM, Johannes Berg wrote:
> On Wed, 2022-12-14 at 04:39 -0500, Wen Gong wrote:
>> Currently the regulatory driver does not call the regulatory callback
>> reg_notifier for self managed wiphys. Sometimes driver needs cfg80211
>> to calculate the info of ieee80211_channel such as flags and power,
>> and driver needs to get the info of ieee80211_channel after hint of
>> driver, but driver does not know when calculation of the info of
>> ieee80211_channel become finished, so add notify to driver after
>> reg_process_self_managed_hint() from cfg80211 is a good way, then
>> driver could get the correct info in callback of reg_notifier.
> Seems reasonable - but maybe unexpected to some drivers, perhaps it
> should be opt-in?
>
> Though I guess not many drivers actually use this infrastructure in the
> first place?

Yes, I will add a new flag such as WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER 
for this driver.

is it ok?

>> @@ -3095,6 +3107,13 @@ static void notify_self_managed_wiphys(struct regulatory_request *request)
>>   		if (wiphy->regulatory_flags & REGULATORY_WIPHY_SELF_MANAGED &&
>>   		    request->initiator == NL80211_REGDOM_SET_BY_USER)
>>   			reg_call_notifier(wiphy, request);
>> +
>> +		if (wiphy->regulatory_flags & REGULATORY_WIPHY_SELF_MANAGED &&
>> +		    request->initiator == NL80211_REGDOM_SET_BY_DRIVER &&
>> +		    request->wiphy_idx == get_wiphy_idx(wiphy)) {
>> +			reg_call_notifier(wiphy, request);
>> +			request->wiphy_idx = WIPHY_IDX_INVALID;
>> +		}
> Why set the request->wiphy_idx here? Should this even go through
> reg_process_pending_hints() at all?

it is to skip handle for NL80211_REGDOM_SET_BY_DRIVER in 
reg_process_pending_hints()/reg_process_hint().

After change to use reg_call_notifier(), then it is not need again.

>
>> +	driver_request = kzalloc(sizeof(struct regulatory_request), GFP_KERNEL);
>> +	if (!driver_request)
>> +		return;
>> +
>> +	memcpy(driver_request, &request, sizeof(*driver_request));
> kmemdup()?

yes.

After change to use reg_call_notifier(), then it is not need again.

>
>> +	queue_regulatory_request(driver_request);
> But again not sure you should do this, rather than calling the notifier
> directly?
>
> I mean, you could just do reg_call_notifier() here, it's already async?
Yes, I will change to use reg_call_notifier() here, then it will be simple.
> johannes
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
