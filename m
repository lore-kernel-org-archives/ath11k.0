Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E7ECD4F43
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvuLY+msgUdjY3qtkyDZupPrVTFXqFdWC3JF7F0P5Oc=; b=LC29A0U4kcb9So
	uspCmdziiLtuwbs0i+wnA1SVnKODCYG2TsL3fcSqzrHcjdGlB/GpRKNadsWilBr+qDt/R8pf6pupC
	QkklJg/Vp1AlG0l43MwSKuJM9OPxuvVxvhX+bcEFohmRMXKArv3nyb/vnkC+I3eTHQ/pxY8jucTyy
	fh5wEdDlPhG/4XKfuBuY/YAJ8wawSQ1W1XyxmCALPwmAD9SwULXwzg3EcrXZd/MxQapABUNffvCTF
	VQatxkLdRjtIS6kJ+oSuNMB8YX47kEfNHOqLuoY7rqyllmHTFMJitGltcIGkY1dcECX61IM52G6Rd
	BiYAYFNwuUh+77TgCJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcn7-008dKT-0J;
	Fri, 22 Sep 2023 09:49:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcn4-008dJl-1l
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 09:49:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M8h7oO003329;
	Fri, 22 Sep 2023 09:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TcdXJXxl5MZX7T9sGGxWFjxES5xGmOFnm+h4+rYR2hk=;
 b=aMNmjyrZBs8mThIeojNk7hEKf2R+kpcK1RJ7BAMeOaXrWq1en3IkUjTJ5yYoTLQFLF2s
 8VjkRAV5BtvRVZGQp1PC8AAePslm4x8AQsgPEpQZiA60kdlZPXPqQJk2Nt+0Zo3mcaTV
 sE6OepYcgAHcKrl4CFFnxzNvBN1Cu9Qfyoay/CKTVTKlCDv2EgPFfA2moQMkZ2DY3qIP
 DCDzg0dqAL3ue3Vpe51k9I4H1oCfipkKQs1lOg2OPBd82J2eJI148hF+Gxi6NG1ANrC2
 Zz1tPpSS9ZF937E+mKRzw6s4FQBSkHVmLODwtfErVUlUeQVOMbnH3KVqYPpE+QZchFYz 1A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u0s1j21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:49:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38M9nZbU025978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:49:35 GMT
Received: from [10.216.13.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 02:49:32 -0700
Message-ID: <0bcb54dd-7248-40bc-b271-36f9ba8eca11@quicinc.com>
Date: Fri, 22 Sep 2023 15:19:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] wifi: ath11k: save power spectral density(psd)
 of regulatory rule
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-7-quic_wgong@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20230920082349.29111-7-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DogMEjNlVIyiBbLa3lpgy1PXiqes2lin
X-Proofpoint-ORIG-GUID: DogMEjNlVIyiBbLa3lpgy1PXiqes2lin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=841 spamscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_024938_588300_C99B436F 
X-CRM114-Status: UNSURE (   8.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 9/20/23 13:53, Wen Gong wrote:
> Save the power spectral density(psd) report from firmware to struct
s/psd/PSD     since its an abbreviation.

> ieee80211_reg_rule. 
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
