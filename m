Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B702C369AB
	for <ath11k@archiver.kernel.org>; Thu, 24 Apr 2025 11:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FG7sJkBzocTiQ4OOp3onmbz2e854K/0c4f9+3HvFEkM=; b=o3rTXY1EZkBxmQg/WVbOHfTjb3
	S+KH+YKSs86MEAVlj4tkUL/DRfcnnZPc+ovkCvgdJOkCMb1Ldjqj/6um80jONm+aQsWXphFhx2y63
	FkyA4EHJwfjMShdE2+9XuvR2RI4AGmja/5bZnrcUW24g3cT0UPCreBB52yT+wfwxBQQ7OIqLqYuqT
	yr7J69xvpaE1tqY+yPY2Dpo6m6gR8ip9K+5syUXuWMFl4515zXmelZNB46kzCyGVGS4ASawaXm48f
	RR3jclBXKflZXutd9VLcRmKaVKpc549toMxSHZz5imrgpmeuO9nDm/fzpp8crneRBYVXET1bVhTPt
	KVwxBInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v7t-0000000DvCB-3vft;
	Thu, 24 Apr 2025 11:52:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tDA-0000000DZS1-2lg3
	for ath11k@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FG7sJkBzocTiQ4OOp3onmbz2e854K/0c4f9+3HvFEkM=; b=aCommYjze9JL2EUyX6nFiGHxPC
	DnAY4guTEHd3aQkcEdz3eSRXGxvEcZ3RHIBe++NYWNmxOvpnZ5PckN7Uzag8wyXOXje66VCL9+6D/
	l/vRNTiiNmcmkiLy58aZAShwg+4IkEYTjyScMhb9ThMxk3jC8Iy1cRXA66zRdckIFEQBl9Krw35Ng
	kOdU3S4kI5w0jz5Nw3CLNih+FTHcDkM/9H/RMVmK2wB30G19iZnEutqVqxoLi0RldExC0DzFh0IjX
	sUlVQN8DsArAx0oY3134lo005kLNZjyySRIDZ6TKdT4ExADA2/Ib0gmymi+0muUDFzf4EzDNcnVYC
	Duba4aoA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tD7-0000000Bhk0-11zB
	for ath11k@lists.infradead.org;
	Thu, 24 Apr 2025 09:49:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F90V013300;
	Thu, 24 Apr 2025 09:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FG7sJkBzocTiQ4OOp3onmbz2e854K/0c4f9+3HvFEkM=; b=Gx3EoXOize/vjkU+
	gwjjVtW84gmdCsOefR15xpaEoiujYeK7MdXs4ztlQ5ZM6pKFoerRGj7OIHqgRHfz
	82cQ6RJAP6qym9P2cvsKjDG001tV4v8XgN98aSfOXuDEMqu/gx6QZOr9mcVClGXl
	PC4wjPvykE3jg7TPGAIbxGiBodfWD5PLL2fT71GR3Vz6xQsQxncYLl0qxK9DPfRz
	dxUDw1wRT1VRQlAikEbSW0+ywcXRuLqU8CbLD9g0JdHvAb30JvOYOSCHS2UueCUg
	PVmyU7OoNa9PyjH/gPkzM0rto3uZ9VVwgmntiBzAOFlyM62l3457Dg+3ZufCcV06
	qMnvxw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2d2gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:49:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O9nU7P023791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:49:30 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 02:49:28 -0700
Message-ID: <3da5d47b-993c-405e-841f-1d16d8715610@quicinc.com>
Date: Thu, 24 Apr 2025 17:49:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload
 with QCN9074 PCIe WiFi 6 modules
To: Balsam Chihi <balsam.chihi@moment.tech>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>
CC: <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <20250416100939.282481-1-balsam.chihi@moment.tech>
 <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com>
 <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
 <CAONkfw6m9O_6FZHBrPYdpv+=AxSgsbh1T7+GaS+U+bnjyVVJvQ@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CAONkfw6m9O_6FZHBrPYdpv+=AxSgsbh1T7+GaS+U+bnjyVVJvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pVT4jaqWBTYWharFM4dJoMlKlvq3IpTR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NCBTYWx0ZWRfX/OLlmc+j7/6/ eQC+BltmfA7vFlbW4oFIcYAa80rcGlQbtAnYSXbSnuSJO72rOIE8MThlQvtLCk+KeAPaF9dNZvS 74/0IThUcae3bPmyCwGrR4sOD9Uefto2nK3xIwvN3exen/7IPqoRaGZyg0Z7I8EZyqkDsSR5IMQ
 DINNoF7rykGlHA4CxOKOtQ3Zh+meIT8Uwqu9KLXgc0MQilHcSgki2po1n1XZz5qnGjXHPUxLDBM 0n7rP59FVgMIx0hOJlw5x0UiMNKM9rtWyoKABoZcceTmhYh3NyFzmwb6CEyY8AZw/paR1Hrdbun i9V1AXcFc0YoclJjD+cd3Ei4p3TvschhUGuhJTzBbsN1UIBiiJtNE4ytBje3YDPYvAukGAT3fqV
 cIUBwRgLTgD2R3JeM7Re4yHRe07t42PQv5qyQCDTGkwhtjhz54DU2SI0zb45vXZ69BKSFHWM
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a092b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Jt5UVSROhpSF5wDWJdoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: pVT4jaqWBTYWharFM4dJoMlKlvq3IpTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_104937_677896_F417E04E 
X-CRM114-Status: GOOD (  15.97  )
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



On 4/24/2025 5:25 PM, Balsam Chihi wrote:
> Hello,
> 
> @Baochen Qiang,
> Thank you for your feedback.
> I tested unloading and reloading the driver and it is enumerated,
> detected and operating correctly.

Different hardware platforms may have different behaviors ...

> And I understand your concern about other chips, and certainly it is
> not the best way to implement such a fix.
> I will continue debugging to determine the root cause of the
> synchronous external abort.
> So this patch is now just a workaround to fix the kernel crash when
> rmmod the driver and reboot the system,
> that i wanted to share with you to attract your attention to the
> problem, and seek for help.
> 
> @Vasanthakumar Thiagarajan,
> Thank you too for your feedback.
> Yes, I understand.
> I will enable the debug_mask and check the logs, like you said.
> 
> I'm wondering if anyone else has the same problem with ath11k_pci.a

There is another issue report with the soc_global_reset register, although it is reported
on another hardware.

Vasanth, could you check if the register address is correctly defined for QCN9074?

#define PCIE_SOC_GLOBAL_RESET			0x3008

> 
> I will keep you updated.
> 
> Balsam.


