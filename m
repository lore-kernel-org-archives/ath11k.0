Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF871C4345F
	for <ath11k@archiver.kernel.org>; Sun, 14 Apr 2024 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMCaeiGsTkaQf2mcTwDFyVW2yYzd34i4kAKfSklt4Tc=; b=fwbjyvICKsVphKVqgGbz1wFhW8
	m/O1pO9f5hyDaziYvC2S7pCHHC3hmCxYbCMJ+w5Q9MK4SKHVFarZdAZrJjrN78ohBDhsQ3u0XlMsj
	qHVyY8C1gdDoAfRcjgFTYvXHsOJYEMcaM+BPcxe+lbMS7fW9aCIXo64+airtn9scE/Ws50v760yo2
	Bwe3KtDibFScCrxuv6kx1RqKzCo6AMo87o8fy2YXfen3eqeQSCsAU1psR7OUNUpI2ivSBrsJE3r/V
	w0TzgdxuQ08dNr4Tf9LaxIVRYG5pf1byyHHalPCaTOGb6e95DShWa43GYMoyHyTFL9MIo7AXFOKIi
	1uwRMCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw00E-00000005Xqb-1GiG;
	Sun, 14 Apr 2024 13:34:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw00B-00000005Xpd-1Xs2
	for ath11k@lists.infradead.org;
	Sun, 14 Apr 2024 13:34:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43ED0tq5022087;
	Sun, 14 Apr 2024 13:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=HMCaeiGsTkaQf2mcTwDFyVW2yYzd34i4kAKfSklt4Tc=; b=mA
	8hCuh2oluIixmzsx1zCSgXYnyeDkXlY9ak/B2xc3lYt16tV+KiiWTFK2Z8Zw34Wg
	Vv957a4rqt6C61YwXXmieiuawTsb1/GYvU0t97z/xFmc2N2j/cbX9CLtC6vGYoDK
	PdtaUiw6mRO4LdXIfvwYM9wPoj2k1ydcKk1tBllLjDs92D5hotGTr+cGU5Gwg7ux
	cubiyJC+bWF0ecTDyMBCTXqmu8B13HcSi5MS38L/ByyyuK33m7iyVBF279tOPS2s
	YjOicTjfr+QSt+ArqMzOMPxC/oiTxfKiPBIkXAdtSHSddcj62OUEaGFP6fp9Ssu/
	U5JA/BaP4+JvrUqLwE6g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xfk7q1v3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Apr 2024 13:34:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43EDY2lJ023664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Apr 2024 13:34:02 GMT
Received: from [10.110.8.16] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 14 Apr
 2024 06:34:01 -0700
Message-ID: <e40eb820-438b-415e-b91a-d448ac60d9a4@quicinc.com>
Date: Sun, 14 Apr 2024 21:33:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: modify the calculation of the average
 signal strength in station mode
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240309121129.5379-1-quic_lingbok@quicinc.com>
 <171034681684.2322265.9660346495295315212.kvalo@kernel.org>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <171034681684.2322265.9660346495295315212.kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x-xkjMdtD3Rv9-flZumOXT7rJvRLSHDG
X-Proofpoint-ORIG-GUID: x-xkjMdtD3Rv9-flZumOXT7rJvRLSHDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-14_03,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=894 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404140098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_063435_453424_3CB84C25 
X-CRM114-Status: UNSURE (   7.98  )
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



On 2024/3/14 0:20, Kalle Valo wrote:
> Lingbo Kong <quic_lingbok@quicinc.com> wrote:
> 
>> Currently, the calculation of the average signal strength in station mode
>> is incorrect.
>>
>> This is because before calculating the average signal strength, ath11k need
>> to determine whether the hardware and firmware support db2dbm, if the
>> hardware and firmware support db2dbm, do not need to add noise floor,
>> otherwise, need to add noise floor.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> What about AP chipsets like QCN9074, do they also work similarly?
> 
Hi, kalle,

I observe this patch's status is deferred.
https://patchwork.kernel.org/project/linux-wireless/patch/20240309121129.5379-1-quic_lingbok@quicinc.com/

I think it belongs to bug-fix, so, could you please merge it? :)

Best regards
Lingbo Kong


