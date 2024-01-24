Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D59C47258
	for <ath11k@archiver.kernel.org>; Wed, 24 Jan 2024 02:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeljonlehUh1fFPuYgO+4Ggh9DflsM1FG8kOjLWSceA=; b=AW4UMxkHMoVu6ctjM40qvULZzp
	EnNSxUfpr5mB9e3qq9GcoLeJXgWP657R5XH1CDxKn8SqUJkHAPraHMWKDOaOAB2lEpeT0qXgkDXOk
	0pPgO6iKaEY0DbJBjPn95HTtmmqa/IG5LmK5AClitj8IHbkmq7Eefp+/ffe82q4tXKyb5Ewg2gUiZ
	0tdEKYABNLXYExAdoX1795hrT+cbXwX0IrHzWXNw/i8XJMHRqrwkBHPgIeRZ8q3t3XSVmVwCHil+1
	I0xaPgZDQdqBUzM+teBEniTeWwH8pVBPqRKa+rn7RBqEBp1OYkQ6k1oPh71IsSdItPyB6uPG+MGvW
	l5RsDMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSShF-0015MX-2B;
	Wed, 24 Jan 2024 02:08:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSShD-0015M7-18
	for ath11k@lists.infradead.org;
	Wed, 24 Jan 2024 02:08:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O10Jri015738;
	Wed, 24 Jan 2024 02:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CeljonlehUh1fFPuYgO+4Ggh9DflsM1FG8kOjLWSceA=; b=PK
	MGLTtd1tPX/lsz7bc5aIK/jzvoRkFpD/iheAiIvveKEUsO19ad7nOWoDSuUA/V17
	GQ4jERfyes5xyUB2BFZmOKbZq9s1kjy/wKGpqhmGhvWFENO9guDg5ILAISO4ROvd
	kDDD9Li6qSYOmYET4zJ8a9+9VIe5z0KFyk8wqod7pG2mppiZIrn1rW8SxUWOdkxe
	mkn4wkNdSHeKyW6jOvVOB9GFXxiSLCimxtXIpGsCjmQeFdho+VidRR1MdrXcItwF
	CnLJ6U3k6CbuPbFtBIrMLgsFrSyDKGbC0oMyENN7Tfrfu9WeP/lAUXSVx51TQBJS
	/T4Xhpy8e44rXO3Bzlww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmgwghh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 02:08:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40O28sFE013310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 02:08:54 GMT
Received: from [10.110.18.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 23 Jan
 2024 18:08:53 -0800
Message-ID: <db9e61c1-707e-4ab6-b474-261c3a8e115a@quicinc.com>
Date: Tue, 23 Jan 2024 18:08:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] wifi: ath11k: rename ath11k_start_vdev_delay()
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240123025700.2929-1-quic_bqiang@quicinc.com>
 <20240123025700.2929-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240123025700.2929-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JEpgPNF_UXLIi9ijCsGhiHCzj5ykvxxW
X-Proofpoint-ORIG-GUID: JEpgPNF_UXLIi9ijCsGhiHCzj5ykvxxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_15,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=598 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_180855_395228_EF623EB3 
X-CRM114-Status: UNSURE (   5.29  )
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

On 1/22/2024 6:56 PM, Baochen Qiang wrote:
> Rename ath11k_start_vdev_delay() as ath11k_mac_start_vdev_delay()
> to follow naming convention.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


