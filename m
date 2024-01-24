Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD23C47DDB
	for <ath11k@archiver.kernel.org>; Wed, 24 Jan 2024 02:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69hanRqci+Q8/5MZ/MBa58r1Geu9XBuEAXnhSXH+tpY=; b=LfTrDH7Mh1KHMSTQMxbXZ4BOMH
	oxSA34xOccktZB0jjxlVsZM7+JAyQfhtXxMb4jVRnEHxQHoel8NrhrOnA3VBNtjIoM1WmRFhAopQp
	OJLpVNvFRTcPaXR4oo3W3yI3rR83uN/Owm6Lw9ig94T5NxuvUsA1GDikJnnhxRfgXWGwxn6tZh13/
	IDkPQqMCyM5acwYKqIPWIfGGt6+YKJ4WLmymOEv5EDG5yRYzAIkIHhetq8HnFfWPBXJUCb8dPPW9U
	Nd/gKAJXhbn+QQK3aLErQ4Wt+lHF3jJ67JauBRph6F45aR7cxLG97kBh9H03ljbDyQGSPwxbPVeC6
	CUGVnFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSShj-0015Ta-2w;
	Wed, 24 Jan 2024 02:09:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSShg-0015Rt-2S
	for ath11k@lists.infradead.org;
	Wed, 24 Jan 2024 02:09:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O0jjFT005562;
	Wed, 24 Jan 2024 02:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=69hanRqci+Q8/5MZ/MBa58r1Geu9XBuEAXnhSXH+tpY=; b=f8
	1mOIFDJx1jk+J1kxOfqbM5haR3n/rbZSnqItpuNKcukLdmiA6/o04atpDLzoEJKL
	5qgGlYP+cIOkMnbMaubMlDG96xJ3iYiSQiq8+AkUKCK65MOkDJEhbEActAOFlYNq
	6wxIGYzN3b0O5tbmOjlFPZOt9rUVJsiEzWumsWzQUNWI739NKYV5IxdGYplbUtG5
	y240inbod2i+x0/+k84ohwjuqXcMHtjJsG8tmtHgSHs5CqsaXlRJhNNvCAjzxgi1
	vN7EEVuCbRr8r4ipKPnpkMuEkwAJovCHKjNdVDU8eYWo6S08/bUSxlkWO+/NervP
	YqhgO6YSOhGVbOmr1BSA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmhn8hsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 02:09:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40O29EpD025110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 02:09:14 GMT
Received: from [10.110.18.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 23 Jan
 2024 18:09:14 -0800
Message-ID: <2a6677b6-f18c-41ff-8582-d14af8b4d845@quicinc.com>
Date: Tue, 23 Jan 2024 18:09:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] wifi: ath11k: avoid forward declaration of
 ath11k_mac_start_vdev_delay()
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240123025700.2929-1-quic_bqiang@quicinc.com>
 <20240123025700.2929-4-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240123025700.2929-4-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8AMzCeKnMCSe4vkJKf-RrNIWM2bW6c8B
X-Proofpoint-ORIG-GUID: 8AMzCeKnMCSe4vkJKf-RrNIWM2bW6c8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_15,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 mlxlogscore=399 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_180924_918713_FCEBD796 
X-CRM114-Status: UNSURE (   6.89  )
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
> Currently ath11k_mac_start_vdev_delay() needs a forward declaration because
> it is defined after where it is called. Avoid this by re-arranging
> ath11k_mac_station_add() and ath11k_mac_op_sta_state().
> 
> No functional changes. Compile tested only.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


