Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27931C48285
	for <ath11k@archiver.kernel.org>; Sat, 27 Jan 2024 04:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6utVVzv24TMuHaOi9DUlqOdQ2/Jgg9eUs8xBXPgvhmY=; b=4moDAZlNSdXkk0xVY/U7AHTghe
	RGVqbtwmGvaQ8RvfLapaec4ob99vBK4yI0HWkgpvitO3FYMqWM6ZAVAdvNvmFmL2/zpdzTnF46D8y
	OvcntQfpnTHe0WsNPNTAdOPb1tocKDmprz4lXxRLEWMVO6tMVZeIATdKBKSEgGaKpPlALx2PiHud+
	MV2ya0XxuwyIE6IJCQZ4t49pdnaNM9ayycIO8eapsuC6H3IB4Bc4YW7VpaTMBopK8WUd60DtqYquQ
	NwHRZIIYc78EM+QoH2erR0wLM3hiU7mjE2+bNVuh1o36bB2anoykEiD+Ovz+uN3d1NELY0OVGaDyV
	/a3FepsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTaMX-00000006qRl-0Por;
	Sat, 27 Jan 2024 04:32:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTaMU-00000006qP9-1XPB
	for ath11k@lists.infradead.org;
	Sat, 27 Jan 2024 04:32:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40R4VlQx021059;
	Sat, 27 Jan 2024 04:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=6utVVzv24TMuHaOi9DUlqOdQ2/Jgg9eUs8xBXPgvhmY=; b=PQ
	gj2EF0qLiD64H9OZrxKwr91K/tHoN5Jt2AIXMUN/OJMKbacIPKMrXgwnXjeIR0mk
	H2hURs/7LDInCnLBZb6bhDK8H6mFySN94fpA79GKueQ7/4+yjS7db/9SP/Osb1op
	QrrTajve997WY2pzIIS1oSJgg7iOuu/SpJ1UkdMH05JNe2pzbo+pcgxzPDdS3int
	AwFR2PEIZ/hBv9U1sZZfh7XTIq26Ba6jd6jNzDStiVXkQWttEgJifjAQGjLZGijP
	G0ljcvQPYVf+A5siujg+BzKns0gXSydRskIDEmWxXqIQGH8pLcgHlZ/qQ79DtFA/
	KpWIgD8yi9vH0ZnZeKHQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvqhmr7ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 04:31:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R4Vjls016414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 04:31:45 GMT
Received: from [10.253.76.87] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 20:31:44 -0800
Message-ID: <fc6bd06f-d52b-4dee-ab1b-4bb845cc0b95@quicinc.com>
Date: Sat, 27 Jan 2024 12:31:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k and vfio-pci support
Content-Language: en-US
To: James Prestwood <prestwoj@gmail.com>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <8734v5zhol.fsf@kernel.org> <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
 <87r0ipcn7j.fsf@kernel.org> <356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
 <26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
 <87mstccmk6.fsf@kernel.org> <df9fd970-5af3-468c-b1f1-18f91215cf44@gmail.com>
 <8734v4auc4.fsf@kernel.org> <e8878979-1f3f-4635-a716-9ac381c617d9@gmail.com>
 <285b84d0-229c-4c83-a7d6-4c3c23139597@quicinc.com>
 <4607fb37-8227-49a3-9e8c-10c9b117ec7b@gmail.com>
 <3d22a730-aee5-4f2a-9ddc-b4b5bd4d62fe@quicinc.com>
 <ee0280fd-032c-4f45-a3f9-50d96d8bed6d@gmail.com>
 <16cfd010-b62d-4385-92d1-002820a8db38@quicinc.com>
 <cdec259a-b779-4856-8585-f285179e3671@gmail.com>
 <21e925bc-ee3e-4421-949b-b3839d2abdef@quicinc.com>
 <08457e37-49f4-4c51-998b-e577731c8022@gmail.com> <87o7dh2oky.fsf@kernel.org>
 <8b938c5f-a8c1-4fc5-aaf5-501f097a1db0@gmail.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <8b938c5f-a8c1-4fc5-aaf5-501f097a1db0@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ebk55hykM7StFfMozH85KxV78O9czg1o
X-Proofpoint-ORIG-GUID: Ebk55hykM7StFfMozH85KxV78O9czg1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=630
 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_203210_450654_C434567D 
X-CRM114-Status: GOOD (  16.83  )
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



On 1/27/2024 2:20 AM, James Prestwood wrote:
> Hi Kalle/Baochen,
> 
> On 1/19/24 9:57 AM, Kalle Valo wrote:
>> James Prestwood <prestwoj@gmail.com> writes:
>>
>>>> Sorry I should have made it clear:
>>>> step1: start qemu and load ath11k without changing anything, then
>>>> you get those errors;
>>>> step2: keep qemu running and ath11k there, don't unload it. Then
>>>> check lspci output in host to get the MSI vector.
>>>> step3: Back in qemu, hard code MSI vector to the one you get in
>>>> step2, then rebuild and reload ath11k.
>>> Thank you for the clarification, this worked like a charm!
>> Very nice, huge thanks to Baochen for finding the workaround! James, let
>> us know how it works for you in the long run. This would definitely help
>> automating ath11k testing so I'm very interested about this.
> 
> It appears this hack isn't a reliable solution long term. It did survive 
> several reboots but then I was back to the same behavior. Looked at the 
> MSI vector and it had changed:
> 
> It went from fee00558 to feee00538
> 
Yes, the MSI vector allocation is up to the kernel, and several factors 
are considered when doing this. Among them, the most important are the 
IRQ load balance and available vectors on a specific CPU. As a result, 
the vector changes, not only when you request it (as you already see), 
but also in run time.

> But at least I can just modify this and get it working again.
> 
> Thanks,
> 
> James
> 
>>

