Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFC7C54E5D
	for <ath11k@archiver.kernel.org>; Mon, 18 Mar 2024 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv518dmYEwtTR+TjjPyC6YIb0i+sx73V1gS2n1N7lFE=; b=cNskV8FWhizcQmtrZ6cJ8neViI
	zLf52v+owATHfL//EV8CiqlxOAwdQkizu4QdafyxStrw6rVv5sXEuvueg7XyGTAjzCYLdgVcrIJbU
	ZJdxJyproON13bsZdiQiTP9+qxER4WJrCp8W25vPVZhQhzK1v3xXCDEZGfCsNuGeM4ZnAxEUmImyL
	xRmdtJMLn2hHzoFsblchl+CO20D4rJp6e8oyAjUnoZ06R9IgEbOGStQzq+yq2jvPY77cHM7VeI5xu
	8OlKLnWxoIZ+XirvyyH4LCLd9fcDz9ysbrJSHVTw+YeJpD+6KEnSToweoxQHRYiR46cTpUITtVtrh
	C3lca8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmIr8-00000009smD-0FJn;
	Mon, 18 Mar 2024 19:41:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmIr4-00000009skc-1Tql
	for ath11k@lists.infradead.org;
	Mon, 18 Mar 2024 19:41:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42IDTbm5009153;
	Mon, 18 Mar 2024 19:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wv518dmYEwtTR+TjjPyC6YIb0i+sx73V1gS2n1N7lFE=; b=pE
	//NR0JkPfv5Vm1njMkPfe6C8ItrtGqNiCq/2wSJ+5SOWYQ76UPfUe8/KqmXAD52f
	76WD5QLkWvfz10RuVqemzerPfMuS4/s/Gj0DiWCMPWiIE/yUBF1wXnm42AmxxEX6
	NkVu8umOuhb6427C+gtbGMLWJAM/W5fqzp4y7MYIXXzT1Huf/TawC8gPtQiNLm6D
	PS4m0Cn+sH0+K8zIkuTQlQDxDec+IMcvrdAMwcldgAEizexi6o6oUwf/vMZbkxFI
	EfsaYc+fFR9aCHax/C2MEQlbTiCWoEbTr5L8MHjB1K0ThaQruvWnPz6SSg44NS3D
	aT2x7HMAEDLTSJ96+A3A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wxmnjs4r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 19:41:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42IJf2GQ031024
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 19:41:02 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 12:41:01 -0700
Message-ID: <2e46eb4e-daa9-46ad-acc5-4a7e1321a5bc@quicinc.com>
Date: Mon, 18 Mar 2024 12:41:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix memory leak in ath11k_xxx_remove()
Content-Language: en-US
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240315014307.3132980-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240315014307.3132980-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O5zhKu4OInZ2TzPAHCBbVTzetMYI2cW2
X-Proofpoint-ORIG-GUID: O5zhKu4OInZ2TzPAHCBbVTzetMYI2cW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 mlxlogscore=471 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403140001
 definitions=main-2403180149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_124106_446903_DC843CF5 
X-CRM114-Status: GOOD (  10.02  )
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

On 3/14/2024 6:43 PM, Miaoqing Pan wrote:
> The firmware memory was allocated in ath11k_pci_probe() or
> ath11k_ahb_probe(), but not freed in ath11k_xxx_remove() in case
> ATH11K_FLAG_QMI_FAIL bit is set. So call ath11k_fw_destroy() to
> free the memory.
> 
> Found while fixing the same problem in ath12k:
> https://lore.kernel.org/linux-wireless/20240314012746.2729101-1-quic_miaoqing@quicinc.com
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 1 +
>  drivers/net/wireless/ath/ath11k/fw.c  | 1 +
>  drivers/net/wireless/ath/ath11k/pci.c | 1 +

My Qualcomm Innovation Center copyright checker reports:
drivers/net/wireless/ath/ath11k/ahb.c copyright missing 2024
drivers/net/wireless/ath/ath11k/fw.c copyright missing 2024

Kalle, do you want a respin or will you handle this?
With copyrights fixed you can add my:
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


