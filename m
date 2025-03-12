Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920C9C282EC
	for <ath11k@archiver.kernel.org>; Wed, 12 Mar 2025 01:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWkh4M++TmQNIquc8+aHVhprni9QfryS5YoQKKoySWk=; b=ORCYCLdReVg2+rsnFwl8yPCz7c
	1aAlXCrJuL8s7dTXweGOpqslswHE9bzv7kQFgu19fCOmYJdzFnUgo0IKqgCbg6MFGR6sSc0f0SOcJ
	eEcPn8oXsWqGKYSCXykY3I2dDU1vIajSoQgEflPvxtVLqcgTcbQUbFVIqNB7hqvPKo32Hya5YXHkt
	xeoDrcQyCp3oqSv5e+BFRyt0Wkta7/1ShBmaEOmJa48AEN7L9BCUCT3mFsWd2DqaW9KVyUEgyVLAw
	OJCY2/un8HxWi6UCZn82eL/Dt7x/ebk/2XPwKPVWmHuZM+LdugAOl6pIbN6u+MJz/+b9s2ZfS94/m
	m+jAR5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsAdY-00000007Hlf-3gwG;
	Wed, 12 Mar 2025 01:11:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsAdV-00000007HlE-2zXw
	for ath11k@lists.infradead.org;
	Wed, 12 Mar 2025 01:11:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHCUh027310;
	Wed, 12 Mar 2025 01:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWkh4M++TmQNIquc8+aHVhprni9QfryS5YoQKKoySWk=; b=Yv8ohraZlZrLFjfF
	V+W1U+eVBZA7PfQcKvh4VN5sAuIqwh8HT8xBkLmzbiC6gWOv/9n+nKp+q6Dt/zpN
	KoADyUWW+mJkYzX7zv4wmr4uuuInAHzlLWoKcG2mFgfbquSa6KapRVharms5vT41
	KZAyP9MeE1tnBFabNtsPEh1oB5FenJIY8n2dD93Qs9BRGn3UrHm9FdtZvVvulvCN
	+GVk+JTKXU4WLCBUIUiWf3YTH/0UKS/CxUOmiWZcpr83+ls6JpyWmAloZMCKag5+
	9YScKoAw9Roddva95Ege07RsOi8ceQSDIUc9UArqiX6BSFJCQ971/6J6svOv7ks1
	rEbPmA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2prnxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 01:11:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C1BnPx009982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 01:11:49 GMT
Received: from [10.239.29.24] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 18:11:47 -0700
Message-ID: <72d95d77-674e-4ae7-83b0-ab58748b8251@quicinc.com>
Date: Wed, 12 Mar 2025 09:11:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johan Hovold
	<johan@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <johan+linaro@kernel.org>
References: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
 <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
 <Z866cCj8SWyZjCoP@hovoldconsulting.com>
 <7b1c5e40-b11d-421b-8c8b-117a2a53298b@quicinc.com>
 <c0cdcaf2-655b-4d22-a949-1519c552e6a4@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <c0cdcaf2-655b-4d22-a949-1519c552e6a4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d0df56 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=_461mWaigf2Lx6hHz88A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: fZBtn93iCiPlEz8MMMF9tBzirgQJJk4p
X-Proofpoint-ORIG-GUID: fZBtn93iCiPlEz8MMMF9tBzirgQJJk4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_181153_775029_51980660 
X-CRM114-Status: GOOD (  15.65  )
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



On 3/11/2025 11:20 PM, Jeff Johnson wrote:
> On 3/11/2025 1:29 AM, Miaoqing Pan wrote:
>> On 3/10/2025 6:09 PM, Johan Hovold wrote:
>>> I'm still waiting for feedback from one user that can reproduce the
>>> ring-buffer corruption very easily, but another user mentioned seeing
>>> multiple zero-length descriptor warnings over the weekend when running
>>> with this patch:
>>>
>>> 	ath11k_pci 0006:01:00.0: rxed invalid length (nbytes 0, max 2048)
>>>
>>> Are there ever any valid reasons for seeing a zero-length descriptor
>>> (i.e. unrelated to the race at hand)? IIUC the warning would only be
>>> printed when processing such descriptors a second time (i.e. when
>>> is_desc_len0 is set).
>>>
>>
>> That's exactly the logic, only can see the warning in a second time. For
>> the first time, ath12k_ce_completed_recv_next() returns '-EIO'.
> 
> That didn't answer Johan's first question:
> Are there ever any valid reasons for seeing a zero-length descriptor?
> 
The events currently observed are all firmware logs. The discarded 
packets will not affect normal operation. I will adjust the logging to 
debug level.

> We have an issue that there is a race condition where hardware updates the
> pointer before it has filled all the data. The current solution is just to
> read the data a second time. But if that second read also occurs before
> hardware has updated the data, then the issue isn't fixed.
> 
Thanks for the addition.

> So should there be some forced delay before we read a second time?
> Or should we attempt to read more times?
> 

The initial fix was to keep waiting for the data to be ready. The 
observed phenomenon is that when the second read fails, subsequent reads 
will continue to fail until the firmware's CE2 ring is full and triggers 
an assert after timeout. However, this situation is relatively rare, and 
in most cases, the second read will succeed. Therefore, adding a delay 
or multiple read attempts is not useful.


