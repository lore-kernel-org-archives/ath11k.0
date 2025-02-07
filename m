Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87461C02194
	for <ath11k@archiver.kernel.org>; Fri,  7 Feb 2025 02:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lmx7Fh3p/PFSQ1apxhaW8EkLnRUOlfdQPR75DkhK3I=; b=vK9SotS5KGb58mcjsgS3Sfs6hL
	mRM+uafROD0HfEdXGkmt98QGVwV4bYOZayyQkKeQIeoPfaV3EpKXut1cY9Ev6eIS7VZDZZbkbbyIv
	kNpIO8oIwDFABUuD/Zp2vZvZOlOJWZI1+Rju49HLDo7pj9zG+9sIBiR3ZjJbWmD3FdUodsDP3sfei
	a1MDuQmValtnVMimuwYXPFrk9Qr4diBPRpQo/3IurlTn2l/bVpYL7FoSvOGUW2PKV4ycIKhBCCD2u
	ZjZSRYl6WrAuYWlGRXvc5SlsDP4ScW2b+GBVvUCp8TpeUzJsFPy+u6bH9U9RSLPXMQ1GcU/SDmyYw
	NDFKsBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDgC-000000080ym-25qK;
	Fri, 07 Feb 2025 02:01:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDgA-000000080yO-29Pa
	for ath11k@lists.infradead.org;
	Fri, 07 Feb 2025 02:01:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5171PCvk028281;
	Fri, 7 Feb 2025 02:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lmx7Fh3p/PFSQ1apxhaW8EkLnRUOlfdQPR75DkhK3I=; b=pijQCxOUD8hli9WO
	EFm1iUiclCmsfcdrgNIv+wn7Yc9CGIZU74Lh226C2FYoYDJfthhWYb58yD6BKDZ+
	DGMTxo+WfoiluyundsP+TYpcEd4YZHOU0UI9ST2cbXHXYcetVrxmbn5/Hc7jnBFh
	/qIXcXY2hxf7vLn9vPrcdySeJFs6U3/8QFBgt/iR30nY/xLbl4URFH5wAvzkQnkY
	/tY4r0mpVREaohlz5QZXwL8u1uF0CiCtcp3OsScnUtg3FVlleLRAIiGMLWvIIXne
	Qzn+mfqGppOKm/lCMtQ30uBumOaBS4745HzFaFHs1vWqzTE68qnVNQUc1kzw7iha
	E1Un6g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n7p7r5fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 02:01:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51721B5f012127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 02:01:11 GMT
Received: from [10.231.195.16] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 18:01:09 -0800
Message-ID: <3e9d565e-dbb0-4a7a-987e-ed817e810607@quicinc.com>
Date: Fri, 7 Feb 2025 10:01:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>
References: <d410576f-2fc7-4de1-af51-29fbe8b14948@quicinc.com>
 <20250115130359.138890-1-jtornosm@redhat.com>
 <748a5a75-1385-4691-85c1-e9cc5eb4ffc2@oss.qualcomm.com>
 <e1c9b030-8a6c-4aba-8bdd-853113bef396@quicinc.com>
 <2b52714a-0fe2-4c85-95bc-4a6c0a8a0b60@oss.qualcomm.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <2b52714a-0fe2-4c85-95bc-4a6c0a8a0b60@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xFGOH_jcjhZNjLTVEwc8FlmP-SfXgfVw
X-Proofpoint-ORIG-GUID: xFGOH_jcjhZNjLTVEwc8FlmP-SfXgfVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=424
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_180114_564761_90843147 
X-CRM114-Status: UNSURE (   9.89  )
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



On 2/7/2025 4:20 AM, Jeff Johnson wrote:
> On 2/5/2025 11:46 PM, Yu Zhang (Yuriy) wrote:
>>
>>
>> On 1/16/2025 8:31 AM, Jeff Johnson wrote:
>>
>>> Kalle, can you review? You currently have this deferred in patchwork:
>>> https://patchwork.kernel.org/project/linux-wireless/patch/20240829064420.3074140-1-quic_yuzha@quicinc.com/
>>>
>>> /jeff
>>>
>> Jeff, can you help with this because Kallo has stepped down?
>>
>>
>> /Yuriy
> 
> We should avoid having new module parameters
> Is there a solution that doesn't require that?
> 

Yes, I think might not have expressed clearly. I was referring to the 
patch we discussed earlier, that Kallo deferred in Patchwork:
https://patchwork.kernel.org/project/linux-wireless/patch/20240829064420.3074140-1-quic_yuzha@quicinc.com/


