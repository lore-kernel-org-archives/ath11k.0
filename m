Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADC1C48BEB
	for <ath11k@archiver.kernel.org>; Wed, 21 Feb 2024 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4L37gak8Q3i8cF//A+HSasZokgjhuDXTT2sxETvcuE=; b=I5ZOvwJx3bSk8RaMwXeQFTsIIH
	6ZuNTuKqykFtIG43tdVPo6fejpcjeEKl80F21faqsWtQons+nGhcd2TMHIDUCtGpGMr0RyRzNF11O
	iwMKeFN0Q8Dmby26exKdxrYnB3WSdoT2XWU2UsNjya48Dg9N4tFVgVtSrI5Rk5ISixlJDpoG8xb0v
	WJWwppcwYq/jD9jvt7EMOVkmmpW4uO/eDky0VRv0tf5MgdSAycwfnLfKaXuP1Uw6J6ygTC/XgavFy
	oEYP+/k/m0zOWFy3TodAH5nwERlziAHlpLQo/XufuzLAPNya7mgQQzn6lN43YDVI7Nc9wyqLasXyZ
	9PRKeUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqBH-00000001s0Z-2Lzx;
	Wed, 21 Feb 2024 17:14:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqB8-00000001rte-12uq
	for ath11k@lists.infradead.org;
	Wed, 21 Feb 2024 17:14:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LFt2Tj003738;
	Wed, 21 Feb 2024 17:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=l4L37gak8Q3i8cF//A+HSasZokgjhuDXTT2sxETvcuE=; b=L9
	ZHkSVctqgywMBMDs86FbydWsAhjLl41wG7RXDPDZWKMMdVWmdHbMcyuZg3izRPgC
	CioAY/uiD2CZAA8RC1qbOY6fzX5rwQ15KfB04WZtiOw7RS5FI5oglqmXcD2X6tDW
	fiBQR6jjQaZvRsjINISFuw1w3gB+5cLksoFFVaAxF3oCPV4nll8NhVzG7Os4NNfr
	HpNTK4cyX9tc99MSaTZBbaSrJzH4Nxq0MU8k3MLFKA9AjyJa/t0e2J1KeuzD9tGn
	ndJ15ucfK7x1hGywIP7C5YfxYSgfz8jhf0ufFdJhtVu12iZojcaZuWeJMzMNJq7c
	uaHwD/HdiotnglXdeNiw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd22u2m6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 17:14:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LHEeOq006685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 17:14:40 GMT
Received: from [10.110.34.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 09:14:39 -0800
Message-ID: <08d975f3-7b5a-49eb-9ae1-070221aec86c@quicinc.com>
Date: Wed, 21 Feb 2024 09:14:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath11k: fix warning on DMA ring capabilities
 event
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240221024725.10057-1-quic_bqiang@quicinc.com>
 <20240221024725.10057-5-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240221024725.10057-5-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E9tGocf_UwyNmcJHYZmw3ufgz9M6fWGZ
X-Proofpoint-ORIG-GUID: E9tGocf_UwyNmcJHYZmw3ufgz9M6fWGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_04,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=476 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402210133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_091442_539753_89635B4B 
X-CRM114-Status: UNSURE (   7.20  )
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

On 2/20/2024 6:47 PM, Baochen Qiang wrote:
> We are seeing below warning in both reset and suspend/resume scenarios:
> 
> [69663.691847] ath11k_pci 0000:02:00.0: Already processed, so ignoring dma ring caps
> 
> This is because ab->num_db_cap is not cleared in
> ath11k_wmi_free_dbring_caps(), so clear it to avoid such
> warnings.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


