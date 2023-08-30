Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24FDC6FA8F
	for <ath11k@archiver.kernel.org>; Wed, 30 Aug 2023 22:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHKkIuF+PDkSPbgW3h9GFL0vlGDLCNXJsXWCG4ufqe8=; b=OgJLFSjFOUhsbA
	5M1ymguKj6E2UJ/DNbRyGpemA5q9y6XCGozH4hxD0vv13SlcgQwLOr4acV7ZmLL7qEV9k+BBbFz6Q
	IhaPpsCGcw+kdUt1la0jJ4X0h+3qTEj6+TWKAArlm2fGNIUS1bXpOagD+G0hpOiP38YaXV3u56p5R
	gqJFA6BtBfIYLCgZfPZgmw39PfCwcA4H/LBu8x7fQdtMRuVDU8xRVEhheXCgdVlaVRzG72mSsDnfu
	WXU3hKZUJ/YaCNHk0ZGqwe2fFzmX9dk4Rda/2L0kBsetjgafObWKAwFun52Sv05u+2KI7kDaI7Qvt
	4fpJW1iyWdw+lBzJC45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbTQ7-00EG6I-2d;
	Wed, 30 Aug 2023 22:12:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbTQ4-00EG5V-1W
	for ath11k@lists.infradead.org;
	Wed, 30 Aug 2023 22:12:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37ULGdb0032328;
	Wed, 30 Aug 2023 22:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ODKiYE9OB0DWn4KrTRo7ikfCC4mEUmjVGp92f6ximWY=;
 b=HAQBpwhnEq4wdk0fSivPH919c14Nu98VZbGhiTK3zTqlKLN+BfS84vBbQuflTwzevlp5
 fWCBKPXk7HzLrPdCEZ0rJV44zI1pPH88Qr5tav8OlBZ2kQROJbEzMnrHXxVVsJCP/LW2
 rvwpKKI7R5USpwaLXi0zNe4vkXfTpaKxUnXQGo+pkX+IrSRU8pv6B2/v51qvDA2st/9F
 SCAfHdrIpQLarh5txAt2T9Qo1eOW6mfaSEufbyoxvDyxafgCwJ21+oCHM5IP22k6I/lN
 GT51D1ueBUQREL1GcyLZ4rGvlWB3x8r7frR/yi/hxx/6uABOqx9NXwCMhhIrzSE6cYlf QQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3st9vx0gdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 22:12:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37UMC6wG017389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 22:12:06 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 30 Aug
 2023 15:12:06 -0700
Message-ID: <17cbe235-de63-4561-9c17-4c2c1b541e91@quicinc.com>
Date: Wed, 30 Aug 2023 15:12:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix boot failure with one MSI vector
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
CC: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20230601033840.2997-1-quic_bqiang@quicinc.com>
 <87fs70hlel.fsf@kernel.org>
 <545cc8e8-481d-85b2-5692-43580936b48d@quicinc.com>
 <897b61ea-36d2-1ab4-9c60-9bdfd2d9cad7@quicinc.com>
 <fa70ca5e-001b-3c6b-dbc2-2853f8fc2f72@quicinc.com>
 <fcb783b4-95e9-24d8-a656-b273a79598a0@quicinc.com>
 <4720b820-523a-477a-436c-72fceb4a6a12@quicinc.com>
 <87sf8bi6lo.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87sf8bi6lo.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rUaD_9Ig-RxQTrZhg3OVkaxYQ_ENc7Tz
X-Proofpoint-ORIG-GUID: rUaD_9Ig-RxQTrZhg3OVkaxYQ_ENc7Tz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=789 impostorscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_151212_563788_C64ED255 
X-CRM114-Status: GOOD (  12.65  )
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

On 8/22/2023 5:50 AM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> On 8/7/2023 8:59 PM, Jeff Johnson wrote:
>>> On 8/7/2023 3:16 AM, Manikanta Pubbisetty wrote:
>>>> No impact on WCN6750.
>>>>
>>>> Tested-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>> Can you provide a Tested-on: flag that Kalle can add to the commit
>>> text?
>>>
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1
> 
> Excellent, thanks. The more Tested-on tags I see on the patch the more
> confidence I have for the patch.
> 

This fixes my spurious bootup failure :)

Tested-on: WCN6855 hw2.1 PCI 
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
