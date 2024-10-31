Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB226D767E1
	for <ath11k@archiver.kernel.org>; Thu, 31 Oct 2024 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAR39LrXvYxTV/DMCKVwA/tT+QC4Y9AGkQ0zqWcpqlM=; b=1hY37SVwi5U1KVtZ95xgonwVX2
	YBaZ4QXCYqKYTZL5qjdUTbxD3uvAC0aOFuWbrXw5A8GM2S3vRlADLWrgxNrZlj3bM9PnrWeqfW33V
	bciq2rZsApW6nHrRZ8RaXFm//NMMktroRzjdCcJpM4gBkrId0Bd0zBjmsR6tfLllxKXxvfWQda+Y5
	kjfm+IPnDoxVFFdFmciY6n7BLs2NnKUJmTZB/eUfL97FJuif6kNDlRTKEE6Oeu2u5rklPJWRT2LCd
	Jp87ZoF/8s1h9WE0PBSlxXtp2qx8ED1kRlWNTZHMOOqJMoUHKuzGEWbHTVDTzqYlzBjWtEqFukzqV
	JhWHuTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YIe-00000004FA7-1v4q;
	Thu, 31 Oct 2024 16:45:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YIK-00000004F2e-3Dn5
	for ath11k@lists.infradead.org;
	Thu, 31 Oct 2024 16:45:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VDMHEU027403;
	Thu, 31 Oct 2024 16:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAR39LrXvYxTV/DMCKVwA/tT+QC4Y9AGkQ0zqWcpqlM=; b=Ou4ucsEoZEltxFDt
	GFvdbQ43oHpF2UCff9J3ifTGgeX1Q2Ny7wY+6kUYdZsWzYk8Vldhhf27rhqGLdAn
	+iiGr4CSG1G2+bQyJNnzagt/L6Rz5JIXOdsewRsf/t+y0tvzzo92ggL95PmV63Tr
	ZN5kyxzI3n0aFaI6PfyiqoSrI4Xad7Rdpe294jTgpDrgokixCT6EP6feY4ptZNaa
	sy7o8dnEeJiFGwa/YUL+SWn2NLpApPmiDFBk2O06wj3Ll5sIKP/+LtE9oabe1Qu6
	epbazYG0TxNmqVZcBypOD6MmZ7x21pt4S5kz6MVSRUpC2Gp0HEiRV1CjLqR1nWfZ
	SwEbvA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k1p37mgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 16:45:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VGj91h025026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 16:45:09 GMT
Received: from [10.48.242.225] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 09:45:08 -0700
Message-ID: <95911a1e-db8c-4aba-939b-7dbd95c99ea8@quicinc.com>
Date: Thu, 31 Oct 2024 09:45:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix unexpected return buffer manager error
 for WCN6750/WCN6855
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241030114625.2416942-1-quic_bpothuno@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241030114625.2416942-1-quic_bpothuno@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3yGu4kOqbSYFeDnZBdtx6zafy2VFe6bQ
X-Proofpoint-ORIG-GUID: 3yGu4kOqbSYFeDnZBdtx6zafy2VFe6bQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 mlxlogscore=695 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_094512_959124_F73BF962 
X-CRM114-Status: UNSURE (   9.89  )
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

On 10/30/2024 4:46 AM, Balaji Pothunoori wrote:
> The following error messages were encountered while parsing fragmented RX
> packets for WCN6750/WCN6855:
> 
> ath11k 17a10040.wifi: invalid return buffer manager 4
> 
> This issue arose due to a hardcoded check for HAL_RX_BUF_RBM_SW3_BM
> introduced in 'commit 71c748b5e01e ("ath11k: Fix unexpected return buffer
> manager error for QCA6390")'
> 
> For WCN6750 and WCN6855, the return buffer manager ID should be
> HAL_RX_BUF_RBM_SW1_BM. The incorrect conditional check caused fragmented
> packets to be dropped, resulting in the above error log.
> 
> Fix this by adding a check for HAL_RX_BUF_RBM_SW1_BM.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00258-QCAMSLSWPL-1
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Fixes: 71c748b5e01e ("ath11k: Fix unexpected return buffer manager error for QCA6390")
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


