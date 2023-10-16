Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CB4CDB482
	for <ath11k@archiver.kernel.org>; Mon, 16 Oct 2023 15:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWf4VwO/Kd9ejZvxI/zykTTS/8VPrDNfJw5gC9/cH0g=; b=j+wPt+a2mdIK0y
	wFSv4OqriERDcgOxhLr5PWAjLCZh5qNTWmKclXqUaew22zEHPpDBH0s90cOZbUA6X1mL+FleEXsuz
	WKYu2PSr+ch1BRLofukQsFbVpBzTPgb+fF322TZTy6KM3ndRbffg0m36OQhc86Lbc4oWTI3ciwDIG
	wJhSf5HA87DA25a4S7xtFJj/l/xM6cbcXDQDOZTDMz846GG662MUpESxQAdcJse7kzBGBoQRkhEGy
	oSZMvU1VknlxiKH22oHWiNrh7B1guQTVHWvUVNnIHmHjIwZ+XgwOYERIiXRaIKZWqFOxwLum3ZPo+
	/kmR/dM+C9CmXJgdYc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPAk-009wQP-2A;
	Mon, 16 Oct 2023 15:06:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPAg-009wP9-0F
	for ath11k@lists.infradead.org;
	Mon, 16 Oct 2023 15:06:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39GErxec007404;
	Mon, 16 Oct 2023 15:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=C2SeAC1Q96Ooalm6wroPTZmcORSo5/u/+qefyTvRxYU=;
 b=A6F36M73PA61IH9IBNw0bjp4jhuJSe9YHNPVBCR6Rw1MRldtHhShRWYm1kPF16txYRga
 J4L91dZVDzBrnqNDkmZjDMybSBylsdL5mbPaszIi1vJoPiaCf6U67jLy6IOV4pH/lx4F
 BnSvYV6ui6PXWI15oXaEwo48vxGU4hTu4HYEc9ykClEK5k3+612K6n++ktwLjE/6YwO1
 DChdbuDzFunS/HhY9xlAEy+6ZKGk5aY2KEyBkqIAg9JTc9aR7/bvNKVfMnZ+oErqj30H
 xMSLDSKSvbfUzqXYckut8f1/Ln9iTXbuRJ4DXmk93pUrSVu9FEuSADQwn+YWvpPyNxBX ew== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tqhxychxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 15:06:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39GF6Fvd012505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 15:06:15 GMT
Received: from [10.48.240.22] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 16 Oct
 2023 08:06:15 -0700
Message-ID: <4df22a30-80a7-4a61-a3c2-8ac91afe578a@quicinc.com>
Date: Mon, 16 Oct 2023 08:06:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: rename the wmi_sc naming convention to
 wmi_ab
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231014032650.32605-1-quic_periyasa@quicinc.com>
 <20231014032650.32605-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231014032650.32605-2-quic_periyasa@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qrihCxL0CgrbHdOOih5zarhI2oNuGHHh
X-Proofpoint-ORIG-GUID: qrihCxL0CgrbHdOOih5zarhI2oNuGHHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_08,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=654 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310160130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_080618_122093_A8EA9173 
X-CRM114-Status: GOOD (  10.47  )
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

On 10/13/2023 8:26 PM, Karthikeyan Periyasamy wrote:
> In WMI layer module, the identifier wmi_sc is used to represent
> an instance of ath11k_wmi_base structure. However, within ath11k,
> the convention is to use "ab" to represent an SoC "base" struct.
> So change the all instances of wmi_sc to wmi_ab.
> 
> Compile tested only.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
