Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E682DC25B77
	for <ath11k@archiver.kernel.org>; Mon, 20 May 2024 22:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXw3opE0WCOujUsthmWT0LxdYflSLXqrgOu9efTkPr4=; b=bd/vUhU2Zcf+VanuzEtuNMqX2O
	y11nVKHYNFyYzG+kVmhutmTizMsLrzREPh0Q0aCC3wUGrREgKjuG2TmIlTK3dQnHEDRR+W9iohAyr
	5Gw0cXpAVCAbm5XMK1LE4WStM5soVBIFe0VxtDWACsUNZG/hA5XaJSY5ZFnOeMPC7J/Y/4s+WKf87
	TqBiu6oLsrB6Ivk/kvG/QNteSm9Hzx+oOc8fxg58wFvf4qP8CvSFqZfDJpZ9DFA3dyrNiA1COe2dS
	lXDy5I29NSDqHz7p6gGZfCC7DeXKs+Lclk5F3X5tugEHMQhD4l5+GyCwdqYXE4ZUqaQQRoYK2RyiH
	p6dELmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9BEK-0000000Fe1F-1doz;
	Mon, 20 May 2024 22:11:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9BEH-0000000Fe0T-2XrT
	for ath11k@lists.infradead.org;
	Mon, 20 May 2024 22:11:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KKS5jE028232;
	Mon, 20 May 2024 22:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=VXw3opE0WCOujUsthmWT0LxdYflSLXqrgOu9efTkPr4=; b=D8
	GlTTbRgaUy3nyJ521bPteEufmBOn3WxyjJWPGXhxZHNlhuw1EdMQ6x3QeBw7vXGw
	BGPHXdFEj1fvVbWSmZ5vZYyLXsZum0p4DQdbJqDXsmkifoxlYl8nxr3bLPfWN6rX
	pcHuIWAj4ZIZugjEbHXhY0oYxaH1xM3GMzJCFcJDbE1wZUCtN5VF68hMoH8NTIsN
	JohpgVogPWuy/+8k6M+ySUn1pqUXFUiPPn3m/z6kJz22pvLOfLM4cAE8hn+2S+fB
	lmj017d5dLsYdsmxRLP5d5J3PfgZ/UXTBpo/2d99VW3B062jX80cZUgV9jXcqQVM
	/hKix16G/4BMy24tecDw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3tcvkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 22:11:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KMBWE2001690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 22:11:32 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 15:11:32 -0700
Message-ID: <473a0363-fd91-4d60-97eb-2b07abd56700@quicinc.com>
Date: Mon, 20 May 2024 15:11:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: refactor setting country code logic
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240520024148.5472-1-quic_bqiang@quicinc.com>
 <20240520024148.5472-2-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240520024148.5472-2-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ET4QfBTG5ETnPkXBOpAHLx3JuXKZhbcI
X-Proofpoint-ORIG-GUID: ET4QfBTG5ETnPkXBOpAHLx3JuXKZhbcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_11,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=819
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_151137_818039_83421DFD 
X-CRM114-Status: UNSURE (   6.69  )
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

On 5/19/2024 7:41 PM, Baochen Qiang wrote:
> ath11k_wmi_send_set_current_country_cmd() is called in several places
> and all of them are just simply repeating the same logic.
> 
> Refactor to make code clean.
> 
> Compile tested only.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


