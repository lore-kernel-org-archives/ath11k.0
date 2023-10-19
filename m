Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20265CDB482
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcNxBtPjs4hCSpIe+28fg6WJEwQkeQR93DTNL506m+U=; b=ZZPVVCSN5x4U2t
	5Z1qFzjn8eMFZwv5gYbxKX5l+DoJosXIujKIS4cvMU2FWIgapzYx5mf3DARiD+i/4AK7zTOvHloES
	3L6C8TzruIQviBHMJXILWf7M9L6GHE97Ojbl4JHXKMUVKYYlU17EKrV19vc4Wh78oMK7q/G1SLxE6
	zO/kNuBMcri/3mwVUEY8sp+lV5M7UEiPSBEVoEJhjqSza50BhopnUgbFzo91Gjiv6OdjFSQ4ENKrs
	bNKLaaEMwupHDwkJWMIOqVlItj6ruRBU63gNV0aT6x/1FkN9EbL+fzyqQN0u1UkdGtk79MjCZ8o1Y
	eExjusnxpSUxLAC1PmoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUdI-000AKb-0p;
	Thu, 19 Oct 2023 15:08:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUdF-000AK4-0x
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 15:08:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JDpONf029879;
	Thu, 19 Oct 2023 15:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=TjzRtNcS/wYNDP+4iS5V2qa6tIiyodzJUbGVz2EJSVA=;
 b=fQ2qm6zyekabZfkFHxZV6oe9zAdZRia9aA7ci88sOI+pXlXkC0NtDssryc2oPpfuBwmm
 hA9JHWAffpoltmCKLuyGyulGyLUQP60sEAvUvs0bTQg7xcu7Jr8HcPKOvEpmJHsbCSjM
 FG+C7YJa2uINIQOC6nMGhGMn6twUtww6YCBhwkUFvxvaIGXrYO5X/LVlmaf3tc+Vr3gu
 mqrp84jCcSU4rnYov+myNTyXz8wqb7sb12N57XzQgtEmt5OGvY4w5J6m7OsoBDuiCuuV
 KQ80o/UG8uawW38eHGffo8W0kTXXHVihnUC/WoUMah/bE8ctrP4TATKVrOB8lJw0MjCj 4w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttcuv3h0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:08:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JF8DvE012961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:08:13 GMT
Received: from [10.48.241.70] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 08:08:12 -0700
Message-ID: <4262a250-585b-4cee-80d0-3fd56af94cad@quicinc.com>
Date: Thu, 19 Oct 2023 08:08:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath11k: fix dfs radar event locking
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20231019104211.13769-1-johan+linaro@kernel.org>
 <20231019104211.13769-3-johan+linaro@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231019104211.13769-3-johan+linaro@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NuVRREd2tCqoe2Cn19_FuEZYRU2ak-lC
X-Proofpoint-GUID: NuVRREd2tCqoe2Cn19_FuEZYRU2ak-lC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_14,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=473 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_080817_449941_F74612F6 
X-CRM114-Status: GOOD (  10.84  )
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

On 10/19/2023 3:42 AM, Johan Hovold wrote:
> The ath11k active pdevs are protected by RCU but the DFS radar event
> handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
> read-side critical section.
> 
> Mark the code in question as an RCU read-side critical section to avoid
> any potential use-after-free issues.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org      # 5.6
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
