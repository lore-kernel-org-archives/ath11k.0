Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC8FEE4996
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 15:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7jREZJ/zm4+dCWIxKgWaE4/mEKovxsUpSR89wGBtUM=; b=jvbxH8oOdsF0bB
	hexoWGDzCDURB2pV6R7j4Qd2E5xIlqA3HAUk++eBnTDzrnCEQEXOnKTpvCyVU8ind2rWA9q4tIMaP
	d93S/Rz3TirvrOC9feUM96BZGTxzzwx0DNJGN/pH1/n1aUUnZ/5J5VAf6Twvo7xtI1OlhX/g3SC5w
	zdmyHcQw7SD/sjz2HTagOWlpjaZIccrl5v5NC7uFNltNPqp9iJVZcXz6Pago3x9RuzS98kUTk1qg7
	wbmIprKdZXbm1caGOyXdrhiR6DDCrjAI/MjihGg3tsq1TKFcGEDaUOwLqlil9QQcaClO3ZRUjOIXu
	5fVjK+eoRzPqjqLnvhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYStf-00GHn6-0L;
	Tue, 22 Aug 2023 15:02:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYStb-00GHln-2A
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 15:02:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37MB1IJ2003786;
	Tue, 22 Aug 2023 15:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CuMTWblGS3A2z4YMgdUpOGqamQbI/mszhGSo+3xALkI=;
 b=aKmNBnUlaI625IqBFStqKdgQiO5R2l0HZ1Lse8mAPNofnTDoLkZxWQfRvxoRL44RZU75
 sDd19AHJneQm7hsCbaA5odcJ67Q4wHLsVYH8d/irFauLiNb/O2G3tb2NgjAO5/ZJ2tUi
 Vmlh/32jLqc5RUkqeiM+BSZmQF6eM0hpOg1lDbJfrZ3TPo7IJjH3/sAbnU3BXg27SWex
 ZJNYpJdIttoY+4mTsW04Eyue5lIsvM0VG4LtuxPSJNP0pZ+04CqJBMAJIAsADf48MnI8
 4iCukTb3Q8+dagxNAgAIljkksodvWoB5DFSA0+KSgC+zQQyNid5AkMA/0XGbvEg8WgRD dw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3smusbrjqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 15:01:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37MF1ooS004609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Aug 2023 15:01:50 GMT
Received: from [10.48.244.52] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 22 Aug
 2023 08:01:49 -0700
Message-ID: <dbf69fb2-cdbf-488d-a2fa-f1ca33374024@quicinc.com>
Date: Tue, 22 Aug 2023 08:01:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: cfg80211: export DFS CAC time and usable state
 helper functions
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>
References: <20230607124647.27682-1-quic_adisi@quicinc.com>
 <20230607124647.27682-2-quic_adisi@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230607124647.27682-2-quic_adisi@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Yd0iu8qy1bXLWdwZRfWwV_5JieAZkMyK
X-Proofpoint-GUID: Yd0iu8qy1bXLWdwZRfWwV_5JieAZkMyK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_13,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 mlxlogscore=886 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308220114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_080215_736446_03A8044C 
X-CRM114-Status: GOOD (  13.79  )
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

On 6/7/2023 5:46 AM, Aditya Kumar Singh wrote:
> cfg80211 has cfg80211_chandef_dfs_usable() function to know whether
> at least one channel in the chandef is in usable state or not. Also,
> cfg80211_chandef_dfs_cac_time() function is there which tells the CAC
> time required for the given chandef.
> 
> Make these two functions visible to drivers by exporting their symbol
> to global list of kernel symbols.
> 
> Lower level drivers can make use of these two functions to be aware
> if CAC is required on the given chandef and for how long. For example
> drivers which maintains the CAC state internally can make use of these.
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
