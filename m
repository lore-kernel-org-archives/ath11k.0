Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61447C83F17
	for <ath11k@archiver.kernel.org>; Wed,  6 Sep 2023 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27kesD6Ju360eAEn5bJXTByGUaD7KdYGyKLLraAx3oQ=; b=TrvmFnpGmIz6rh
	BHEyweGg7DfasHUXQkvx8QjveeznvtgjHT2S9LXsY3gQtHSY9JJ7l2UdxkyBI/plTomPRpuva88vd
	aupnM98cDDpi5d+G1qDv3LP/JpnEY6T79f8khDPb3ciLuqOAe4v/v0XgZADRnahSkEGR6t5Db49cL
	Lt53vaJ1bkdQtc5VNtoHolZZHBRc6lhPUATZiXgeo6JqVvCZYzRBac5Uhy7rXsfjU21KJHtJm1YLe
	l0aFKFyQkdCF1wCgJol2Nq4vCcYZBp/K/7M965sWdGX0R83i+X5Tu1ZAiB9dBfD7gUDzjXmVPe7sh
	5eNTswQZHFsl6sS4i2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdtoj-00AJMw-1l;
	Wed, 06 Sep 2023 14:47:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdtog-00AJLq-2A
	for ath11k@lists.infradead.org;
	Wed, 06 Sep 2023 14:47:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3869QhVu030897;
	Wed, 6 Sep 2023 14:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MCfTsBRcBD266zzjaKIt5KalS7AY/K4xsW0jOJzZXQw=;
 b=L05hPjPrPcv1FED8HFfB5BiQLAWyba4hXoFShSfW/a9cPT52bwe0GF+p/5hkfS0GUg2y
 kKwpknR1H9xlmv1dp6Ax6ayN9J7k3lVfuj6WZZqvICCgYghtN25ZV+MN5UmKokC/HgNQ
 jdklq49WGy0mm7eiNBH2HHv0WkjnrIG27XV1wakgdWlHaPjEmxPurUwmc+n1L0ECRHa8
 7f8YBIq6CGzTWcnP+7k5x78oJs/1aJs2Og6JJoPzQ9fCYNeUkeMjpDYLRRgQrPGGlMUl
 FNDgt4iTcnEpR6seifDAs2sUckAeM/+u1alu35hlnKZriVR83KanQGuvigaXPgf8MBUY LA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sww32v9um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 14:47:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 386ElID5000605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Sep 2023 14:47:18 GMT
Received: from [10.111.180.119] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 6 Sep
 2023 07:47:18 -0700
Message-ID: <d191d35f-f006-45e6-bf69-3d4d251a892b@quicinc.com>
Date: Wed, 6 Sep 2023 07:47:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN6855: Request: Support ThinkPad X13s 21BY-S03Y00
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Alex R
	<alex@ironrobin.net>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net>
 <87jzt3ellx.fsf@kernel.org> <ZPhCq32KlaZteCzG@hovoldconsulting.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <ZPhCq32KlaZteCzG@hovoldconsulting.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: J-xKd7sxYibIlH9OWUH4RyKRmJziGTKE
X-Proofpoint-GUID: J-xKd7sxYibIlH9OWUH4RyKRmJziGTKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1011 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309060128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_074738_874389_07A73A93 
X-CRM114-Status: GOOD (  24.82  )
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

On 9/6/2023 2:13 AM, Johan Hovold wrote:
> On Wed, Sep 06, 2023 at 11:45:14AM +0300, Kalle Valo wrote:
>> Alex R <alex@ironrobin.net> writes:
>>
>>> Trying the latest board-2.bin from
>>> https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855 and my
>>> wlan0 fails to come up. dmesg: https://pastebin.com/CWHpD0kC
>>>
>>> My other X13s system (21BX-0015US) works fine so I am wondering if my
>>> new X13s (21BY-S03Y00) product type is unsupported.
>>
>> For easier tracking can you please file a bug to bugzilla:
>>
>> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
>>
>> Also adding Johan in case he has any ideas or knows what has changed in
>> 21BY-S03Y00.
> 
> I've asked for some more details from Alex over IRC, but it's currently
> not clear why there are problems with this particular machine.
> 
> It appears that firmware download fails, but apparently only sometimes.
> And it fails before loading board-2.bin so that bit of the report looks
> irrelevant:
> 
> 	[    2.195948] ath11k_pci 0006:01:00.0: wcn6855 hw2.1
> 	...
> 	[    2.423948] mhi mhi1: Requested to power ON
> 	[    2.427589] mhi mhi1: Power on setup success
> 	...
> 	[    4.035111] mhi mhi1: Wait for device to enter SBL or Mission mode
> 	...
> 	[   23.518986] mhi mhi1: MHI did not load AMSS, ret:-5
> 
> IIUC, things got worse with 6.5, possible due to random changes in
> timing.
> 
> You need to provide a lot more detail, Alex:
> 
> For example, did this module ever work, and if so with which kernel
> version? How is this module identified when it starts successfully? How
> did things change in 6.5? Have you verified that you're using the same
> fw on both the working and non-working machine (not just board-2.bin,
> which does not seem to be involved here)? You also said something on IRC
> about dual-booting Windows making a difference, etc. etc.
> 
> Johan
> 

Is this using the single MSI interrupt feature? If so, try:
"[PATCH] wifi: ath11k: fix boot failure with one MSI vector"

<https://lore.kernel.org/ath11k/20230601033840.2997-1-quic_bqiang@quicinc.com/T/>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
