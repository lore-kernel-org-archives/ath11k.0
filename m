Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED23ED65C44
	for <ath11k@archiver.kernel.org>; Thu, 14 Nov 2024 06:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYN2T2uiL1rSa76+CT+P8a51e6Ph4ss/DFfXvR6dSUM=; b=URj9LsAEIq6Qo/To0EXe2WekuD
	o4Ezo5nkuqpHZJ0QTl6h3dN8pmZoJQmReK18NklYG/h0E0Lq0M3gitt6+1cn1Venp73m1awjXRCJ9
	1nuUDnMffmlbE+jj1VoyU9TBUqG20BWbNCTcugtVOhldq4AK6SnHaa6/XvLq2/TDa8cC5VfsvgG04
	Jp/lpJEso6hN9iwy0JK+TNRex0dFIp9kAIUFsVS2l6kmMBukOuuiRCBwE2qrCVTYvHMS7Upo021QK
	kJvaZwmyUTp/gUzrb+pzZ6Ou2LA0LzFv9xxjzViBEIZHSOl3iTLZNY0C/U9qDTL9JP6JLjpmP1hCv
	6gJJNGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBSz5-00000008vQy-1ws1;
	Thu, 14 Nov 2024 06:05:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBSz2-00000008vQZ-3A1i
	for ath11k@lists.infradead.org;
	Thu, 14 Nov 2024 06:05:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADHxnkg027160;
	Thu, 14 Nov 2024 06:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lYN2T2uiL1rSa76+CT+P8a51e6Ph4ss/DFfXvR6dSUM=; b=otkxhRVcqenYQ3lD
	6z3R+7bMMowhRvX53Em+fgW2MrLbixV3V9GCs+u3myAdxI+IM8/Fs0FCYVU4dHaU
	XWfv6DGrr+EoYsqvz0+C1cBnr8BclEf3S82nvPjQWVWA1OoNAEPpqVNIGv+D6fJj
	dCqbe2CwUQWwrfijvrWiGkT+BH2EUbgEG4E2cimOjPWd7J3GcdW4gD05RM3p27i/
	83+2KtT/SHKT34A3ZeWTAiAfufAKD++WCn+1BxUOH3wkvJ42mZUq3tNPYhFc2Doj
	/TGFWyQ3CY0K0eqmGH/f2YWa60MGfG4aVgWSv1Mvh9fNmqDIydi/nXJ/zG2Oj3fU
	oDG61Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w10jshth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 06:05:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE65VC3027388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 06:05:31 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 22:05:30 -0800
Message-ID: <7917a344-82aa-4ef8-9558-554743c5dd15@quicinc.com>
Date: Thu, 14 Nov 2024 14:05:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] wifi: ath11k: move some firmware stats related
 functions outside of debugfs
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
 <20241113015631.3105-4-quic_bqiang@quicinc.com> <8734jv2xnd.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <8734jv2xnd.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mECpuCujJ7lJmX2aoXkyFcvtoo3GOKQZ
X-Proofpoint-GUID: mECpuCujJ7lJmX2aoXkyFcvtoo3GOKQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=752
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_220536_948949_C9F1FD92 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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



On 11/13/2024 7:14 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> Commit b488c766442f ("ath11k: report rssi of each chain to mac80211 for QCA6390/WCN6855")
>> and commit c3b39553fc77 ("ath11k: add signal report to mac80211 for QCA6390 and WCN6855")
>> call debugfs functions in mac ops. Those functions are no-ops if CONFIG_ATH11K_DEBUGFS is
>> not enabled, thus cause wrong status reported.
> 
> What do you mean exactly with wrong status reported?
ah, thanks for pointing that. actually no wrong values reported, since we are not even reporting anything in that case. will be accurate.

> 
> mac.c is quite large already, making it even bigger is something I would
> like to avoid.
then can you suggest any other place?

> 


