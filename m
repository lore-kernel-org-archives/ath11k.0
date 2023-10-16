Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE908CDB465
	for <ath11k@archiver.kernel.org>; Mon, 16 Oct 2023 15:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SbVhfRA4VOK4jenD7E4pE8UFS77I2Joa6dos14NPq0=; b=1hcfg/6GDTJoWz
	CriwficYtBwuz01kv9dzvGnmOC/Nxxhf9zsGQl7Z8b4nxLF1ZQbva7cm8AHTAq37UnVy070VbjEpl
	XwAnRBBfVyRtP+TugIem2BFEETJCa/Q0NBHJ2RIZ1VuWLr9ug+TuMkGrbnGd50SjLlzHMZX9G6obb
	s7oq+AzFlEylpE7JNWc4bDFq+YjlpnmuE08ZtzRPvWyxTdSYKJwODyvu0VENUKiHpLN+KcmyGbNym
	aQ56cPstd5iO4ZcwaJMFJ19cSa1oEj6hkgNPH/A11n9P38Fu8M81AuRZTUCnbPyCtsAaSdJpAnrqe
	IObSt8NPqGyFcM1k+m0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPAl-009wQW-0G;
	Mon, 16 Oct 2023 15:06:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPAi-009wPl-0f
	for ath11k@lists.infradead.org;
	Mon, 16 Oct 2023 15:06:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39GEs7aY015103;
	Mon, 16 Oct 2023 15:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oF12tz+JLezYGpakyxa8Dk2bGvTJkoIJmuk+74TkI30=;
 b=nhd6+Wr7vsrBwII49Qyxdvec5HfJ307xrueKO1HlaS6lQoE9FpL7tWfypW0VYc5c88XG
 h4gSAlHqGTgizdn7/QTsvR0RncTG/KQSJMGECheMiE04pyGDhhVbu9G7zUSU2GkaNC/z
 CN+xEQt79igqlPOZdDGAM/WTgGOOz+39fmEHcAZqkNg/Wgk6E+v9pBuQBgn6q8iJZ6JT
 nh1iSNf5Kw96eZcUNyA5GXybQ45tcrlvnMftghP98TbCVxhAjzoCVA1GxoSR9Kx+unr9
 yqkDAmisZLJjMXYUDu30t5Er8mcMwpZFacKeuLMxl78loUqza/yDnEqOSHosLpKBFkvd Lw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tqgpp4p1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 15:06:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39GF6J6I012517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 15:06:19 GMT
Received: from [10.48.240.22] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 16 Oct
 2023 08:06:18 -0700
Message-ID: <029d6524-7443-4b6c-93ea-cd9e2a9285e6@quicinc.com>
Date: Mon, 16 Oct 2023 08:06:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath11k: rename the sc naming convention to ab
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231014032650.32605-1-quic_periyasa@quicinc.com>
 <20231014032650.32605-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231014032650.32605-3-quic_periyasa@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D_e7gkzYTuB-8zd8rN7zE4-ORC1D_TbY
X-Proofpoint-GUID: D_e7gkzYTuB-8zd8rN7zE4-ORC1D_TbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_08,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxlogscore=617 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310160130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_080620_251006_BA6D3FCF 
X-CRM114-Status: GOOD (  10.13  )
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
> In PCI, thermal and HAL interface layer module, the identifier
> sc is used to represent an instance of ath11k_base structure.
> However, within ath11k, the convention is to use "ab" to
> represent an SoC "base" struct. So change the all instances
> of sc to ab.
> 
> Compile tested only.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
