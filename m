Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EE6C28B2F
	for <ath11k@archiver.kernel.org>; Tue, 11 Mar 2025 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g93QI/9e/9KODrRLKXGs/+j5hmHTgWZHXAv9B57BMM=; b=M5dNyF5B73O7SW6EFgZgM1zJPV
	JaukCXd0pzjvoTNGkWkSnj4lyEy9VB95N6aMGWynYQO90ZMnXcHHvYkrn+vpacg+SjBV9LR4RbieY
	4+lAPEiXJiRGFESNjaVvTQyl0H06qgawitLqJY3He+RXjfI4/+J///zW0dGDWJr8JCQwyTwUs/tn9
	NmZ+gT9gqphMYxHXpanN/DHeibMQ9Rc7LM7mVLCMGg074tZ/nvaAHcbrFKl1o3+s4R2YUHLTx/g7V
	z1pRDHHrYJEM8YkR4+oUfOUxBGgnM1+LAlsfuiqIlWTWRPppFc3i7bI1fQAdH58MEkVaVujUJa9mR
	IcK71z9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2jn-00000006MPL-1Ghj;
	Tue, 11 Mar 2025 16:45:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2jl-00000006MOO-15Ze
	for ath11k@lists.infradead.org;
	Tue, 11 Mar 2025 16:45:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BGCHh5025277
	for <ath11k@lists.infradead.org>; Tue, 11 Mar 2025 16:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3g93QI/9e/9KODrRLKXGs/+j5hmHTgWZHXAv9B57BMM=; b=bVQC1W7L4W2f0gSL
	aBtfFDQZkgmUZixkrLCUAPewEC6g+czVQa61PJcxLEZqyjsN5UyDFhjzhug4CXeH
	aF2ald9nulF7RMcuSOQh7x2tanoS7iUkFSLZROgVxf3Ea427slDd8p5vQckUoRpr
	n+Yc0CmvmV1JbDCsSrhnv9eh9zZeuQlpeNuoHFbZ0vjXEpb6o3BI6C8763VtnOLu
	boppqcKVoDPq2xfxCjVTas1RBi9Ppa8REsjHMPyEEUIdURjsY+tHsPDCWOeYg6Zi
	Zj2WLrj74Y05/JxJIxTAoIjxkgCQinE6Y3pW1h8CihG+CpYKVsrUTaREXvNuZR9E
	qyfsjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah4t1pb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 11 Mar 2025 16:45:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2242a6d5775so51972325ad.0
        for <ath11k@lists.infradead.org>; Tue, 11 Mar 2025 09:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741711546; x=1742316346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3g93QI/9e/9KODrRLKXGs/+j5hmHTgWZHXAv9B57BMM=;
        b=o4tsgqAescQqIcuhsGhm3CLnauoGy5Pki2NERfrOgZaIIrrIqAmOQEr7agSWjM/BrG
         pyl6oD5ypSFt8hTONR7mTCt24mCU3sUslZTptcU4mZWNM96hnaTUW/CRmrhBhJxFgruI
         swzo7wifgePcbS/o+Ip523Ve+qdI2IiyvMk8EotZVIqZJ34ueahQZ3Z/GXD0NULqrBST
         hbmiNtxDfS0iyaa6XKuOt+IV6Y36UcWawoZy4RRBwHoJ1nuKLFeUPLmIU3hN6rkVIEPq
         1TB8/izufNLbbSyf5g7M4nL0HYpxgEbreVuWZCcM7epdlF9FMF1UhL652kkeyM4AgzIC
         exkg==
X-Forwarded-Encrypted: i=1; AJvYcCVUKjOjrOR7RBpGNZgHDGGK8hXInmWPDhgUAdaC10Vx2PVHx6UarvxUbJV+Ny9Lm75h8bLbMr4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPnVJwWW9FJEMrgsb0uhgMl13nRC2xNt7jqluHHWrIp1eGWQs
	C2t9D9x8No7CiApQj7oVaSE+FXevdvFp0SR3jsagKV5FzjIGV/qRZ9ZLRtMPPZp/aLW4gNbsgYM
	hAultVF1wZfauZF23zJep/VEW2xoDCp2LlefXxdFGjx9/iRi5V0sWI3nt5mCAySsY4FE1
