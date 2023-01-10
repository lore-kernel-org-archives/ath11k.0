Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEE8C46467
	for <ath11k@archiver.kernel.org>; Tue, 10 Jan 2023 07:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5xabUnCKF1GQTVILizf8bI/BsxhduS533DT0pmx1cA=; b=iquucVqLqIa1JU
	pxk3fuWa1jENhpHY4ei0ghTprmfmvFLRvqANhXvwKe1iicqoHBa+uaX+TRkGnaI/O3BNlGRkRzo8A
	nQ2JLBWXowjLOXQ0SXIF6bb9drdSSjs8A1O/fz77J7TcHR7EcgqqioVx30oPJyIMOMKKCb3CQrj9I
	8njU7LPmC8++8rEGysWWYQB/bOmZjFMtQ9OhCH/rO5mDkry83N3k7vSEt5zMFdQ9utzdEVSN3u6tS
	Isae0cB9d9j6uUHSz8Mnvx+6sYgRX6SBqvDpeDN1ImAU9tBOmHyMsQKzKBhbXIIB514s+dvUlAyQO
	mRh+Nx+TwJ8uVQVbfuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8yu-005brE-6g; Tue, 10 Jan 2023 07:23:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8yq-005bpt-QS
	for ath11k@lists.infradead.org; Tue, 10 Jan 2023 07:23:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A6ZSUf014144;
	Tue, 10 Jan 2023 07:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Q+748n8FZZfq6Xu5mhYq78jUbCOiDo06low01xmA3qA=;
 b=XxprXIXJ0dCwhIiYzqnJAypYohIILPwqx3ovmavQ8oCFVo6Jhu8kfsBh1VDslv6wHbTX
 wyxDz5RehgRhg6VowJUaxMDXCZ2yfeDBs0tdkXaE8kZs8gevLQCR8cefAVnO6/Jpiv2L
 QjG2Qo+Qj5JmohLLzm6vW+I5XV8xRmN3ppQYcLBrY8V0JSGaMncBQ3GHfsRRCJB8jYHO
 e5COTFUgR1nbJLU30CWOihLXOchkrhJHVCoks0yP/wE9CP7tUK9sljqd+jETxypRcGap
 To/3pKAE+sVgUREYdVkE8JmbiVfYX3ydZMYjwbl1foaWDVBGs7HMxQ0TfQ1avSHKEI47 kg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n12vpr2e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 07:23:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30A7NO7d020594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 07:23:24 GMT
Received: from [10.231.195.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 23:23:22 -0800
Message-ID: <6c2b5e49-2cdc-b506-e3c8-0a51fccc294d@quicinc.com>
Date: Tue, 10 Jan 2023 15:23:19 +0800
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
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <6187b1566674ba2e0d7d5413af5475688d8421b3.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gAbvp1H71kWVXg641D7pzSlq9Dn-6ITO
X-Proofpoint-ORIG-GUID: gAbvp1H71kWVXg641D7pzSlq9Dn-6ITO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=767 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_232333_000545_E4D8B238 
X-CRM114-Status: GOOD (  16.15  )
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

On 1/9/2023 6:05 PM, Johannes Berg wrote:
> On Mon, 2023-01-09 at 17:39 +0800, Wen Gong wrote:
>> On 3/11/2014 10:16 PM, Luciano Coelho wrote:
>>> ...
>>> +int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
>>> +				 const struct cfg80211_chan_def *chandef,
>>> +				 enum ieee80211_chanctx_mode chanmode,
>>> +				 u8 radar_detect)
...
>>> +
>>> +	if (total == 1 && !radar_detect)
>>> +		return 0;
>>> +
>> should also check with cfg80211_check_combinations() when total == 1 and
>> num_different_channels > 1 ?
>>
>> When MLO is enabled, it could have 2 channels for one ieee80211_sub_if_data.
>>
> Heh. You're commenting on a patch from 2014, well before MLO :-)
>
> Not sure what happens in the code now?
>
> johannes
Yes, it is 2014. Each interface only has one channel at 2014.
I did not hit issue for the code.

the story is like this:
When station interface and p2p device interface both running.
the station connect to MLO AP which has 2 links.
The ieee80211_link_use_channel()/ieee80211_check_combinations() call 
cfg80211_check_combinations()
for the channel1 and channel2 because total==2.
When only station interface is running, not called for channel1/channel2 
because total==1.
That is the little thing I hit.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
