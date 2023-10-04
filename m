Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C636E7C4EC
	for <ath11k@archiver.kernel.org>; Wed,  4 Oct 2023 18:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvViYOvOcBDZSmzkuHFIz/6eOUGeDTyUCpXmj0KEc8g=; b=C2FKtYDKESA9ZjkMBOVgemYbIq
	fBKsx67FbzEmumF2dDbMLrDbWWcb+nym/+XkY2kXglZuuCeYimD7dYhmGoNslf/r6Buc9e2QctG29
	zk/QNThOzT9mZOhj0WEgOSet4VoXjtki0iNqnW/fFm13LkD79WWqk5stlz2h788dKSXPJbyM9Prf7
	svbC48r/yafsRrLBMpaP5rwzFD/eftk68EqA4Nr9/XoTKO1YlzVMIWpK9OZuyokjuLpzOBhbOloMI
	BeR/+0ZwaUfw3Pto/xz2DTmq+HTIO/NBvlJwIiowg46exhubOoS6WVzY7YFiD+4csHezkvNlVoaWC
	LLFSfgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6qh-000ifl-1D;
	Wed, 04 Oct 2023 18:43:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo6qd-000iey-2E
	for ath11k@lists.infradead.org;
	Wed, 04 Oct 2023 18:43:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 394F9GBh026440;
	Wed, 4 Oct 2023 18:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kZWfjt5V3IbwYrf5EfEMzLfYYvVFujGo/GJ6wbMdilg=;
 b=f2VBtTjKwXehzdzkbvNd7pr0k8lh1IOqgZbkycha/i3pXXRazxtimuHYvrhM3GVDoIO+
 riNqlAmMyp2g4I9Wwn6yR8u/4mv1A9UjHyvH1PiEJGgSniPMHHA+SlGEfn+IgvQdV5/x
 ve++IGP2JT/XjNopmkxA96uPDMUIdOcZ7t2d3Bh5poOsIiPsp8/DEyIrO+B+sZ4rwSFY
 LsUOud/oD+qfaU5QFw30bxL7WDrEck4VgH5a7ZbOwxF78s0ivKxUEQ1RivWTpiCGuXSD
 pohiaUBZWYa6loAyOuHl813V9hHUEszvNVmrqDFW0BQVk5CW9iAIE2jZFBqHK1ebr6om ZA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3th18jhv27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 18:43:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 394IhmVD013862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Oct 2023 18:43:48 GMT
Received: from [10.111.179.185] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 4 Oct
 2023 11:43:48 -0700
Message-ID: <d9735f1f-5bcb-4768-90d2-ebe3c1c72d07@quicinc.com>
Date: Wed, 4 Oct 2023 11:43:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: call ath11k_mac_fils_discovery() without
 condition
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20231004044915.6817-1-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231004044915.6817-1-quic_alokad@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1UuFBlFkAqoZunuR7hxjbo1G1lPfRDq_
X-Proofpoint-ORIG-GUID: 1UuFBlFkAqoZunuR7hxjbo1G1lPfRDq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=410 bulkscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_114351_844165_C6E2883F 
X-CRM114-Status: GOOD (  10.98  )
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

On 10/3/2023 9:49 PM, Aloka Dixit wrote:
> Mac80211 does not set flags BSS_CHANGED_FILS_DISCOVERY and
> BSS_CHANGED_UNSOL_BCAST_PROBE_RESP if there are no updates to
> FILS discovery and unsolicited broadcast probe response transmission
> configurations respectively. This results in the transmissions getting
> stopped during BSS change operations which do not include these
> attributes. Remove the checks for the flags and always send the existing
> configuration to firmware.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