X-Gm-Gg: ASbGncsXRHIrQHx9oElNf3KgQWhg0p3xDplbRWsMUgtmQkE0WlIMUbxpbO9Bbqq6fxv
	5J6l+v3p+PHxsfnSUDPIXJkQ9HdwdvUL05vxFG31WnZICb387uuUe+jqI7yN7SuoOGTBSOr1W/4
	l6Q7G8z0IeX81eL3m1rv7iNMlCTEc93uv9f2p9EfikTdRsd31fz0yRXj03DTgOu7hX7WwAKTMtL
	iIglSE3205owLthK/eNTMf8UV9dV5ZHvuiQ7HLpNp1fX6HqURk3bdBuuNGFV0sqsuVWabTf+p6S
	CyVRXW/j/YiFq+Qnxgn6oAecZ/TE9wivCOBQRrK2S9pvHcCwdsJPSTYPkGEOFqS/8KBqDKtQH68
	zB0LM
X-Received: by 2002:a17:902:f70c:b0:223:49cb:5eaa with SMTP id d9443c01a7336-22593183d83mr62245315ad.35.1741711546429;
        Tue, 11 Mar 2025 09:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMKT0bhq9gObWNi1A7qYtgXk99hHQyFPCQuZU4Ev+zmdxvZYZAV0O9EZcj15+XH7XREyEbxQ==
X-Received: by 2002:a17:902:f70c:b0:223:49cb:5eaa with SMTP id d9443c01a7336-22593183d83mr62245035ad.35.1741711546091;
        Tue, 11 Mar 2025 09:45:46 -0700 (PDT)
Received: from [192.168.69.142] (c-98-35-147-9.hsd1.ca.comcast.net. [98.35.147.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a91c50sm100408765ad.185.2025.03.11.09.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 09:45:45 -0700 (PDT)
Message-ID: <8da45052-def5-40fd-9701-7599e8fd5bda@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 09:45:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath12k: pass link_conf for tx_arvif
 retrieval
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
 <20250310200237.652950-4-aloka.dixit@oss.qualcomm.com>
 <289cca50-b559-4b7f-bc89-e089d7bdf6e0@oss.qualcomm.com>
 <b9ccf604-800e-4e4e-bf35-62d97cd1d90a@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <b9ccf604-800e-4e4e-bf35-62d97cd1d90a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R8SO8tvLxOkc_RGYXHGJCU6YYkQ0AnwW
X-Authority-Analysis: v=2.4 cv=fZ9Xy1QF c=1 sm=1 tr=0 ts=67d068bc cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=UlYobBNIKLIdKoAhXwLdVw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=92TBJxoUzZZWgJSFfrcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: R8SO8tvLxOkc_RGYXHGJCU6YYkQ0AnwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_094549_408691_EB0C5EC5 
X-CRM114-Status: GOOD (  13.97  )
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

On 3/10/2025 4:18 PM, Jeff Johnson wrote:
> On 3/10/2025 1:06 PM, Aloka Dixit wrote:
>> On 3/10/2025 1:02 PM, Aloka Dixit wrote:
>>> Three out of four callers to ath12k_mac_get_tx_arvif() have
>>> link_conf pointer already set for other operations. Pass it
>>> as a parameter. Modify ath12k_control_beaconing() to set
>>> link_conf first.
>>>
>>> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
>>> ---
>>>    drivers/net/wireless/ath/ath12k/mac.c | 31 +++++++++++++++------------
>>>    1 file changed, 17 insertions(+), 14 deletions(-)
>>>
>>
>> Forgot to add tested on tag:
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>
>> Will send the driver changes again with the tag if required once
>> nl80211/mac80211 review completes.
> 
> If Johannes accepts the first two patches I can add this to the ath12k patch.
> 
> Note, however, that you forgot the wireless-next subject prefix tag ;)
> 
> /jeff


Yeah, I see a nice table with warnings now,
will take care of it once the technical review is done :-)

