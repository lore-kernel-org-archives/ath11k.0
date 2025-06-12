Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ACEC71136
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0DFzH1CWJKbI7tcV1MijTTXBL6R9YvoBS65P0+WZO8=; b=GPPTMYEmipCp3ONDXhbelY6JE1
	HEJFubCRmX39FA3Zq3zVUDC9aQ0shtd7E7S1kC6w4y0jNFb8g9gZ7/Bi0f2/Zc/CYXmjkVFgGspE6
	PEg94YNIjeZbBKT0ftjihhlSmXbhq3Rnw/QbTXR57nTTsarx5ipIk+NHbssZoo4QqMU70EXTbbwOe
	AICIdKpgTHJWAyZDfRy/CtobJPMakDmlsorcI2X9VqVs82Pe7v7LatZj27KN6D3euTZcbZwRsPv2R
	VZP6RYy9Rfe+jfeM5RXgkwYe9h4TGoycilNvbjUJ9ecwJtnLoX6o2Dpmoi9VGDmncjAnmqeQuXpTJ
	Igp2qs2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdPP-0000000Cdvw-3etY;
	Thu, 12 Jun 2025 08:35:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPch5-0000000CVaD-3XGE
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BKDHox027198;
	Thu, 12 Jun 2025 07:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0DFzH1CWJKbI7tcV1MijTTXBL6R9YvoBS65P0+WZO8=; b=Pso88brrYyw2FNtV
	+ucKM07hOsc5icp2wd2fHqYlNFulE/2zzQRn87/wGo/p+apvBd0e/h18HdZXkXtr
	t3EoiwvPM3B6ZHf8KXT0dvjGfMO3cIqBywSITTa8hecZp7e4iGhDc2HPO2G+xclj
	elLjTqS88bVPenpj6cbbLm4c2FnJOV67wWMlmU3xjmr0NvCvQ5ngEt9McSxvemW9
	b5fiQwskJmqigT5lGi+QCuP1gxwhkKsYIhP9BbwI5oPn2cvnpl5wB75yaKnyRt/D
	3hwn319qx7VTe6d2Z9TU9D1qS/2DgEUnx1OSOqDOsVI+8vTuASsOVFA+BW9YJ0+e
	cLFLmA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvfk96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:49:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C7nlSp030521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:49:47 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Jun
 2025 00:49:46 -0700
Message-ID: <ce3c0e51-4df0-4164-adcd-e98f2edee454@quicinc.com>
Date: Thu, 12 Jun 2025 15:49:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
To: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
 <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
 <rxaibpgtf37w3th5lnt3w574w443yononqjoglyfktlcxe26qg@jpmtkckrotzp>
 <2f77045c-6763-4fc4-bf09-50fd9b76a394@quicinc.com>
 <xr3n5pbohquhaloonctfqvpb2r3eu6fi5jly7ms4pgcotqmqzh@msrgbaawafsj>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <xr3n5pbohquhaloonctfqvpb2r3eu6fi5jly7ms4pgcotqmqzh@msrgbaawafsj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rgMrJ6vwbmgimnlQHWAS1h2kisqDrQLV
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684a869c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=Er88retq1L1mZmvwAMoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: rgMrJ6vwbmgimnlQHWAS1h2kisqDrQLV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA1OSBTYWx0ZWRfX200IIP6yTpiY
 4zIQ2hlrU4hRWaVDH8vJszYngNzsqdRAgY8aAqg69jWgop+6ojIdmpMxY887oxcUi2GZ5SXLZet
 zZNlBypaQetD82zjX1R3EoOkzNAf1f/Cp3E8alHXe+Q+/5Fn9PQNIoseHMskUzzNWnRBBf7aQ2v
 MdEUhlYIOqc9Xk6mwVOXKY31PpQ+6iUzli/GqlNWGxS8FyP3l27ejZISDF2XINPa4/ilcSd0f0n
 /W2jT+oS4kD1ugTFYU1V+v+/6KnfJxEITK6qmn9G5oUQWU0ogJgboZaxfyHXRYW1rrE341uMUJV
 EJK7+FCo+WaYSHXfmECfEeBNP2dDx4t8qKHV0jN8jwv4FWnmNLtp6NMdn9l46IEf9nd1bmP+e1U
 fPP9iq2uS+6zjP2nWXnFqwFvM2GeR18ZNLAaelk27eAedA7shXYR6mycczraxCsOJl+J8fsq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004951_888464_B1EFB287 
X-CRM114-Status: GOOD (  16.78  )
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



On 6/12/2025 3:02 PM, Sergey Senozhatsky wrote:
> On (25/06/12 13:47), Baochen Qiang wrote:
>>> [..]
>>>>> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
>>>>> index 8cb1505a5a0c..cab11a35f911 100644
>>>>> --- a/drivers/net/wireless/ath/ath11k/hal.c
>>>>> +++ b/drivers/net/wireless/ath/ath11k/hal.c
>>>>> @@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
>>>>>  void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>>>>>  {
>>>>>  	struct ath11k_hal *hal = &ab->hal;
>>>>> +	int i;
>>>>> +
>>>>> +	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
>>>>> +		ab->hal.srng_list[i].initialized = 0;
>>>>
>>>> With this flag reset, srng stats would not be dumped in ath11k_hal_dump_srng_stats().
>>>
>>> I think un-initialized lists should not be dumped.
>>>
>>> ath11k_hal_srng_deinit() releases wrp.vaddr and rdp.vaddr, which are
>>> accessed, as far as I understand it, in ath11k_hal_dump_srng_stats()
>>> as *srng->u.src_ring.tp_addr and *srng->u.dst_ring.hp_addr, presumably,
>>> causing things like:
>>
>> But ath11k_hal_dump_srng_stats() is called before ath11k_hal_srng_deinit(), right?
>>
>> The sequence is ath11k_hal_dump_srng_stats() is called in reset process, then restart_work
>> is queued and in ath11k_core_restart() we call ath11k_core_reconfigure_on_crash(), there
>> ath11k_hal_srng_deinit() is called, right?
> 
> My understanding is that the driver first fails to reconfigure
> 
> <4>[163874.555825] ath11k_pci 0000:01:00.0: already resetting count 2
> <4>[163884.606490] ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
> <4>[163884.606508] ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
> <3>[163884.606550] ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
> 
> so ath11k_core_reconfigure_on_crash() calls ath11k_hal_srng_deinit(),
> which destroys the srng lists, but leaves the stale initialized flag.
> So next time ath11k_hal_dump_srng_stats() is called everything looks ok,
> but in fact everything is not quite ok.

OK, we have a second crash while the first crash is still in recovering. And guess the
first recovery fails such that srng is not reinitialized. Then after a
wait-for-first-recovery time out, the second recovery starts, this results in
ath11k_hal_dump_srng_stats() getting called and hence the kernel crash.

Could you please share complete verbose kernel log? you may enable it with

	modprobe ath11k debug_mask=0xffffffff
	modprobe ath11k_pci

> 
> Regardless of that, I do think that resetting the initialized flag
> when srng list is de-initialized/destroyed is the right thing to do.

Yeah, correct.



