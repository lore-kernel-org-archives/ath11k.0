Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669FECA0EFA
	for <ath11k@archiver.kernel.org>; Wed, 20 Aug 2025 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPQ251smWtJsbj5fDFVaalU6xEJ8NszNtoU+cNd16w0=; b=4xxOmh9jg8mfm8B9zKmCWDzC+C
	SXsHDVmXHYKMheAyFf4M8hZ0Fc7FV860Id9soYTSc4B9nkpR/IIrGP6/sckEKJOqvoTKA0M0rSXZb
	iLpdZibo0x8HgCSvcTlj0W4Bumo9BS41pkvT0ehiZioCiS4Kyd0P4OtZj/gm6w85XspDQVmvOWhvR
	gH7Nd7o8SUJSwwwfsBhxc5udxDqCgwx6CdtJDFGG2Uv2tWKzqw9mIMUACLIjktotn8iv6hPP/Nuv6
	e2qjmj62OMQyBihvXj92swYEwa4HxJ8pbm4/OS8MAwco5aHFpjrlvNv2QH49+LvPN9r88DVCCoLqi
	aJ3vEOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeDA-0000000CkCO-0jaR;
	Wed, 20 Aug 2025 08:30:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodmk-0000000Cfb9-16kV
	for ath11k@lists.infradead.org;
	Wed, 20 Aug 2025 08:03:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oexx025306;
	Wed, 20 Aug 2025 08:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPQ251smWtJsbj5fDFVaalU6xEJ8NszNtoU+cNd16w0=; b=BF5Kq+K/U6Gg9Nk7
	tKeoDg8qSISaOBedwwXerb7n9NCt8EL1QEF1c9AXKEgalQpcsdd1WXViFFkYokaP
	Ddeks8+0Fm2L90r9sLcHoaAtnlxYUpMRFHtX4iJHmSFTg6+1DjV+MQDY1JiV00VP
	XL+5hIJ8G7WVYdn+g+Ol4ha40ylg7CwBjRDnJma95MChis5h7R5rrAEZT3dV8dsl
	IRDI5GXTU/84+2owqNtu/d1NLFGqla5IxZtY04GdKsl6b1BD+icqehzy9U3biXa+
	M1kk1QTi2pH7LP0DsaxBpc6RvXE0DMp53A00EqGQOuC1aYyAH6qmccO8wT3G52Kt
	R5EUFA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a8wrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 08:03:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K832fZ031587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 08:03:02 GMT
Received: from [10.216.47.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 20 Aug
 2025 01:02:59 -0700
Message-ID: <69f3fef9-017d-86fa-8fbb-2ac2a1df8ae4@quicinc.com>
Date: Wed, 20 Aug 2025 13:32:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
Content-Language: en-US
To: Balsam Chihi <balsam.chihi@moment.tech>,
        Baochen Qiang
	<baochen.qiang@oss.qualcomm.com>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <jjohnson@kernel.org>
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com>
 <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
 <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com>
 <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
 <0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com>
 <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
 <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4gAtr6cl3EjhUhTzG5gal5JCiX3pzuTH
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a58137 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=3cWLWNXYlCYREKE2kekA:9 a=QEXdDO2ut3YA:10
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: 4gAtr6cl3EjhUhTzG5gal5JCiX3pzuTH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+fU6JEEftabF
 sm4QHgXdap2Mo1V5xMXaSN14zGKu3tgK4BoSqCnsWtJEeyAscb34+h2YCAIDJyZkxHKmYaF0VP4
 gYVH2GyGEQjeFjzUr8Nxzu/08KpWdmOQZ7NxmSyX5sURkLw9nJdyQ+jIevIg9pFas0tnzsaWUve
 3Z6pFXqLv/PxOwHSAIIc2tgaxj3qNfW6Uc0UNKDAghrIWl+vZ0cc80SRrDIptcKwYCRSwpT21K4
 pnt9InpCN8sZyJc5UZXyG7eHxSmO2UoNzTf6hI9OJgoGGz4rkxZt2odEz6gpJBY2TwhBHErRK/g
 V5Gqjluhvyxmxq7WCM69p5Bnohy4UHGsKDR/hLWezSOuw8B2bsyR6FjCzoyjSAoAfaBUT0sKOlv
 afZxcYqa8bVXATKJ7Kx+os1ycVJBAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_010306_335384_F9F99EA3 
X-CRM114-Status: GOOD (  15.50  )
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



On 8/19/2025 2:20 PM, Balsam Chihi wrote:
> Hello,
> I Have a question on the same subject but not related to the bug.
> I have many identical PCIe WiFi cards on the system and I need to load
> a different board-2.bin on each one (1 adapter per frequency band).

So you are using multiple pcie devices at the same time in a system
with ath11k? Wondering if you are using any private patches to address
QRTR instance id clash issue [1][2].

> Is there any kernel built-in solution for that?
> I could not find any, so I had to create a patch that loads a
> different board-2.bin for each card based on the pci device address.

Current board data selection for QCN from board-2.bin is based on pci+chip-id+board-id
combination, not based on pci device address. You can find the chip-id and board-id in the
debug during QMI boot stage. Then you can use ath11k-bdencoder [3] to encode those
board data binaries into board-2.bin. This way you can package all the needed board
specific binaries for a hardware into a single board-2.bin. Ath11k board data file
load logic uses chip-id and board-id to download the right board data for the given
hardware variant.

Vasanth

[1] https://patchwork.kernel.org/project/linux-wireless/list/?series=692423&state=*&order=date
[2] https://lore.kernel.org/all/20230111170033.32454-1-kvalo@kernel.org/
[3] 
https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath11k/ath11k-bdencoder

