Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D22C47077
	for <ath11k@archiver.kernel.org>; Wed, 10 Jan 2024 02:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcypqG5QdjHDIkWJN7bUsD90G9kVZODAofgR0KKRspY=; b=LvDRFEZzWaatjQRzxTVfRz5gGC
	tVe0y2fcXKWbmr++GrpeWXeWgAh48nwCyEkvt3sp//0WrzV+nJdQ/ds2uB2SXYbyWS7cLKEBTwfZI
	FcP1DEhJPS7KBxh0HtyQ7tN8Kd09hRbMASbOmXvFijxVxTfJKFRHzpRamsQONXIl0tIgwcqe5xf9h
	16loULRNDxYnsjKjV376TN24pmfzy58ZpKc/lWR3QOLxEk1CdHBPZ/P4ufRyN8+WFRC3uYsDfixVC
	Rvi+lF+mOskD6ZbZw3TA077uy/ydreqNQOrrM09W6AwjJYCyfPTC5/1a61eCaCCrc39OULpsMfhuS
	gp+8Eetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNO8h-00A7vV-2n;
	Wed, 10 Jan 2024 02:16:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNO8c-00A7uh-0u
	for ath11k@lists.infradead.org;
	Wed, 10 Jan 2024 02:16:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40A1d2W5005296;
	Wed, 10 Jan 2024 02:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=IcypqG5QdjHDIkWJN7bUsD90G9kVZODAofgR0KKRspY=; b=Li
	Hr5zaGxFZnBnOa5ac+orYta92RhR5Yi3lLpH9ePvnaz/nGLBC99nCraydgvGUb4K
	z74kl2zS0T3GpGIHb8BIqal/LLB8AFfskbYgroHFpQAWhBp13Gq4SwlDhWBufLZz
	A1pXIcYiwhegfcRxbeiDot3AQTmN1H5Ua9fu6dyza0Tz7EtXBtJrPLwZIAGGHYgG
	yWILJKCHmhegNcgTJJrw9VSMKXxe2aEAWXWuTRhLg83pAf2Oeay4lB8Bn+E6z6zJ
	45Ktax48OG5NVrkvtT73XARGFD/5jc96i0hUNpvCIfGb53wkGGvrnsMj7eYTqsRX
	p5X6LGEDliomzhVU2mIw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vh9bmh5wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 02:16:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40A2G7GY013051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 02:16:07 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 9 Jan
 2024 18:16:06 -0800
Message-ID: <56282bad-b59d-4572-a6f1-1b905bf0edbd@quicinc.com>
Date: Wed, 10 Jan 2024 10:16:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath11k: add support for QCA2066
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240109021336.4143-1-quic_bqiang@quicinc.com>
 <20240109021336.4143-3-quic_bqiang@quicinc.com>
 <e19baf59-c17b-4e2b-96d7-f4fc9812c99a@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <e19baf59-c17b-4e2b-96d7-f4fc9812c99a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VmM3k_MDIJBlGppvJqy0nT4m-xa8daOK
X-Proofpoint-GUID: VmM3k_MDIJBlGppvJqy0nT4m-xa8daOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401100017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_181616_520737_A7410075 
X-CRM114-Status: GOOD (  16.30  )
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



On 1/10/2024 1:41 AM, Jeff Johnson wrote:
> On 1/8/2024 6:13 PM, Baochen Qiang wrote:
>> QCA2066 is a PCI based DBS device. It is very similar to WCN6855
>> overall: they share the same PCI device ID, the same major and
>> minor version numbers, the same register address, and same HAL
>> descriptors etc. The most significant difference is that QCA2066
>> supports 3-antenna configuration while WCN6855 does not. To differentiate
>> them, subversion numbers are used. Currently four numbers are used
>> by QCA2066: 0x1019A0E1, 0x1019B0E1, 0x1019C0E1 and 0x1019D0E1.
>>
>> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03737-QCAHSPSWPL_V2_SILICONZ_CE-1
>> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
>> v2:
>>   - Rebased on ToT.
> 
> hmmm, fails to apply using b4 shazam
> 
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v2 1/2] wifi: ath11k: move pci.ops registration ahead
>    ✓ [PATCH v2 2/2] wifi: ath11k: add support for QCA2066
>    ---
>    ✓ Signed: DKIM/quicinc.com
> ---
> Total patches: 2
> ---
>   Base: using specified base-commit 2cd4e3f91f264926a6b11df948417b74d52ca9b9
> Applying: wifi: ath11k: move pci.ops registration ahead
> Applying: wifi: ath11k: add support for QCA2066
> Patch failed at 0002 wifi: ath11k: add support for QCA2066
> error: patch failed: drivers/net/wireless/ath/ath11k/core.c:711
> error: drivers/net/wireless/ath/ath11k/core.c: patch does not apply
> 
> And sure enough the code at drivers/net/wireless/ath/ath11k/core.c:711
> doesn't match the code in the 2nd patch so something is amiss here.
> 
> note your patch has reference to .support_dual_stations that is not
> present in ath11k -- perhaps there are other prerequisites?
> <https://patchwork.kernel.org/project/linux-wireless/patch/20230714023801.2621802-2-quic_cjhuang@quicinc.com/>
Yes, as said in the cover letter, this patch set depends on the above patch.

> 
> /jeff

