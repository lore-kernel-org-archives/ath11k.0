Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A566C76195
	for <ath11k@archiver.kernel.org>; Tue, 28 Mar 2023 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wUk234NjXu+SRCju9nX8CnZ652HO5r1rNEKTMlqL/U=; b=Pf1x2o2CxWaVUO
	KqGh4Yi+1k670gxjF/cp/rJm9/nWTNxQFvr7BeheAKJCRf3DJbDuUdvCUwY/Z0IRHkoDAAwvpU1MA
	Sxe5hxJyP5SwmttOS4AXbikJ+HX7/SdXCyH8A/PX7xYU5DIAk8YixPvBnRKgMlOJrbRHdy6/li1Iq
	YZF1MoWCsCpDG3jSkWrlZ7tFsgZQq0z6cnfEihaw+cTpgcP4bgwGQxydwy0j0luQoG57IkZyB1t6P
	mPDUX89yidtafvxLzq6hpezC60VU+b+Ul/ZywtNVlB7ZRFry3pBdEXL0GiGlVbpQia2kdUDet0Q1X
	C3uYMuCv7ufLhYezLEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6K5-00Dt17-3B;
	Tue, 28 Mar 2023 10:13:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6K1-00DszY-1t;
	Tue, 28 Mar 2023 10:12:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S6X1LR026784;
	Tue, 28 Mar 2023 10:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uadENyMN0hZrT4YgeCzeC/+PCCeF8VC49dpAfc3WJUE=;
 b=jT7sB83tWIJRwAhKc5xE1mD/xUcqRjf3FovI2vtulrC3FlTWF4J+HNoRJZZa2heyApSb
 ePNBb5lNusyVx71oFQOO9mTwzdR3BTgO2ewQhs9OAyW50Bu73Qi2fv0K3CL8Pk3ZHSRO
 XpbgxYFf3AAwrNB+AyQfnYH7uWsnZMn/ccw+YluVBlQTTUtem9r0OkKfm1qEBjhrel4Z
 QxduyIIzw1hMdTGFEBBBKehblpXaOiO5t5gNQij2T64BibZtLBcW6dewdmatA4wU9ywZ
 E5jMS1boCq3CnxLOiBlcxYzG0vdAxMk19RHRPbM4EAzcu9OyUizzmEa71GqEHlHx3Q2u Uw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkbywangc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 10:12:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32SACt9r027113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 10:12:55 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 28 Mar
 2023 03:12:54 -0700
Message-ID: <cfc11853-b441-232b-afa3-f6d42e2344a9@quicinc.com>
Date: Tue, 28 Mar 2023 18:12:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/5] SME: Add support for handling authentication with
 MLD
Content-Language: en-US
To: Andrei Otcheretianski <andrei.otcheretianski@intel.com>,
        <hostap@lists.infradead.org>
CC: Ilan Peer <ilan.peer@intel.com>,
        "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
References: <20221206094609.104911-1-andrei.otcheretianski@intel.com>
 <20221206094609.104911-2-andrei.otcheretianski@intel.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20221206094609.104911-2-andrei.otcheretianski@intel.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7Z8UYsVs5ZqTziUMDQpJSsZEXHCoWNHX
X-Proofpoint-ORIG-GUID: 7Z8UYsVs5ZqTziUMDQpJSsZEXHCoWNHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_031257_627870_18DC0A8A 
X-CRM114-Status: GOOD (  14.02  )
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

On 12/6/2022 5:46 PM, Andrei Otcheretianski wrote:
...
> diff --git a/wpa_supplicant/sme.c b/wpa_supplicant/sme.c
> index f6ace37606..a44044079e 100644
> --- a/wpa_supplicant/sme.c
> +++ b/wpa_supplicant/sme.c
> @@ -367,6 +367,194 @@ static void sme_auth_handle_rrm(struct wpa_supplicant *wpa_s,
>   }
>   
>   
> +static bool wpas_ml_element(struct wpa_supplicant *wpa_s, struct wpa_bss *bss)
> +{
...
> +		} else {
> +			struct wpa_bss *neigh_bss =
> +				wpa_bss_get_bssid(wpa_s, ap_info->data + 1);
changed to use wpa_bss_get_bssid_latest() should be better here?
> +			u8 link_id = *(data + 1) & 0xF;
> +
> +			if (neigh_bss) {
> +				if (wpa_scan_res_match(wpa_s, 0, neigh_bss,
...

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
