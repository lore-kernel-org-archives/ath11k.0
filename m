Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C38C54EBE
	for <ath11k@archiver.kernel.org>; Tue, 10 Jan 2023 05:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icx1WFFiud7B3fFQysyIOT1jE9/+NcQYg57fS1Q/Lmk=; b=LB5rc7z3q/pKSr
	+3cjEqveR53pq5YFoTFsSVwA2V0rDdcVWTrnyNDU/suIRDgv8I+kVVISlJtYL1thtsEE8OfqeKKsc
	HRH3i0HBhtTtdVyF+O97/4QqdVbNGH7yWpAyttV0JF2v0vvdbZNGwlyYcCaS8Xwl9DZQ7P4tBgLnL
	PLNi8FKWRPHBZjibjLnov/cPmh5X/nTFjb599H/wHyb7aXt7PIBgJb8/koRa67fXBe966HD6WT6ar
	is67UFX9vsZickNIB+RdAMtX7ay0UTfO8srC4TpGG1Tjunwe5J2HOqZiuqYhQ4ziLhTuXBI+dgCte
	fcfk795uJeh2R2obZjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF73K-005KZ3-4Q; Tue, 10 Jan 2023 05:20:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF73H-005KYE-9e
	for ath11k@lists.infradead.org; Tue, 10 Jan 2023 05:20:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A5FUFd021053;
	Tue, 10 Jan 2023 05:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3gqZAOAujEYkFiUKx/24Z83ZKWFv0qHC4gnwhRZhOc4=;
 b=hxk/tYAFE4/SfP6JC6pHzg0unAxRFg86c6xdNeURlXMEqlj0VfcNqzjgWXpcO1bGKRUb
 A/rR4mv91rx/O9Oe2AcCIg6AgVTx7dskCYQc1MOBjDSdEpZCh7qRwoYQUymYkCjKmyLt
 uovVlsXcXM23LvNk8P9/9QqXcqPgCg5xHyoyuMTTE2VU9InRuXKSW2xUVTqSbIcfjyZt
 QrXcNwYfiMO55DgDDXTBesoRFzO2UZnmlsQe8qThVlK8B1TLmdaOpFkEOi37jb6TybpD
 PZmD5r+f4ItskZ7yR5ep4xRKRbOI+A8wsqYBypwVnRK0Xf9IxRqDPcu4DEwDnuHM18Dn lg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n0q6es5nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 05:19:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30A5JpK5001401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 05:19:51 GMT
Received: from [10.216.51.52] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 21:19:49 -0800
Message-ID: <0b06dea9-d5be-1edc-62ca-576398d1bcd8@quicinc.com>
Date: Tue, 10 Jan 2023 10:49:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] wifi: ath11k: Optimize 6 GHz scan time
Content-Language: en-US
To: James Prestwood <prestwoj@gmail.com>,
        Marcel Holtmann
	<marcel@holtmann.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221220043823.20382-1-quic_mpubbise@quicinc.com>
 <5DAEA8B2-2B44-4A91-9E57-12B6C6B6C1FC@holtmann.org>
 <2861463e-a097-7efe-bc75-f13c8faf9547@quicinc.com>
 <378a1d63b3752ace7384c44d6f5184753fa7795d.camel@gmail.com>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <378a1d63b3752ace7384c44d6f5184753fa7795d.camel@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y_Aa44rV7LHfrgpiK6cllbkIQJ-faya1
X-Proofpoint-ORIG-GUID: y_Aa44rV7LHfrgpiK6cllbkIQJ-faya1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=806
 clxscore=1011 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_211959_502072_46BACDD5 
X-CRM114-Status: GOOD (  22.56  )
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

On 12/29/2022 2:52 AM, James Prestwood wrote:
> Hi Manikanta,
>> By the way, userspace itself selects the frequencies to scan, not the
>> driver.
>>
>> If we see the split scan implementation in cfg80211, this is the how
>> it
>> is implemented. If NL80211_SCAN_FLAG_COLOCATED_6GHZ is set, it
>> selects
>> all PSC channels and those non-PSC channels where RNR IE information
>> is
>> found in the legacy scan results. If this flag is not set, all
>> channels
>> in 6 GHz are included in the scan freq list. It is upto userspace to
>> decide what it wants.
> 
> 
> This isn't your problem, but it needs to be said:
> 
> The nl80211 docs need and update to reflect this behavior (or remove
> the PSC logic). IMO this is really weird that the kernel selects PSC's
> based on the co-located flag. The docs don't describe this behavior and
> the flag's name is misleading (its not
> SCAN_FLAG_COLOCATED_AND_PSC_6GHZ) :)
>

Sorry for the late reply, I was on vacation.

What you said make sense. The existing flag should not add PSC channels 
according to the flag description.

We can add another flag something like you pointed out 
SCAN_FLAG_COLOCATED_AND_PSC_6GHZ and include PSC channels if this flag 
is set. What do you say?

> If userspace doesn't specify a channel list then the kernel can do
> whatever it wants, but otherwise it should stick to the requested
> channels and scan only for co-located APs if the flag was set, not
> PSC's too.
> 
> This basically adds ~3x the time to IWD's quick scan's for 6GHz capable
> cards regardless if there are any co-located AP's. ugh.

True.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
