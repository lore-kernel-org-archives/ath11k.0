Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116FAE7D0A6
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 20:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqNBfHya2E2PSbvI15t1NaeOVpFzYuQRoNahfI3U1OI=; b=BPyDftMs5Lkxyz
	YljUhhT2i+87Kai5MB5xDqqhp0+WKKbCiEuTS9nMPxNdLTZwy6e0NR2tKs+RFOmn4AbHgU0zGtNyA
	ItWkwyOe+CbgVM1YBeoep4t3DMBP/gu0+62kzHRyd8HF3xwGWZL1wnb4tgm/DNgbahw1RGvSjHmpX
	M8YJE4GxKrbRE+mcNWltMqEmecQQn5SZm6TRfwmzXlYrY5GyU9k76FOwSD4CHhkJKbzpn9dku/5VO
	XNVMaE6ZbYx6kDMBEvopQhExprl5oWH4P8s3iJpnfqJHKDPnmyei34bLF6Y4dnbQjF7JvyoKj6+eE
	ynEQCiMlOTibPwdRIbBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQ3A-0073mk-2T;
	Thu, 21 Sep 2023 20:13:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQ38-0073m9-1u
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 20:13:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LJw5hr015371;
	Thu, 21 Sep 2023 20:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qTesSgBg1QboKpF2OtIcNTCPmAo6oIuv2rCjCrxNasM=;
 b=lvidFn/bcM3lAECRbRApMfARbI0lkEVhqSx0R4/TI8uOuu6qnKCyL4qS/Oy1/99CGklp
 v46TKi/DlzhhC1nbOydf8xh0h2GSLGbQ4rhOwlCQWUmkw/Ojaeck+QvAu+/+hbtQdnhc
 3Mf9uDofyCxjXlZaprEhMfaHjMNk6B3fOuRmA0Sm/8vVyVh63J3wUTWokjgeWrq1ezTK
 LlfLiaJsf8JyYIFPp7Ss86bOh3/riyMV+uXiQF2596reMmQWzloMcM2KSpIqZFD4bVqn
 H+6KWjUJPyyR7lWf1yMYOBAaZw811EtGlOp+Bdqr2Z4DYfBFLKOLEF5VOVUKWTJ7R9ME xw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u0s073r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:13:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LKDJi9031918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:13:19 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 13:13:18 -0700
Message-ID: <f1b3c73e-b07f-4713-b88a-e8496c46271f@quicinc.com>
Date: Thu, 21 Sep 2023 13:13:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/13] wifi: ath11k: add
 WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT service bit
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-11-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-11-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QVb5BuMvbY2U2GNo190yXxLs-P54979c
X-Proofpoint-ORIG-GUID: QVb5BuMvbY2U2GNo190yXxLs-P54979c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=663 spamscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_131322_638394_4F65EF8C 
X-CRM114-Status: GOOD (  10.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 9/20/2023 1:23 AM, Wen Gong wrote:
> Firmware advertises support for SERVICE_EXT_TPC_REG via a WMI service bit.
> Add the definition of this service bit so that a subsequent patch can
> check whether or not firmware supports this service.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
if only all reviews were this easy
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
