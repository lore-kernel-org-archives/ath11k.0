Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10A0E7D0A2
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/Zj8XupGW1UBjRmKz7NuqhpooknQ/6/lPMrBO06LPs=; b=uDlRttS8bAFvN2
	m6InPldqPH07neqSiiEyzN3XzDKGpXOZb2dsWo3j0C497yjl1an9misgJ7D3YVG8cP1YElvmdb57z
	37evEEHW3Xgyb5aAeHnIGhSXEVLaHI7uWPDZwHpyhM21nnnsYB+dkIKAg5BpMOp/2p3yCcExMPzcA
	BZfLK0OpMq0werNvZxOlSkppL39BUVHMX+pP+9vc/r2zX1rJtcaTNtBE9YRD2irUO0o/itxKpklGP
	NfeUayhQ/B+rk5G3s/a4Slks9UnZgFY8s/K1XE2fStrW/vBC458Hwm6CI7SfBXaGW4JkSy7EXoquS
	5dW8fOhYtRnha3qRKIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPpk-0071ew-25;
	Thu, 21 Sep 2023 19:59:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPpi-0071e2-2H
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 19:59:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LJeqmA006221;
	Thu, 21 Sep 2023 19:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VvNLRrgGoAincL0S4MZbEFLGQ8oePs+K3SW+5a9KeAs=;
 b=oavXKiCl9nQEgjEqA15FuNGqyjfc74uBorTiWJxAPoiwtWk4TpOOR8iR7fOIU91/qaL0
 bl0/6v/FsPE7U7vIsbdwety+T7v+JctBnKE9muc5cXQhbKpU/EOApmEDcNEySnU/HsqT
 nAJvyGfDP4mE/kqQ3eg3ukD9f13KVK9z5+A4W6eDFehcDbFjmVg/retAogpuYQivpQRg
 pGJn/HOlLAssSZHQ633sFM70r/JGcEgkz1gKeYLpxCbrng0K59D+yr5uein2gZWmNVtN
 /zX7jFzNExnPf61IpJLFyxRGX5q3GT8Tu1xew4Fivayj/sjbkHlU0omqt0w6Y+7sfCZ/ bg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u6ag5wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 19:59:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LJxQIb005843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 19:59:26 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 12:59:25 -0700
Message-ID: <b1b11958-1c73-4257-8f05-71f1c5beb568@quicinc.com>
Date: Thu, 21 Sep 2023 12:59:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] wifi: ath11k: update regulatory rules when
 connect to AP on 6 GHz band for station
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-6-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-6-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eZyN3BcgRYVOMXAvsfbBy5kFG1csc0hV
X-Proofpoint-ORIG-GUID: eZyN3BcgRYVOMXAvsfbBy5kFG1csc0hV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_125930_863345_69E2E7EE 
X-CRM114-Status: GOOD (  11.10  )
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
> When station connect to AP on 6 GHz band, it needs switch the regulatory
> rules according to the regulatory info sub field in HE operation element.
> Switch to the power type which AP used for station interface.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
